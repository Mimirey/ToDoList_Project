import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:todolist_project/controllers/home_controller.dart';

class HomeFragment extends StatelessWidget {
  HomeFragment({super.key});
  HomeController homeController= Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Ini halaman homenya sis"),
      )
    );
  }
}
