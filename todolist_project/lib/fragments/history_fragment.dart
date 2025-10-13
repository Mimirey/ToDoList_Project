import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_project/components/custom_colors.dart';
import 'package:todolist_project/components/custom_tile.dart';
import 'package:todolist_project/controllers/home_controller.dart';

class HistoryFragment extends StatelessWidget {
  HistoryFragment({super.key});
  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // ✅ putih bersih
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.primary,
        centerTitle: true,
        title: const Text(
          "History",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),

      body: Obx(() {
        if (homeController.completedNotes.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.history, size: 60, color: AppColors.primary2),
                SizedBox(height: 12),
                Text(
                  "Belum ada catatan selesai",
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.textSecondary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: homeController.completedNotes.length,
          itemBuilder: (context, index) {

            final note=homeController.completedNotes[index];
            return Card(
              elevation: 2,
              shadowColor: AppColors.primary.withOpacity(0.2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              margin: const EdgeInsets.only(bottom: 12),
              color: AppColors.secondary,
              child: Row(
                children: [
                  Expanded(
                    child: CustomTile(
                      judul: homeController.completedNotes[index].judul,
                      kegiatan: homeController.completedNotes[index].kegiatan,
                      done: homeController.completedNotes[index].isDone,
                      deadline: homeController.completedNotes[index].deadline,
                      onChanged: (val) {
                        if (val == false) {
                          homeController.uncompleteNoteAt(note);
                        }
                      },
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      homeController.deleteNote(note.id!);
                    },
                    icon: const Icon(
                      Icons.delete_outline,
                      color: Colors.redAccent,
                    ),
                  ),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}
