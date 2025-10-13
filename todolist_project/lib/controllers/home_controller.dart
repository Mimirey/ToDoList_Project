import 'package:get/get.dart';
import 'package:todolist_project/db_todolist.';
import 'package:todolist_project/model/home_model.dart';
import 'package:todolist_project/model/sort_option.dart';

class HomeController extends GetxController {
  final db = NotesDB(); 
  var notes = <Notes>[].obs;
  var completedNotes = <Notes>[].obs;

  List<Notes> get urgentNotes =>
      notes.where((note) => note.priority == SortOption.urgent).toList();

  List<Notes> get pentingNotes =>
      notes.where((note) => note.priority == SortOption.penting).toList();

  List<Notes> get santaiNotes =>
      notes.where((note) => note.priority == SortOption.santai).toList();

 
  Future<void> loadNotes() async {
    final allNotes = await db.getNotes();

    
    final List<Notes> typedNotes = allNotes.cast<Notes>();

    
    notes.value = typedNotes.where((note) => !note.isDone).toList();
    completedNotes.value = typedNotes.where((note) => note.isDone).toList();

    print("Loaded notes: ${typedNotes.map((e) => '${e.judul} - ${e.isDone}').toList()}");
  }

  
  Future<void> addNote(Notes note) async {
    await db.insertNote(note);
    await loadNotes();
  }

  
  Future<void> editNote(Notes note) async {
    if (note.id != null) {
      await db.updateNote(note.id!, note);
      await loadNotes();
    }
  }

  
  Future<void> deleteNote(int id) async {
    await db.deleteNote(id);
    await loadNotes();
  }

  
  void completeNoteAt(Notes note) async {
    final updated = note.copyWith(isDone: true);
    if (note.id != null) {
      await db.updateNote(note.id!, updated);
      await loadNotes();
    }
  }

  
  void uncompleteNoteAt(Notes note) async {
    final updated = note.copyWith(isDone: false);
    if (note.id != null) {
      await db.updateNote(note.id!, updated);
      await loadNotes();
    }
  }

  @override
  void onInit() {
    super.onInit();
    loadNotes();
  }
}