import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_project/components/custom_colors.dart';
import 'package:todolist_project/controllers/splashscreen_controller.dart';

class SplashscreenPage extends StatelessWidget {
  SplashscreenPage({super.key});
  final splashController = Get.put(SplashscreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 160,
              height: 160,
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.4),
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Image.asset(
                  "assets/logoCekcek.png",
                  fit: BoxFit.contain,
                ),
              ),
            ),

            Padding(padding: EdgeInsets.only(top: 24)),

            Text(
              "CekCek App",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
              textAlign: TextAlign.center,
            ),

            Padding(padding: EdgeInsets.only(top: 8)),

            Text(
              "Atur kegiatanmu dengan mudah",
              style: TextStyle(fontSize: 14, color: AppColors.textSecondary),
              textAlign: TextAlign.center,
            ),

            Padding(padding: EdgeInsets.only(top: 32)),

            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(AppColors.primary),
              strokeWidth: 3,
            ),
          ],
        ),
      ),
    );
  }
}
