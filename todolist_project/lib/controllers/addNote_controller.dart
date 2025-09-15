import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_project/controllers/home_controller.dart';
import 'package:todolist_project/model/home_model.dart';
import 'package:todolist_project/model/sort_option.dart';

class AddnoteController extends GetxController{
  late TextEditingController judulController;
  late TextEditingController kegiatanController;
  late Rx<DateTime?> deadline;
  late Rx<SortOption?> selectedPriority;
  final homeController= Get.find<HomeController>();

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
   void saveNote() {
    if (judulController.text.isEmpty || kegiatanController.text.isEmpty) {
      Get.snackbar("Error", "Harap isi judul dan kegiatan!");
      return;
    }

    if (selectedPriority.value == null) {
      Get.snackbar("Error", "Harap pilih prioritas!");
      return;
    }

    homeController.notes.add(
      Notes(
        judul: judulController.text,
        kegiatan: kegiatanController.text,
        deadline: deadline.value,
        priority: selectedPriority.value!,
      ),
    );

    Get.snackbar("Berhasil", "Catatan berhasil ditambahkan!");

    Get.back(closeOverlays: true);
  }

  @override
  void onClose() {
    judulController.dispose();
    kegiatanController.dispose();
    super.onClose();
  }
}