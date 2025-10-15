import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_project/components/custom_button.dart';
import 'package:todolist_project/components/custom_colors.dart';
import 'package:todolist_project/components/custom_textfield.dart';
import 'package:todolist_project/controllers/login_controller.dart';

class LoginPageWidescreen extends StatelessWidget {
  LoginPageWidescreen({super.key});
  final loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(40),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),

            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 8, top: 0),
                      child: Text(
                        "Welcome!",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ),

                    // Subtitle
                    Container(
                      margin: const EdgeInsets.only(bottom: 24),
                      child: Text(
                        "Please fill username and password to login to your CekCek App account.",
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),

                    // Username Field
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

                    // Password Field
                    Container(
                      margin: const EdgeInsets.only(bottom: 32),
                      child: Obx(
                        () => CustomTextfield(
                          controller: loginController.passwordController,
                          label: "Password",
                          labelColor: AppColors.primary2,
                          pass: !loginController.isPasswordVisible.value,
                          isNumber: true,
                          onSuffixIconTap:
                              loginController.togglePasswordVisibility,
                        ),
                      ),
                    ),

                    SizedBox(
                      width: double.infinity,
                      child: CustomButton(
                        myText: "Login",
                        myTextColor: AppColors.textPrimary,
                        onPressed: () {
                          loginController.login(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
