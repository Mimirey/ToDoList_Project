import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_project/components/custom_button.dart';
import 'package:todolist_project/components/custom_colors.dart';
import 'package:todolist_project/controllers/responsive_controller.dart';
import 'package:todolist_project/controllers/splashscreen_controller.dart';

class ProfileFragmentWidesceen extends StatelessWidget {
  ProfileFragmentWidesceen({super.key});

  final splashControl = Get.find<SplashscreenController>();
  final responsiveController = Get.find<ResponsiveController>();

  final List<Map<String, String>> profiles = [
    {
      "name": "Aqil Zamzami Musthofa",
      "absen": "08",
      "image": "assets/aqil08.png",
    },
    {"name": "Myra Isadora", "absen": "25", "image": "assets/myra25.png"},
    {
      "name": "Sylviana Jelita Malik",
      "absen": "34",
      "image": "assets/sylvi34.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "Profile Page",
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
        ),
        backgroundColor: AppColors.primary,
        centerTitle: true,
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: profiles.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 3 / 5,
            ),
            itemBuilder: (context, index) {
              final profile = profiles[index];
              return _buildProfileCard(
                name: profile["name"]!,
                absen: profile["absen"]!,
                image: profile["image"]!,
              );
            },
          ),

          Padding(
            padding: const EdgeInsets.only(top: 24, left: 8, right: 8),
            child: CustomButton(
              myText: "Log Out",
              myTextColor: AppColors.textPrimary,
              onPressed: () {
                Get.defaultDialog(
                  title: "Confirm Logout",
                  middleText: "Apakah kamu yakin ingin keluar?",
                  textCancel: "Batal",
                  textConfirm: "Ya, Keluar",
                  confirmTextColor: Colors.white,
                  buttonColor: AppColors.primary,
                  onConfirm: () {
                    splashControl.logout();
                  },
                  onCancel: () {},
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileCard({
    required String name,
    required String absen,
    required String image,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CircleAvatar(radius: 50, backgroundImage: AssetImage(image)),
            const SizedBox(height: 12),
            Text(
              name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 6),
            Text(
              "Absen: $absen",
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.primary,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              "PPLG SMK RUS",
              style: TextStyle(
                fontSize: 14,
                color: AppColors.primary,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
