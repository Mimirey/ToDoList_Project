import 'package:get/get.dart';
import 'package:todolist_project/binding/dashboard_binding.dart';
import 'package:todolist_project/fragments/history_fragment.dart';
import 'package:todolist_project/fragments/home_fragment.dart';
import 'package:todolist_project/fragments/profile_fragment.dart';
import 'package:todolist_project/page/dashboard_page.dart';
import 'package:todolist_project/routes/routes.dart';

class AppPages{
  static final pages=[
    GetPage(name: AppRoutes.dashboardPage, page: ()=>DashboardPage(), binding: DashboardBinding()),
    GetPage(name: AppRoutes.homeFragment, page:()=>HomeFragment()),
    GetPage(name: AppRoutes.historyFragment, page:()=>HistoryFragment()),
    GetPage(name: AppRoutes.profileFragment, page:()=>ProfileFragment())
  ];
}