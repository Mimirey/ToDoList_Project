import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_project/components/custom_colors.dart';
import 'package:todolist_project/components/custom_textfield.dart';
import 'package:todolist_project/routes/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String statusLogin = '';
  final TextEditingController txtUsername = TextEditingController();
  final TextEditingController txtPass = TextEditingController();

  @override
  void dispose() {
    txtUsername.dispose();
    txtPass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
          title: const Text("Login", style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
            color: AppColors.textPrimary
          ),),
          backgroundColor: AppColors.background,
          centerTitle: true,
          toolbarHeight: 50,
        ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                "Welcome!",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  color: AppColors.textSecondary
                ),
              ),
              const SizedBox(height: 8),

              Text(
                "Please fill username and password to login",
                style: TextStyle(color: AppColors.textSecondary),
              ),
              const SizedBox(height: 30),

              CustomTextfield(
                controller: txtUsername, 
                label: "Username", 
                labelColor: AppColors.primary3, 
                pass: false, 
                isNumber: false
              ),
              
               SizedBox(height: 20),

               CustomTextfield(
                controller: txtPass, 
                label: "Password", 
                labelColor: AppColors.primary3, 
                pass: true, 
                isNumber: true
              ),
            
              const SizedBox(height: 28),

              // Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (txtUsername.text == 'admin' && txtPass.text == '123') {
                      setState(() => statusLogin = "Berhasil Login");
                      Get.offNamed(AppRoutes.dahsboardPage);
                    } else {
                      setState(() => statusLogin = "Gagal Login");
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary2,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // Status text
              if (statusLogin.isNotEmpty)
                Center(
                  child: Text(
                    statusLogin,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: statusLogin == "Berhasil Login"
                          ? Colors.green
                          : Colors.red,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
