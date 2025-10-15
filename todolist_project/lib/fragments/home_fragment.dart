import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_project/controllers/responsive_controller.dart';
import 'package:todolist_project/fragments/mobile/home_fragment_mobile.dart';
import 'package:todolist_project/fragments/widescreen/home_fragment_widescreen.dart';

class HomeFragment extends StatelessWidget {
  HomeFragment({super.key});

  final responsiveController = Get.find<ResponsiveController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constrains) {
          responsiveController.updateLayout(constrains);
          return Obx(
            () =>
                responsiveController.isMobile.value
                    ? HomeFragmentMobile()
                    : HomeFragmentWidescreen(),
          );
        },
      ),
    );
  }
}
