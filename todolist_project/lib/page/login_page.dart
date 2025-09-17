import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_project/components/custom_button.dart';
import 'package:todolist_project/components/custom_colors.dart';
import 'package:todolist_project/components/custom_textfield.dart';
import 'package:todolist_project/controllers/login_controller.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text(
          "Login",
          style: TextStyle(
              fontWeight: FontWeight.w500, fontSize: 20, color: AppColors.textPrimary),
        ),
        backgroundColor: AppColors.background,
        centerTitle: true,
        toolbarHeight: 50,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Title
              Container(
                margin: const EdgeInsets.only(bottom: 12),
                child: Text(
                  "Welcome!",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      color: AppColors.textSecondary),
                ),
              ),

              // Subtitle
              Container(
                margin: const EdgeInsets.only(bottom: 24),
                child: Text(
                  "Please fill username and password to login",
                  style: TextStyle(color: AppColors.textSecondary),
                ),
              ),

              // Username field
              Container(
                margin: const EdgeInsets.only(bottom: 16),
                child: CustomTextfield(
                    controller: loginController.usernameController,
                    label: "Username",
                    labelColor: AppColors.primary3,
                    pass: false,
                    isNumber: false),
              ),

              // Password field
              Container(
                margin: const EdgeInsets.only(bottom: 24),
                child: CustomTextfield(
                    controller: loginController.passwordController,
                    label: "Password",
                    labelColor: AppColors.primary3,
                    pass: true,
                    isNumber: true),
              ),

              // Login button
              Container(
                margin: const EdgeInsets.only(top: 8),
                child: CustomButton(
                    myText: "Login",
                    myTextColor: AppColors.primary2,
                    onPressed: () {
                      loginController.login(context);
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}