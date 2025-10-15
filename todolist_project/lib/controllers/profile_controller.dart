import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todolist_project/routes/routes.dart';

class ProfileController extends GetxController{
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    await Future.delayed(const Duration(milliseconds: 500));
    Get.offAllNamed(AppRoutes.splashPage);
  }
}