import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/models/task_model.dart';
import 'package:evently/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseManager {
  static CollectionReference<TaskModel> getTasksCollection() {
    return FirebaseFirestore.instance
        .collection('Tasks')
        .withConverter<TaskModel>(
          fromFirestore: (snapshot, _) {
            return TaskModel.fromJson(snapshot.data()!);
          },
          toFirestore: (model, _) {
            return model.toJson();
          },
        );
  }

  static CollectionReference<UserModel> getUsersCollection() {
    return FirebaseFirestore.instance
        .collection('Users')
        .withConverter<UserModel>(
          fromFirestore: (snapshot, _) {
            return UserModel.fromJson(snapshot.data()!);
          },
          toFirestore: (model, _) {
            return model.toJson();
          },
        );
  }

  static addTaskFav(String id, bool flag) {
    getTasksCollection().doc(id).update({'isFav': flag});
  }

  static Future<void> createEvent(TaskModel task) async {
    var doc = getTasksCollection().doc();
    task.id = doc.id;
    await doc.set(task);
  }

  static Future<void> updateEvent(TaskModel task) async {
    var doc = getTasksCollection().doc(task.id);
    await doc.update(task.toJson());
  }

  static Stream<QuerySnapshot<TaskModel>> getTasks({
    String? category,
    bool? isFav,
  }) {
    if (isFav == true && category == 'All') {
      return getTasksCollection()
          .where('userId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .where('isFav', isEqualTo: isFav)
          .snapshots();
    }
    if (isFav == true && category != 'All') {
      return getTasksCollection()
          .where('userId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .where('isFav', isEqualTo: isFav)
          .where('category', isEqualTo: category)
          .snapshots();
    }
    if (category == 'All' || category == null) {
      return getTasksCollection()
          .where('userId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .snapshots();
    } else {
      return getTasksCollection()
          .where('userId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .where('category', isEqualTo: category)
          .snapshots();
    }
  }

  static Future<void> createUserAccount(UserModel user) {
    var docRef = getUsersCollection().doc(user.id);
    return docRef.set(user);
  }

  static Future<UserModel?> readUser() async {
    try {
      DocumentSnapshot<UserModel> docRef =
          await getUsersCollection()
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .get();

      return docRef.data();
    } catch (e) {
      return null;
    }
  }

  static signUp({
    required UserModel user,
    required String password,
    required Function onError,
    required Function onSuccess,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: user.email,
            password: password,
          );

      user.id = credential.user!.uid;
      createUserAccount(user);
      onSuccess();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        onError('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        onError('The account already exists for that email.');
      }
    } catch (e) {
      onError(e.toString());
    }
  }

  static login({
    required String email,
    required String password,
    required Function onError,
    required Function onSuccess,
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      onSuccess();
    } on FirebaseAuthException catch (e) {
      onError(e.message);
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
}
