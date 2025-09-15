import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:todolist_project/controllers/addNote_controller.dart';

class AddnoteBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<AddnoteController>(()=>AddnoteController());
  }

}