import 'package:get/get.dart';
import 'package:todolist_project/controllers/clock_controller.dart';
import 'package:todolist_project/controllers/home_controller.dart';

class DashboardBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(()=>HomeController());
    Get.lazyPut<ClockController>(()=>ClockController());
  }
  
}