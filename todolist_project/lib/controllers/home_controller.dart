import 'package:get/get.dart';
import 'package:todolist_project/model/home_model.dart';

class HomeController extends GetxController{
  var notes=<Notes>
  [
    Notes(judul: "Kegiatan 1", kegiatan: "Nyuci piring" ),
    Notes(judul: "Kegiatan 2", kegiatan: "Makan")
  ].obs;

  void updateNotes(int index, Notes note){
    notes[index]= note;
  }
  void toogleDone(int index){
    final current= notes[index];
    notes[index].isDone = !notes[index].isDone;
    notes.refresh();
  }
}