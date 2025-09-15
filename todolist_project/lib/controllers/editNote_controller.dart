import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_project/controllers/home_controller.dart';
import 'package:todolist_project/model/home_model.dart';
import 'package:todolist_project/model/sort_option.dart';

class EditnoteController extends GetxController {
   late final Notes note;
  late TextEditingController judulController;
  late TextEditingController kegiatanController;
  late Rx<DateTime?>deadline;
  late Rx<SortOption?> selectedPriority;
  final homeController = Get.find<HomeController>();
  

  @override
  void onInit(){
    super.onInit();
    
    note = Get.arguments as Notes;

    
    judulController= TextEditingController(
      text: note.judul,
    );
    kegiatanController=TextEditingController(
      text: note.kegiatan
    );
    deadline = Rx<DateTime?>(note.deadline); 
    selectedPriority=Rx<SortOption?>(note.priority);
  }

   @override
  void onClose() {
    judulController.dispose();
    kegiatanController.dispose();
    super.onClose();
  }

   void pickDeadline(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      deadline.value = picked;
    }
  }

  void updateNotes() {
    final index = homeController.notes.indexOf(note); 

    if (index != -1) {
      homeController.notes[index] = note.copyWith(
        judul: judulController.text,
        kegiatan: kegiatanController.text,
        deadline: deadline.value,
        priority: selectedPriority.value!,
      );
    }

    Get.back();
  }
}