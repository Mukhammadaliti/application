// ignore_for_file: depend_on_referenced_packages

import 'package:cashe_register/app/modules/auth/views/auth_view.dart';
import 'package:cashe_register/app/modules/home/views/home_view.dart';
import 'package:cashe_register/app/modules/home/widgets/custom_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.userChanges());
    ever(_user, _intialScreen);
  }

  void login(String email, password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      customSnackBar('Success', '', '');
    } catch (e) {
      Get.snackbar(
        'About Login',
        "",
        backgroundColor: Colors.redAccent,
        snackPosition: SnackPosition.TOP,
        titleText:
            const Text("Login failed", style: TextStyle(color: Colors.white)),
      );
      print(e);
    }
  }

  void logOut() async {
    await auth.signOut();
  }

  _intialScreen(User? user) {
    if (user == null) {
      print("LoginPage");
      Get.offAll(
        AuthView(),
      );
    } else {
      Get.offAll(
        HomeView(),
      );
    }
  }
}
