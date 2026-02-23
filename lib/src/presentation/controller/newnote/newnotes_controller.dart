import 'dart:developer';

import 'package:get/state_manager.dart';

class NewnotesController extends GetxController {
  Future<void> saveNotes() async {
    try {} catch (e) {
      log("💥 Errors in saveNotes:$e");
    }
  }
}
