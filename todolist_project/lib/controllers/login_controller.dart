import 'package:flutter/material.dart';
import 'package:todolist_project/page/dashboard_page.dart';

class LoginController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void login(BuildContext context) {
    String username = usernameController.text;
    String password = passwordController.text;

    if (username == 'admin' && password == '123') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>DashboardPage(),
        ),
      );
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