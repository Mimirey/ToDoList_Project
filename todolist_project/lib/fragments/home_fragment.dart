import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_project/components/custom_buttonadd.dart';
import 'package:todolist_project/components/custom_colors.dart';
import 'package:todolist_project/components/custom_tile.dart';
import 'package:todolist_project/components/live_clock.dart';
import 'package:todolist_project/controllers/home_controller.dart';
import 'package:todolist_project/model/home_model.dart';
import 'package:todolist_project/routes/routes.dart';

class HomeFragment extends StatelessWidget {
  HomeFragment({super.key});
  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "Your List",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        backgroundColor: AppColors.primary,
        centerTitle: true,
      ),
      body: Obx(
        () => ListView(
          padding: const EdgeInsets.all(12),
          children: [
            Center(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 12),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: AppColors.secondary,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: LiveClock(),
              ),
            ),
            _buildPrioritySection(
              title: "Urgent",
              notes: homeController.urgentNotes,
              color: Colors.redAccent,
            ),
            _buildPrioritySection(
              title: "Penting",
              notes: homeController.pentingNotes,
              color: Colors.orange,
            ),
            _buildPrioritySection(
              title: "Santai",
              notes: homeController.santaiNotes,
              color: Colors.green,
            ),
          ],
        ),
      ),
      floatingActionButton: CustomButtonadd(
        onAdd: () => Get.toNamed(AppRoutes.addNotePage),
      ),
    );
  }

  Widget _buildPrioritySection({
    required String title,
    required List<Notes> notes,
    required Color color,
  }) {
    return ExpansionTile(
      key: PageStorageKey(title),
      tilePadding: EdgeInsets.zero,
      initiallyExpanded: true,
      title: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      children:
          notes.isEmpty
              ? [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Tidak ada catatan.",
                    style: TextStyle(color: Colors.grey[500]),
                  ),
                ),
              ]
              : notes.asMap().entries.map((entry) {
                final note = entry.value;
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 2,
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomTile(
                          judul: note.judul,
                          kegiatan: note.kegiatan,
                          done: note.isDone,
                          deadline: note.deadline,
                          onChanged: (val) {
                            if (val == true) {
                              homeController.completeNoteAt(note);
                            }
                          },
                        ),
                      ),
                      IconButton(
                        onPressed:
                            () => Get.toNamed(
                              AppRoutes.editNotePage,
                              arguments: note,
                            ),
                        icon: const Icon(Icons.edit, color: AppColors.primary),
                      ),
                    ],
                  ),
                );
              }).toList(),
    );
  }
}
