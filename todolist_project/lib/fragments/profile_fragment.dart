import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:todolist_project/components/custom_button.dart';
import 'package:todolist_project/components/custom_colors.dart';
import 'package:todolist_project/routes/routes.dart';

class ProfileFragment extends StatelessWidget {
  ProfileFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Profile", style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
            color: AppColors.textPrimary
          ),),
          backgroundColor: AppColors.background,
          centerTitle: true,
          toolbarHeight: 50,
        ),
      body: Center(
        child: ListView(
          children: [
            // Aqil
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              color: AppColors.secondary,
              margin: EdgeInsets.all(20),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: const [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage("assets/aqil08.png"),
                    ),
                    Text(
                      "Aqil Zamzami Musthofa",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary3,
                      ),
                      textAlign: TextAlign.center,
                      
                    ),
                    Text(
                      "08",
                      style: TextStyle(fontSize: 12, color: AppColors.primary2, fontWeight: FontWeight.w600),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      "PPLG - SMK RUS",
                      style: TextStyle(fontSize: 10, color: AppColors.primary, fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),

            // Myra
            Card(
              color: AppColors.secondary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),

              margin: EdgeInsets.all(20),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: const [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage("assets/myra25.png"),
                    ),

                    Text(
                      "Myra Isadora",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary3,
                      ),
                      textAlign: TextAlign.center,
                    ),

                    Text(
                      "25",
                      style: TextStyle(fontSize: 12, color: AppColors.primary2, fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ),

                    Text(
                      "PPLG - SMK RUS",
                      style: TextStyle(fontSize: 10, color: AppColors.primary, fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),

            // Sylvi
            Card(
              color: AppColors.secondary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              margin: EdgeInsets.all(20),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: const [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage("assets/sylvi34.png"),
                    ),

                    Text(
                      "Sylviana Jelita Malik",
                      style: TextStyle(
                        fontSize: 18,
                        color: AppColors.primary3,
                        fontWeight: FontWeight.bold,
                        
                      ),
                      textAlign: TextAlign.center,
                    ),

                    Text(
                      "34",
                      style: TextStyle(fontSize: 12, color: AppColors.primary2, fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ),

                    Text(
                      "PPLG - SMK RUS",
                      style: TextStyle(fontSize: 10, color: AppColors.primary, fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(35),
              child: CustomButton(
                myText: "Log Out", 
                myTextColor: const Color.fromARGB(255, 192, 0, 0), 
                onPressed: () {
                  Get.offAllNamed(AppRoutes.loginPage);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
