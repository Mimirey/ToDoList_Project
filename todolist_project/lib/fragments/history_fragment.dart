import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:todolist_project/components/custom_colors.dart';
import 'package:todolist_project/components/custom_tile.dart';
import 'package:todolist_project/controllers/home_controller.dart';

class HistoryFragment extends StatelessWidget {
  HistoryFragment({super.key});
  final homeController= Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
        "History",
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
          color: AppColors.textPrimary,
        ),
      ),
      backgroundColor: AppColors.background,
      centerTitle: true,
      toolbarHeight: 50,
      ),

      body: Obx((){
        
        if (homeController.completedNotes.isEmpty) {
          return const Center(
            child: Text(
              "Belum ada catatan selesai",
              style: TextStyle(fontSize: 16, color: AppColors.textPrimary),
            ),
          );
        }
        
        return ListView.builder(
          padding: const EdgeInsets.all(20),
          itemCount: homeController.completedNotes.length,
          itemBuilder: (context, index){
            return Container(
              margin: const EdgeInsets.only(bottom: 8),
              decoration: BoxDecoration(
                color: AppColors.background2,
                borderRadius: BorderRadius.circular(12),
              ),
              
              child: Row(
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
            ),
          );
        });
      }),
    );
  }
}