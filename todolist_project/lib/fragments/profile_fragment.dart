import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_project/components/custom_colors.dart';
import 'package:todolist_project/components/custom_tile.dart';
import 'package:todolist_project/controllers/home_controller.dart';
import 'package:todolist_project/controllers/responsive_controller.dart';
import 'package:todolist_project/fragments/mobile/history_fragment_mobile.dart';
import 'package:todolist_project/fragments/mobile/profile_fragment_mobile.dart';
import 'package:todolist_project/fragments/widescreen/history_fragment_widescreen.dart';
import 'package:todolist_project/fragments/widescreen/profile_fragment_widesceen.dart';

class ProfileFragment extends StatelessWidget {
  ProfileFragment({super.key});

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
                    ? ProfileFragmentMobile()
                    : ProfileFragmentWidesceen(),
          );
        },
      ),
    );
  }
}