import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todolist_project/controllers/home_controller.dart';
import 'package:todolist_project/model/home_model.dart';

class CustomTile extends StatelessWidget {
  final String judul;
  final String kegiatan;
  final bool done;
  final ValueChanged<bool?>? onChanged;
  const CustomTile({super.key, required this.judul, required this.kegiatan, required this.done, this.onChanged});

  @override
  Widget build(BuildContext context) {
     return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16), 
      ),
      elevation: 4, 
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Transform.scale(
          scale: 1.3, 
          child: Checkbox(
            value: done,
            onChanged: onChanged,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6), 
            ),
            activeColor: Colors.deepPurple, 
            checkColor: Colors.white, 
          ),
        ),
        title: Text(
          judul,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            decoration: done ? TextDecoration.lineThrough : null,
            color: done ? Colors.grey : Colors.black87,
          ),
        ),
        subtitle: Text(
          "Catatan : $kegiatan",
          style: TextStyle(
            fontSize: 14,
            color: done ? Colors.grey : Colors.black54,
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      ),
    );
  
  }
}