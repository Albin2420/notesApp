import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notesapp/src/data/models/notes/note_model.dart';

class NewnotesController extends GetxController {
  final titleController = TextEditingController();
  final notesController = TextEditingController();
  late Box<NoteModel> notesBox;

  @override
  void onInit() {
    super.onInit();

    notesBox = Hive.box<NoteModel>('notesBox');
  }

  Future<void> saveNotes({
    required String title,
    required String notes,
    int? id,
    int? colorcode,
    NoteModel? existingNote,
  }) async {
    try {
      EasyLoading.show();

      if (existingNote != null) {
        existingNote.title = title;
        existingNote.description = notes;
        existingNote.save();
      } else {
        final note = NoteModel(
          title: title,
          description: notes,
          createdAt: DateTime.now(),
          id: id!,
          colorCode: colorcode!,
        );
        await notesBox.add(note);
      }

      EasyLoading.dismiss();
      Get.back();
    } catch (e) {
      EasyLoading.dismiss();
      Fluttertoast.showToast(msg: "Something went wrong");
      log("💥 Errors in saveNotes:$e");
    }
  }

  void clearFields() {
    titleController.clear();
    notesController.clear();
  }

  @override
  void onClose() {
    titleController.dispose();
    notesController.dispose();
    super.onClose();
  }
}
