import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:todolist_project/controllers/splashscreen_controller.dart';

class SplashscreenPage extends StatelessWidget {
  SplashscreenPage({super.key});
  final splashController= Get.find<SplashscreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(title: Text("INI SPLASHSCREEN"),),
      body: Center(
        child: Container(
          child: Text("ini splashScreen")
        ),
      ),
    );
  }
}