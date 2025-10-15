import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_project/controllers/login_controller.dart';
import 'package:todolist_project/page/mobile/login_page_mobile.dart';
import 'package:todolist_project/page/widescreen/login_page_widescreen.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constrains) {
          loginController.updateLayout(constrains);
          return Obx(
            () =>
                loginController.isMobile.value
                    ? LoginPageMobile()
                    : LoginPageWidescreen(),
          );
        },
      ),
    );
  }
}
