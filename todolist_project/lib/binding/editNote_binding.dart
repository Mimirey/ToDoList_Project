import 'package:get/get.dart';
import 'package:todolist_project/controllers/editNote_controller.dart';

class EditNoteBinding extends Bindings {
  @override
  void dependencies() {
    // Lazy put controller, baru di-inject saat page dipanggil
    Get.lazyPut<EditnoteController>(() => EditnoteController());
  }
}
