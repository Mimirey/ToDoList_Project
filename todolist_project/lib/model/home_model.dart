import 'package:flutter/scheduler.dart';
import 'package:todolist_project/model/sort_option.dart';
import 'package:todolist_project/page/addNote_page.dart';

class Notes{
  String judul;
  String kegiatan;
  bool isDone;
  DateTime? deadline;
  final SortOption priority;

  Notes({required this.judul, required this.kegiatan, this.isDone=false, this.deadline,this.priority= SortOption.santai});

    Notes copyWith({
    String? judul,
    String? kegiatan,
    bool? isDone,
    DateTime? deadline,
    SortOption? priority,
    
  }) {
    return Notes(
      judul: judul ?? this.judul,
      kegiatan: kegiatan ?? this.kegiatan,
      isDone: isDone ?? this.isDone,
      deadline: deadline?? this.deadline,
      priority: priority ?? this.priority,
    );
  }
}
