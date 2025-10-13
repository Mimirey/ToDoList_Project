import 'package:todolist_project/model/sort_option.dart';

class Notes {
  final int? id; 
  String judul;
  String kegiatan;
  bool isDone;
  DateTime? deadline;
  final SortOption priority;

  Notes({
    this.id,
    required this.judul,
    required this.kegiatan,
    this.isDone = false,
    this.deadline,
    this.priority = SortOption.santai,
  });

  Notes copyWith({
    int? id,
    String? judul,
    String? kegiatan,
    bool? isDone,
    DateTime? deadline,
    SortOption? priority,
  }) {
    return Notes(
      id: id ?? this.id,
      judul: judul ?? this.judul,
      kegiatan: kegiatan ?? this.kegiatan,
      isDone: isDone ?? this.isDone,
      deadline: deadline ?? this.deadline,
      priority: priority ?? this.priority,
    );
  }
}
