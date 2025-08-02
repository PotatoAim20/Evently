import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/models/task_model.dart';
import 'package:evently/models/userData.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseManager {
  static CollectionReference<TaskModel> getTasksCollection() {
    return FirebaseFirestore.instance
        .collection('Tasks')
        .withConverter<TaskModel>(
          fromFirestore: (snapshot, _) {
            return TaskModel.fromjson(snapshot.data()!);
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

  static Stream<QuerySnapshot<TaskModel>> getTasks({
    String? category,
    bool? isFav,
  }) {
    if (isFav == true) {
      return getTasksCollection().where('isFav', isEqualTo: isFav).snapshots();
    }
    if (category == 'All' || category == null) {
      return getTasksCollection().snapshots();
    } else {
      return getTasksCollection()
          .where('category', isEqualTo: category)
          .snapshots();
    }
  }

  static signUp({
    required Userdata user,
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
}
