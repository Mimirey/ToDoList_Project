import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:todolist_project/controllers/editNote_controller.dart';

class EditNoteBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<EditnoteController>(()=>EditnoteController());
  }

}