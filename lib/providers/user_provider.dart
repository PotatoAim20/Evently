import 'package:evently/firebase/firebase_manager.dart';
import 'package:evently/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  User? firebaseUser;
  UserModel? userModel;

  UserProvider() {
    firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) {
      initUser();
    }
  }

  initUser() async {
    userModel = await FirebaseManager.readUser();
    notifyListeners();
  }

  clearData() {
    userModel = null;
    firebaseUser = null;
    notifyListeners();
  }
}
