import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_project/routes/routes.dart';

class LoginController extends GetxController {
  // 🔹 TextEditingController untuk input
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // 🔹 State untuk toggle password visibility
  var isPasswordVisible = false.obs;

  // 🔹 Toggle password show/hide
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  // 🔹 Login sederhana (bisa dikembangkan)
  void login(BuildContext context) {
    String username = usernameController.text.trim();
    String password = passwordController.text.trim();

    if (username.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Username atau password tidak boleh kosong!"),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    // Contoh login sederhana
    if (username == 'admin' && password == '123') {
      // 🔹 Pastikan nama route benar
      Get.offAllNamed(AppRoutes.dahsboardPage);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Gagal Login! Username atau password salah."),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  // 🔹 Dispose controller
  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
