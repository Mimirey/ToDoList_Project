import 'package:get/get.dart';
import 'package:todolist_project/binding/addNote_binding.dart';
import 'package:todolist_project/binding/dashboard_binding.dart';
import 'package:todolist_project/binding/editNote_binding.dart';
import 'package:todolist_project/binding/login_binding.dart';
import 'package:todolist_project/binding/responsive_binding.dart';
import 'package:todolist_project/binding/splashscreen_binding.dart';
import 'package:todolist_project/fragments/history_fragment.dart';
import 'package:todolist_project/fragments/home_fragment.dart';
import 'package:todolist_project/fragments/profile_fragment.dart';
import 'package:todolist_project/page/addNote_page.dart';
import 'package:todolist_project/page/dashboard_page.dart';
import 'package:todolist_project/page/editNote_page.dart';
import 'package:todolist_project/page/login_page.dart';
import 'package:todolist_project/page/splashscreen_page.dart';
import 'package:todolist_project/routes/routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.dahsboardPage,
      page: () => DashboardPage(),
      bindings: [DashboardBinding(), ResponsiveBinding()],
    ),
    GetPage(name: AppRoutes.homeFragment, page: () => HomeFragment()),
    GetPage(name: AppRoutes.historyFragment, page: () => HistoryFragment()),
    GetPage(
      name: AppRoutes.profileFragment,
      page: () => ProfileFragment(),
      binding: ResponsiveBinding(),
    ),
    GetPage(
      name: AppRoutes.addNotePage,
      page: () => AddnotePage(),
      binding: AddnoteBinding(),
    ),
    GetPage(
      name: AppRoutes.editNotePage,
      page: () => EditnotePage(),
      binding: EditNoteBinding(),
    ),
    GetPage(
      name: AppRoutes.loginPage,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.splashPage,
      page: () => SplashscreenPage(),
      binding: SplashscreenBinding(),
    ),
  ];
}
