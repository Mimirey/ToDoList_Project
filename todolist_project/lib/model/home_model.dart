class Notes{
  String judul;
  String kegiatan;
  bool isDone;

  Notes({required this.judul, required this.kegiatan, this.isDone=false});

    Notes copyWith({
    String? judul,
    String? kegiatan,
    bool? isDone,
  }) {
    return Notes(
      judul: judul ?? this.judul,
      kegiatan: kegiatan ?? this.kegiatan,
      isDone: isDone ?? this.isDone,
    );
  }
}
