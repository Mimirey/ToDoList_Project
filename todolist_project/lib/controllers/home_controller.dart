import 'package:get/get.dart';
import 'package:todolist_project/model/home_model.dart';

class HomeController extends GetxController{
  var notes=<Notes>
  [
    
  ].obs;

  void updateNotes(int index, Notes note){
    notes[index]= note;
  }
}