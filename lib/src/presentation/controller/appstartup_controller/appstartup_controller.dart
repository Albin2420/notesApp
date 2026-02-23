import 'dart:developer';

import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';

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
      Get.offAll(() => HomeScreen());
    } catch (e) {
      log("💥 Error in checkLogin():$e");
    }
  }
}
