import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_project/components/custom_button.dart';
import 'package:todolist_project/components/custom_colors.dart';
import 'package:todolist_project/components/custom_textfield.dart';
import 'package:todolist_project/controllers/login_controller.dart';

class LoginPageMobile extends StatelessWidget {
  LoginPageMobile({super.key});
  final loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text(
          "Login",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        backgroundColor: AppColors.primary,
        centerTitle: true,
        toolbarHeight: 50,
        elevation: 0,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 12, top: 40),
                child: Text(
                  "Welcome!",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),

              Container(
                margin: const EdgeInsets.only(bottom: 24),
                child: Text(
                  "Please fill username and password to login",
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              Container(
                margin: const EdgeInsets.only(bottom: 16),
                child: CustomTextfield(
                  controller: loginController.usernameController,
                  label: "Username",
                  labelColor: AppColors.primary2,
                  pass: false,
                  isNumber: false,
                ),
              ),

              Container(
                margin: const EdgeInsets.only(bottom: 24),
                child: Obx(
                  () => CustomTextfield(
                    controller: loginController.passwordController,
                    label: "Password",
                    labelColor: AppColors.primary2,
                    pass: !loginController.isPasswordVisible.value,
                    isNumber: true,
                    onSuffixIconTap: loginController.togglePasswordVisibility,
                  ),
                ),
              ),

              // Login button
              Container(
                margin: const EdgeInsets.only(top: 8),
                child: CustomButton(
                  myText: "Login",
                  myTextColor: AppColors.textPrimary,
                  // bgColor: AppColors.primary,
                  onPressed: () {
                    loginController.login(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
