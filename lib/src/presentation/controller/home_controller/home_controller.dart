import 'dart:developer';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notesapp/src/data/models/notes/note_model.dart';

class HomeController extends GetxController {
  RxList<NoteModel> notes = <NoteModel>[].obs;

  RxSet<int> selectedNoteKeys = <int>{}.obs;

  late Box<NoteModel> notesBox;
  RxBool selectionMode = false.obs;

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

  void toggleSelection(NoteModel note) {
    if (selectedNoteKeys.contains(note.key)) {
      selectedNoteKeys.remove(note.key);
    } else {
      selectedNoteKeys.add(note.key);
    }

    selectionMode.value = selectedNoteKeys.isNotEmpty;
  }

  void deleteSelectedNotes() {
    for (var key in selectedNoteKeys) {
      notesBox.delete(key);
    }
    selectedNoteKeys.clear();
    selectionMode.value = false;
  }

  void clearSelection() {
    selectedNoteKeys.clear();
    selectionMode.value = false;
  }

  bool isSelected(NoteModel note) => selectedNoteKeys.contains(note.key);
}
