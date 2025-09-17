import 'package:get/get.dart';
import 'package:todolist_project/model/home_model.dart';
import 'package:todolist_project/model/sort_option.dart'; 


class HomeController extends GetxController{
  var notes=<Notes>
  [
    
  ].obs;

  var completedNotes = <Notes>[].obs;

  List<Notes> get urgentNotes =>
      notes.where((note) => note.priority == SortOption.urgent).toList();

  List<Notes> get pentingNotes =>
      notes.where((note) => note.priority == SortOption.penting).toList();

  List<Notes> get santaiNotes =>
      notes.where((note) => note.priority == SortOption.santai).toList();


   void completeNoteAt(Notes note) {
    final i = notes.indexOf(note);
    if (i != -1) {
      
      final updated = notes[i].copyWith(isDone: true);

      
      completedNotes.add(updated);

      notes.removeAt(i);
    }
  }

  void updateNotes(int index, Notes note){
    notes[index]= note;
  }

  void uncompleteNoteAt(int index) {
    final note = completedNotes.removeAt(index);
    notes.insert(0, note.copyWith(isDone: false));
  }

  
  
}