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
    //  backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text("Your List", style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
          color: AppColors.textPrimary
        ),),
        backgroundColor: AppColors.background,
        centerTitle: true,
        toolbarHeight: 50,
      ),
      body: Obx(() => ListView(
            padding: const EdgeInsets.all(8),
            children: [
              Center(
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 12),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: LiveClock(),
                )
              ),
              _buildPrioritySection(
                title: "Urgent",
                notes: homeController.urgentNotes,
              ),
              _buildPrioritySection(
                title: "Penting",
                notes: homeController.pentingNotes,
              ),
              _buildPrioritySection(
                title: "Santai",
                notes: homeController.santaiNotes,
              ),

              const SizedBox(height: 75),
            ],
          )),
      floatingActionButton: CustomButtonadd(
      onAdd: () => Get.toNamed(AppRoutes.addNotePage),
      ),
    );
  }

  Widget _buildPrioritySection({required String title, required List<Notes> notes}) {
    return ExpansionTile(
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      initiallyExpanded: true, 
      children: notes.isEmpty
          ? [const Padding(
              padding: EdgeInsets.all(3.0),
              child: Text("Tidak ada catatan."),
            )]
          : notes.asMap().entries.map((entry) {
              final index = entry.key;
              final note = entry.value;
              return Row(
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
                    }
                    ),
                  ),

                  IconButton(
                    onPressed: () => Get.toNamed(
                      AppRoutes.editNotePage,
                    arguments: note,
                    ),
                    icon: const Icon(Icons.edit, color: AppColors.primary),
                  ),
                ],
              );
            }).toList(),
    );
  }
}