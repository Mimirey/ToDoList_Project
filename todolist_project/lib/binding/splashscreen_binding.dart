import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:todolist_project/controllers/splashscreen_controller.dart';

class SplashscreenBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<SplashscreenController>(()=>SplashscreenController());
  }
}