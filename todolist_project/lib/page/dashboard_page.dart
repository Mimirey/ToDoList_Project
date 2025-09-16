import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:todolist_project/components/custom_colors.dart';
import 'package:todolist_project/controllers/dashboard_controller.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({super.key});

  DashboardController dashboardController= Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Obx(()=> Scaffold(
      body: dashboardController.pages[dashboardController.selectedIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: dashboardController.selectedIndex.value,
          onTap: dashboardController.changePage,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.history_edu_outlined), label: "History"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ]
        ),
        
    )
    );
  }
}