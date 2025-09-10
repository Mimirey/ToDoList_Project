import 'package:get/get.dart';
import 'package:todolist_project/model/home_model.dart';

class HomeController extends GetxController{
  var notes=<Notes>
  [
    Notes(judul: "Kegiatan 1", kegiatan: "Nyuci piring" ),
    Notes(judul: "Kegiatan 2", kegiatan: "Makan")
  ].obs;

  var completedNotes = <Notes>[].obs;

  void completeNoteAt(int index, {bool showUndo=true}){
    final note= notes.removeAt(index);
    completedNotes.insert(0, note.copyWith(isDone: true));
  }

  void updateNotes(int index, Notes note){
    notes[index]= note;
  }

  void uncompleteNoteAt(int index) {
    final note = completedNotes.removeAt(index);
    notes.insert(0, note.copyWith(isDone: false));
  }

  
  // void toogleDone(int index){
  //   final current= notes[index];
  //   notes[index].isDone = !notes[index].isDone;
  //   notes.refresh();
  // }
}