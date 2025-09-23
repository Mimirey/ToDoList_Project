import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_project/components/custom_button.dart';
import 'package:todolist_project/components/custom_colors.dart';
import 'package:todolist_project/components/custom_dropdown.dart';
import 'package:todolist_project/components/custom_textfield.dart';
import 'package:todolist_project/controllers/editNote_controller.dart';
import 'package:todolist_project/model/sort_option.dart';

class EditnotePage extends StatelessWidget {
  EditnotePage({super.key});
  final editController = Get.find<EditnoteController>(); // 🔹 ambil controller edit, bukan AddnoteController

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Catatan")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Wrap(
            runSpacing: 12,
            children: [
              // 🔹 Judul
              CustomTextfield(
                controller: editController.judulController,
                label: 'Judul',
                labelColor: AppColors.primary,
                pass: false,
                isNumber: false,
              ),
              // 🔹 Kegiatan
              CustomTextfield(
                controller: editController.kegiatanController,
                label: 'Kegiatan',
                labelColor: AppColors.primary,
                pass: false,
                isNumber: false,
              ),
              // 🔹 Deadline
              Obx(() => ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      editController.deadline.value == null
                          ? "Pilih Deadline"
                          : "Deadline: ${editController.deadline.value!.toLocal().toString().split(' ')[0]}",
                      style: const TextStyle(fontSize: 16),
                    ),
                    trailing: const Icon(Icons.calendar_today),
                    onTap: () => editController.pickDeadline(context),
                  )),
              // 🔹 Dropdown Prioritas
              Obx(() => CustomDropdown<SortOption>(
                    label: "Prioritas",
                    items: SortOption.values,
                    value: editController.selectedPriority.value, // 🔹 ambil dari controller
                    itemLabel: (p) => p.label,
                    onChanged: (val) {
                      if (val != null)
                        editController.selectedPriority.value = val; // 🔹 update controller
                    },
                  )),
              // 🔹 Tombol Update
              CustomButton(
                myText: "Update",
                myTextColor: AppColors.primary,
                onPressed: editController.updateNotes,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
