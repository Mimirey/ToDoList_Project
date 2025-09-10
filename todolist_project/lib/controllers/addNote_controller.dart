import 'package:get/get.dart';
import 'package:todolist_project/controllers/home_controller.dart';
import 'package:todolist_project/model/home_model.dart';

class AddnoteController extends GetxController{
  final homeController= Get.find<HomeController>();

  void saveNote({required String title, required String kegiatan}){
    if (title.isNotEmpty && kegiatan.isNotEmpty) {
      homeController.notes.add(
        Notes(judul: title, kegiatan: kegiatan),
      );
      Get.back();
    } else {
      Get.snackbar("Error", "Harap isi data dengan benar!");
    }
  }
}