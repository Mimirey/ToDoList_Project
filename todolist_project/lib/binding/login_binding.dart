import 'package:get/get.dart';
import 'package:todolist_project/controllers/login_controller.dart';

class LoginBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(()=>LoginController());
  }

}