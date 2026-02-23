import 'dart:developer';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notesapp/src/data/models/notes/note_model.dart';

class HomeController extends GetxController {
  RxList<NoteModel> notes = <NoteModel>[].obs;

  late Box<NoteModel> notesBox;

  @override
  void onInit() {
    super.onInit();
    _initNotes();
  }

  void _initNotes() {
    try {
      notesBox = Hive.box<NoteModel>('notesBox');
      fetchNotes();
      notesBox.listenable().addListener(() {
        fetchNotes();
      });
    } catch (e) {
      log("💥 _initNotes error: $e");
    }
  }

  void fetchNotes() {
    try {
      notes.value = notesBox.values.toList();
      log("✅ Notes Loaded: ${notes.length}");
    } catch (e) {
      log("💥 fetchNotes error: $e");
    }
  }
}
