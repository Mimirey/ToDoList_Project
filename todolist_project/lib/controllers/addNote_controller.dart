import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:todolist_project/controllers/home_controller.dart';
import 'package:todolist_project/db_todolist.';
import 'package:todolist_project/model/home_model.dart';
import 'package:todolist_project/model/sort_option.dart';

class AddnoteController extends GetxController{
  late TextEditingController judulController;
  late TextEditingController kegiatanController;
  late Rx<DateTime?> deadline;
  late Rx<SortOption?> selectedPriority;
  final homeController= Get.find<HomeController>();
  final db= NotesDB();

  @override
  void onInit() {
    super.onInit();
    judulController = TextEditingController();
    kegiatanController = TextEditingController();
    deadline = Rx<DateTime?>(null);
    selectedPriority=Rx<SortOption?>(null);
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
   Future<void> saveNote() async {
    if (judulController.text.isEmpty || kegiatanController.text.isEmpty) {
      Get.snackbar("Error", "Judul dan kegiatan wajib diisi!");
      return;
    }

    final note = Notes(
      judul: judulController.text,
      kegiatan: kegiatanController.text,
      deadline: deadline.value,
      priority: selectedPriority.value!,
    );

    await homeController.addNote(note);

    Get.back();
    Get.snackbar("Berhasil", "Catatan berhasil ditambahkan!");
  }

  @override
  void onClose() {
    judulController.dispose();
    kegiatanController.dispose();
    super.onClose();
  }
}