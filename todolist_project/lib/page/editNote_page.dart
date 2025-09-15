import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:todolist_project/components/custom_button.dart';
import 'package:todolist_project/components/custom_dropdown.dart';
import 'package:todolist_project/components/custom_textfield.dart';
import 'package:todolist_project/controllers/editNote_controller.dart';
import 'package:todolist_project/model/home_model.dart';
import 'package:todolist_project/model/sort_option.dart' show SortOption, SortOptionExtension;

class EditnotePage extends StatelessWidget {
  EditnotePage({super.key});
  
  

  @override
  Widget build(BuildContext context) {
    final editController= Get.find<EditnoteController>();
    return Scaffold(
      appBar: AppBar(title: Text("Edit Note")),
      body: Padding(padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          CustomTextfield(controller: editController.judulController, labelColor: Colors.blue, pass: false, isNumber: false, label: 'Judul',),
          CustomTextfield(controller: editController.kegiatanController, labelColor: Colors.blue, pass: false, isNumber: false, label: 'Kegiatan',),
          Obx(() => ListTile(
              title: Text(
              editController.deadline.value == null
              ? "Pilih Deadline"
              : "Deadline: ${editController.deadline.value!.toLocal().toString().split(' ')[0]}", 
              style: const TextStyle(fontSize: 16),
              ),
              trailing: const Icon(Icons.calendar_today),
              onTap: () => editController.pickDeadline(context),
          )),

          Obx(() => CustomDropdown<SortOption>(
                  label: "Prioritas",
                  items: SortOption.values,
                  value: editController.selectedPriority.value,
                  itemLabel: (p)=> p.label,
                  onChanged: (val) {
                    editController.selectedPriority.value = val;
                  },
                )),
          CustomButton(myText: "Update", myTextColor: Colors.white, onPressed: (){editController.updateNotes();})
        ],
      ),
      
      ),
    );
  }
}