import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:todolist_project/components/custom_colors.dart';
import 'package:todolist_project/page/dashboard_page.dart';
import 'package:todolist_project/pages.dart';
import 'package:todolist_project/routes/routes.dart';

Future<void> main() async {
   await initializeDateFormatting('id_ID', null);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: AppColors.textPrimary,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
      ),
      initialRoute: AppRoutes.loginPage,
      getPages: AppPages.pages
    );
  }
}




  
