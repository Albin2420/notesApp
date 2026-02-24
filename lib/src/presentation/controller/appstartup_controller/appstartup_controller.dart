import 'dart:developer';

import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:notesapp/src/data/services/storage_services/storage_services.dart';
import 'package:notesapp/src/presentation/screens/auth/login.dart';

import 'package:notesapp/src/presentation/screens/home_screen/home_screen.dart';

class AppstartupController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      final token = await StorageService.getAccessToken();
      log("token:$token");

      if (token != null) {
        Get.offAll(() => HomeScreen());
      } else {
        Get.offAll(() => LoginScreen());
      }
    } catch (e) {
      Get.offAll(() => LoginScreen());
      log("💥 Error in checkLogin():$e");
    }
  }
}
