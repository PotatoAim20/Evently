import 'package:evently/models/userData.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseManager {
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
