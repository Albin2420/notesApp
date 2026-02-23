import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:notesapp/src/presentation/controller/home_controller/home_controller.dart';
import 'package:notesapp/src/presentation/screens/home_screen/widgets/notes_card.dart';
import 'package:notesapp/src/presentation/screens/notes/notes.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 2, 2, 47),
        title: const Text("Notes", style: TextStyle(color: Colors.white)),
      ),

      body: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, top: 12),
        child: SafeArea(
          child: Obx(() {
            if (controller.notes.isEmpty) {
              return const Center(child: Text("No Notes"));
            }

            return MasonryGridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              itemCount: controller.notes.length,
              itemBuilder: (context, index) {
                return NoteCard(
                  onTap: () {
                    Get.to(
                      () => Notes(note: controller.notes[index]),
                      transition: Transition.leftToRight,
                      duration: const Duration(milliseconds: 600),
                    );
                  },
                  note: controller.notes[index],
                  color: Color(controller.notes[index].colorCode),
                );
              },
            );
          }),
        ),
      ),

      backgroundColor: Colors.white,

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(
            () => const Notes(),
            transition: Transition.leftToRight,
            duration: const Duration(milliseconds: 600),
            fullscreenDialog: true,
          );
        },
        backgroundColor: const Color.fromARGB(255, 2, 2, 47),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
