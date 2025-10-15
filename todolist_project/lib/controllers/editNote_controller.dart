import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_project/controllers/home_controller.dart';
import 'package:todolist_project/db_todolist.';
import 'package:todolist_project/model/home_model.dart';
import 'package:todolist_project/model/sort_option.dart';

class EditnoteController extends GetxController {
  late final Notes note;
  late TextEditingController judulController;
  late TextEditingController kegiatanController;

  final deadline = Rx<DateTime?>(null); // 🔹 reactive deadline
  final selectedPriority = Rx<SortOption>(
    SortOption.santai,
  ); // 🔹 langsung default Santai

  final homeController = Get.find<HomeController>();
  final db = NotesDB();

  @override
  void onInit() {
    super.onInit();
    note = Get.arguments as Notes;

    judulController = TextEditingController(text: note.judul);
    kegiatanController = TextEditingController(text: note.kegiatan);
    deadline.value = note.deadline;
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
      initialDate:
          deadline.value ?? DateTime.now(), // 🔹 pakai deadline note kalau ada
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked != null) deadline.value = picked;
  }

  Future<void> updateNotes() async {
    if (judulController.text.isEmpty || kegiatanController.text.isEmpty) {
      Get.snackbar("Error", "Harap isi judul dan kegiatan!");
      return;
    }

    final updated = note.copyWith(
      judul: judulController.text,
      kegiatan: kegiatanController.text,
      deadline: deadline.value,
      priority: selectedPriority.value,
    );

    await db.updateNote(note.id!, updated);

    await homeController.loadNotes();

    Get.snackbar("Berhasil", "Catatan berhasil diperbarui!");
    Get.back();
  }
}
