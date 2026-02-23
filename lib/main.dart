import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:notesapp/src/app.dart';
import 'package:notesapp/src/data/models/notes/note_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>('notesBox');
  runApp(const NotesApp());
}
