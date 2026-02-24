import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notesapp/src/core/config/theme/colors.dart';
import 'package:notesapp/src/data/models/notes/note_model.dart';
import 'package:notesapp/src/presentation/controller/newnote/newnotes_controller.dart';

class Notes extends StatelessWidget {
  final NoteModel? note;
  const Notes({super.key, this.note});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.put(NewnotesController());

    if (note != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ctrl.titleController.text = note!.title;
        ctrl.notesController.text = note!.description;
      });
    }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Color.fromARGB(255, 2, 2, 47),
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            color: Colors.white,

            onSelected: (value) {
              if (value == 'save') {
                final random = Random();
                final randomColor = AppColors
                    .notecolors[random.nextInt(AppColors.notecolors.length)];
                final colorCode = randomColor.toARGB32();

                final uniqueId = DateTime.now().millisecondsSinceEpoch;

                ctrl.saveNotes(
                  title: ctrl.titleController.text,
                  notes: ctrl.notesController.text,
                  id: uniqueId,
                  colorcode: colorCode,
                  existingNote: note,
                );
              } else if (value == 'discard') {
                ctrl.clearFields();
              }
            },

            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'save',
                child: Row(
                  children: [
                    Icon(Icons.save, size: 20, color: Colors.black),
                    SizedBox(width: 12),
                    Text('Save'),
                  ],
                ),
              ),

              const PopupMenuItem(
                value: 'discard',
                child: Row(
                  children: [
                    Icon(Icons.delete_outline, size: 20, color: Colors.black),
                    SizedBox(width: 12),
                    Text('Discard'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: ctrl.titleController,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                decoration: const InputDecoration(
                  hintText: "Title",
                  border: InputBorder.none,
                ),
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 12),
              TextField(
                controller: ctrl.notesController,
                maxLines: null,
                keyboardType: TextInputType.multiline,
                style: GoogleFonts.lato(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  hintText: "Write your note...",
                  hintStyle: GoogleFonts.lato(
                    fontSize: 16,
                    color: Colors.grey.shade500,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
