import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:todolist_project/page/dashboard_page.dart';
import 'package:todolist_project/routes/routes.dart';

class LoginController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void login(BuildContext context) {
    String username = usernameController.text;
    String password = passwordController.text;

    if (username == 'admin' && password == '123') {
      Get.offAllNamed(AppRoutes.dahsboardPage);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Gagal Login!"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
  }
}