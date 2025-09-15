import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:todolist_project/components/custom_tile.dart';
import 'package:todolist_project/controllers/home_controller.dart';

class HistoryFragment extends StatelessWidget {
  HistoryFragment({super.key});
  final homeController= Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Obx((){
      return ListView.builder(
        itemCount: homeController.completedNotes.length,
        itemBuilder: (context, index){
          return Row(
            children: [
              Expanded(
                child: CustomTile(
                  judul: homeController.completedNotes[index].judul, 
                  kegiatan: homeController.completedNotes[index].kegiatan, 
                  done: homeController.completedNotes[index].isDone,
                  deadline: homeController.completedNotes[index].deadline,
                  onChanged: (val){
                    if (val == false) {
                      homeController.uncompleteNoteAt(index);
                    }
                  },),
              ),
               IconButton(onPressed: (){
                    homeController.completedNotes.removeAt(index);
                  }, icon: const Icon(Icons.delete,color: Colors.red,))
            ],
          );
        
      });
    });
  }
}