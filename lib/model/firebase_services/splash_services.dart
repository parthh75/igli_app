import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:igli_financial/view/login_screen.dart';

import '../../view/main_screen.dart';

class SplashServices {
  void isLogin(BuildContext context) {
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;

    if (user != null) {
      print("45175656754===>");

      Timer(const Duration(seconds: 2), () => Get.to(() => const MainScreen()));
    } else {
      print("45175656754");
      Timer(const Duration(seconds: 2), () => Get.to(() => const LoginScreen()));
    }
  }
}
