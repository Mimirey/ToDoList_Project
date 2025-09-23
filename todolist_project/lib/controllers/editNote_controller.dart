import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_project/controllers/home_controller.dart';
import 'package:todolist_project/model/home_model.dart';
import 'package:todolist_project/model/sort_option.dart';

class EditnoteController extends GetxController {
  late final Notes note;
  late TextEditingController judulController;
  late TextEditingController kegiatanController;

  final deadline = Rx<DateTime?>(null); // 🔹 reactive deadline
  final selectedPriority = Rx<SortOption>(SortOption.santai); // 🔹 langsung default Santai

  final homeController = Get.find<HomeController>();

  @override
  void onInit() {
    super.onInit();

    // 🔹 ambil note dari arguments saat page dibuka
    note = Get.arguments as Notes;

    // 🔹 inisialisasi TextEditingController dari note
    judulController = TextEditingController(text: note.judul);
    kegiatanController = TextEditingController(text: note.kegiatan);

    // 🔹 set deadline dari note
    deadline.value = note.deadline;

    // 🔹 set prioritas dari note, jika null pakai default Santai
    selectedPriority.value = note.priority ?? SortOption.santai;
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
      initialDate: deadline.value ?? DateTime.now(), // 🔹 pakai deadline note kalau ada
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked != null) deadline.value = picked;
  }

  void updateNotes() {
    final index = homeController.notes.indexOf(note);
    if (index != -1) {
      homeController.notes[index] = note.copyWith(
        judul: judulController.text,
        kegiatan: kegiatanController.text,
        deadline: deadline.value,
        priority: selectedPriority.value, // 🔹 ambil dari selectedPriority.value
      );
    }
    Get.back();
  }
}
