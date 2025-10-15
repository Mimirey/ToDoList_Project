import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_project/components/custom_colors.dart';
import 'package:todolist_project/components/custom_button.dart';
import 'package:todolist_project/controllers/profile_controller.dart';
import 'package:todolist_project/routes/routes.dart';

class ProfileFragment extends StatelessWidget {
  ProfileFragment({super.key});

  final profileController = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // ✅ putih bersih
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
          _buildProfileCard(
            name: "Aqil Zamzami Musthofa",
            absen: "08",
            image: "assets/aqil08.png",
          ),
          _buildProfileCard(
            name: "Myra Isadora",
            absen: "25",
            image: "assets/myra25.png",
          ),
          _buildProfileCard(
            name: "Sylviana Jelita Malik",
            absen: "34",
            image: "assets/sylvi34.png",
          ),

          // 🔴 Tombol Log Out
          Padding(
            padding: const EdgeInsets.only(top: 24, left: 8, right: 8),
            child: CustomButton(
              myText: "Log Out",
              myTextColor: AppColors.textPrimary,
              // bgColor: const Color.fromARGB(255, 192, 0, 0),
              onPressed: () {
                Get.defaultDialog(
                  title: "Konfirmasi Logout",
                  middleText: "Apakah kamu yakin ingin keluar?",
                  textCancel: "Batal",
                  textConfirm: "Ya, Keluar",
                  confirmTextColor: Colors.white,
                  buttonColor: AppColors.primary,
                  onConfirm: () {
                    profileController.logout();
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
