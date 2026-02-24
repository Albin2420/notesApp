import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:notesapp/src/data/services/storage_services/storage_services.dart';
import 'package:notesapp/src/presentation/screens/home_screen/home_screen.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final obscurePassword = true.obs;

  void togglePassword() {
    obscurePassword.toggle();
  }

  Future<void> login() async {
    try {
      EasyLoading.show();
      final email = emailController.text.trim();
      final password = passwordController.text.trim();

      if (!GetUtils.isEmail(email)) {
        EasyLoading.dismiss();
        Fluttertoast.showToast(msg: "Invalid Email,Enter valid email");
        return;
      }

      if (password.length < 6) {
        EasyLoading.dismiss();
        Fluttertoast.showToast(msg: "password be minimum 6 characters");
        return;
      }

      await StorageService.saveTokens(
        accessToken: "dummy_access_token",
        refreshToken: "dummy_refresh_token",
      );

      await Future.delayed(const Duration(seconds: 1));

      EasyLoading.dismiss();

      Get.offAll(() => HomeScreen());
    } catch (e) {
      EasyLoading.dismiss();
      log("💥 Error in login():$e");
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
