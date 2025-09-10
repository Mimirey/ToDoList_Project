import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:todolist_project/components/custom_tile.dart';
import 'package:todolist_project/controllers/home_controller.dart';

class HomeFragment extends StatelessWidget {
  HomeFragment({super.key});
  HomeController homeController= Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => ListView.builder(
            itemCount: homeController.notes.length,
            itemBuilder: (context, index) {
              return CustomTile(
                judul: homeController.notes[index].judul,
                kegiatan: homeController.notes[index].kegiatan,
                done: homeController.notes[index].isDone,
                onChanged: (_) => homeController.toogleDone(index),
              );
            },
          )),
    );
  }
}
