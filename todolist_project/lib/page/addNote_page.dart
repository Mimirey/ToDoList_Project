import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:todolist_project/components/custom_button.dart';
import 'package:todolist_project/components/custom_dropdown.dart';
import 'package:todolist_project/components/custom_textfield.dart';
import 'package:todolist_project/controllers/addNote_controller.dart';
import 'package:todolist_project/model/sort_option.dart';



class AddnotePage extends StatelessWidget {
  AddnotePage({super.key});
  final addNoteController= Get.find<AddnoteController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tambah Catatan"),),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CustomTextfield(controller: addNoteController.judulController, label: 'Judul', labelColor: Colors.blue, pass: false, isNumber: false),
            CustomTextfield(controller: addNoteController.kegiatanController, label: 'Kegiatan', labelColor: Colors.blue, pass: false, isNumber: false),
            Obx(() => ListTile(
              title: Text(
              addNoteController.deadline.value == null
              ? "Pilih Deadline"
              : "Deadline: ${addNoteController.deadline.value!.toLocal().toString().split(' ')[0]}", 
              style: const TextStyle(fontSize: 16),
              ),
              trailing: const Icon(Icons.calendar_today),
              onTap: () => addNoteController.pickDeadline(context),
            )),

            Obx(() => CustomDropdown<SortOption>(
                  label: "Prioritas",
                  items: SortOption.values,
                  value: addNoteController.selectedPriority.value,
                  itemLabel: (p)=> p.label,
                  onChanged: (val) {
                    addNoteController.selectedPriority.value = val;
                  },
                )),
            CustomButton(
              myText: "Simpan", 
              myTextColor: Colors.white, onPressed: addNoteController.saveNote),
            
          ],
        ),),
    );
  }
}