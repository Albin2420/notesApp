import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesapp/src/presentation/controller/newnote/newnotes_controller.dart';

class Newnotes extends StatelessWidget {
  const Newnotes({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.put(NewnotesController());
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
                ctrl.saveNotes();
              } else if (value == 'discard') {
                log('Discard clicked');
              } else if (value == 'pin') {
                log('Pin clicked');
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
                decoration: const InputDecoration(
                  hintText: "Title",
                  border: InputBorder.none,
                ),
                textInputAction: TextInputAction.next,
              ),

              const SizedBox(height: 12),

              Expanded(
                child: TextField(
                  expands: true,
                  maxLines: null,
                  minLines: null,
                  keyboardType: TextInputType.multiline,
                  style: const TextStyle(fontSize: 16),
                  decoration: const InputDecoration(
                    hintText: "Write your note...",
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
