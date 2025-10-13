import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_project/components/custom_button.dart';
import 'package:todolist_project/components/custom_colors.dart';
import 'package:todolist_project/components/custom_dropdown.dart';
import 'package:todolist_project/components/custom_textfield.dart';
import 'package:todolist_project/controllers/addNote_controller.dart';
import 'package:todolist_project/controllers/home_controller.dart';
import 'package:todolist_project/model/sort_option.dart';

class AddnotePage extends StatelessWidget {
  AddnotePage({super.key});
  final addNoteController = Get.find<AddnoteController>();
  final homeController = Get.find<HomeController>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tambah Catatan")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Wrap(
            runSpacing: 12,
            children: [
              // Judul
              CustomTextfield(
                controller: addNoteController.judulController,
                label: 'Judul',
                labelColor: AppColors.primary,
                pass: false,
                isNumber: false,
              ),
              // Kegiatan
              CustomTextfield(
                controller: addNoteController.kegiatanController,
                label: 'Kegiatan',
                labelColor: AppColors.primary,
                pass: false,
                isNumber: false,
              ),
              // Deadline
              Obx(
                () => ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    addNoteController.deadline.value == null
                        ? "Pilih Deadline"
                        : "Deadline: ${addNoteController.deadline.value!.toLocal().toString().split(' ')[0]}",
                    style: const TextStyle(fontSize: 16),
                  ),
                  trailing: const Icon(Icons.calendar_today),
                  onTap: () => addNoteController.pickDeadline(context),
                ),
              ),
              // Dropdown Prioritas
              Obx(
                () => CustomDropdown<SortOption>(
                  label: "Prioritas",
                  items: SortOption.values,
                  value: addNoteController.selectedPriority.value ??
                      SortOption.santai, // default Santai
                  itemLabel: (p) => p.label,
                  onChanged: (val) {
                    if (val != null) addNoteController.selectedPriority.value = val;
                  },
                ),
              ),
              // Tombol Simpan
              CustomButton(
                myText: "Simpan",
                myTextColor: AppColors.primary,
                onPressed: addNoteController.saveNote,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
