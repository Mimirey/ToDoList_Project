import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_project/fragments/history_fragment.dart';
import 'package:todolist_project/fragments/home_fragment.dart';
import 'package:todolist_project/fragments/profile_fragment.dart';

class DashboardController extends GetxController {
  var selectedIndex = 0.obs;

  final List<Widget> pages = [
    HomeFragment(),
    HistoryFragment(),
    ProfileFragment(),
  ];

  void changePage(int index) {
    selectedIndex.value = index;
  }
}
