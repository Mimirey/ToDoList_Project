import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_project/components/custom_buttonadd.dart';
import 'package:todolist_project/components/custom_colors.dart';
import 'package:todolist_project/components/custom_tile.dart';
import 'package:todolist_project/components/live_clock.dart';
import 'package:todolist_project/controllers/home_controller.dart';
import 'package:todolist_project/model/home_model.dart';
import 'package:todolist_project/routes/routes.dart';

class HomeFragmentWidescreen extends StatelessWidget {
  HomeFragmentWidescreen({super.key});
  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    const double maxWidth = 1100;

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

      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Obx(
            () => ListView(
              padding: const EdgeInsets.all(24),
              children: [
                Center(
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 16),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
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
                  crossAxisCount: 2,
                ),
                _buildPrioritySection(
                  title: "Penting",
                  notes: homeController.pentingNotes,
                  color: Colors.orange,
                  crossAxisCount: 2,
                ),
                _buildPrioritySection(
                  title: "Santai",
                  notes: homeController.santaiNotes,
                  color: Colors.green,
                  crossAxisCount: 3,
                ),
              ],
            ),
          ),
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
    required int crossAxisCount,
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
      children: [
        if (notes.isEmpty)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Tidak ada catatan.",
              style: TextStyle(color: Colors.grey[500]),
            ),
          )
        else
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: notes.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              crossAxisSpacing: 10,
              mainAxisSpacing: 16,
              childAspectRatio: 7 / 2,
            ),
            itemBuilder: (context, index) {
              final note = notes[index];
              return Card(
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
            },
          ),
      ],
    );
  }
}
