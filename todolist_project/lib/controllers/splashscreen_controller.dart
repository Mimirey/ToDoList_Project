import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todolist_project/routes/routes.dart';

class SplashscreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    checklogin();
  }

  checklogin() async {
    final prefs = await SharedPreferences.getInstance();
    await Future.delayed(Duration(seconds: 5));
    if (prefs.getString("username") != null) {
      Get.offAllNamed(AppRoutes.dahsboardPage);
    } else {
      Get.offAllNamed(AppRoutes.loginPage);
    }
  }

  logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Get.offAllNamed(AppRoutes.splashPage);
  }
}
