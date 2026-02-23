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
      backgroundColor: Colors.white,

      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Obx(() {
          if (controller.selectionMode.value) {
            return AppBar(
              backgroundColor: Colors.redAccent,
              leading: IconButton(
                icon: const Icon(Icons.close, color: Colors.white),
                onPressed: controller.clearSelection,
              ),
              title: Obx(
                () => Text(
                  "${controller.selectedNoteKeys.length} selected",
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.white),
                  onPressed: controller.deleteSelectedNotes,
                ),
              ],
            );
          } else {
            return AppBar(
              backgroundColor: const Color.fromARGB(255, 2, 2, 47),
              title: const Text("Notes", style: TextStyle(color: Colors.white)),
            );
          }
        }),
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
                final note = controller.notes[index];

                return Obx(() {
                  final isSelected = controller.isSelected(note);

                  return GestureDetector(
                    onTap: () {
                      if (controller.selectionMode.value) {
                        controller.toggleSelection(note);
                      } else {
                        Get.to(
                          () => Notes(note: note),
                          transition: Transition.leftToRight,
                          duration: const Duration(milliseconds: 600),
                        );
                      }
                    },
                    onLongPress: () {
                      controller.toggleSelection(note);
                    },
                    child: Stack(
                      children: [
                        NoteCard(
                          note: note,
                          color: Color(note.colorCode),
                          onTap: () {
                            if (controller.selectionMode.value) {
                              controller.toggleSelection(note);
                            } else {
                              Get.to(
                                () => Notes(note: note),
                                transition: Transition.leftToRight,
                                duration: const Duration(milliseconds: 600),
                              );
                            }
                          },
                        ),
                        if (isSelected)
                          Positioned(
                            top: 8,
                            right: 8,
                            child: Icon(
                              Icons.check_circle,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                      ],
                    ),
                  );
                });
              },
            );
          }),
        ),
      ),

      floatingActionButton: Obx(() {
        if (controller.selectionMode.value) return const SizedBox.shrink();
        return FloatingActionButton(
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
        );
      }),
    );
  }
}
