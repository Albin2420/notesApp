import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesapp/src/presentation/screens/newnotes/newnotes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 2, 2, 47),
        title: Text("Notes", style: TextStyle(color: Colors.white)),
        actions: [],
      ),
      body: SafeArea(child: Center(child: Text("ok"))),
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(
            () => const Newnotes(),
            transition: Transition.leftToRight,
            duration: const Duration(milliseconds: 600),
            opaque: true,
            fullscreenDialog: true,
          );
        },
        backgroundColor: const Color.fromARGB(255, 2, 2, 47),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
