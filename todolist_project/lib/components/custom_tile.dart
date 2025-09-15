import 'dart:ui';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';

class CustomTile extends StatelessWidget {
  final String judul;
  final String kegiatan;
  final bool done;
  final DateTime? deadline;
  final ValueChanged<bool?>? onChanged;

  const CustomTile({
    super.key,
    required this.judul,
    required this.kegiatan,
    required this.done,
    this.onChanged,
    this.deadline,
  });

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final isOverdue = deadline != null && deadline!.isBefore(DateTime.now());
    final int? daysLeft = deadline != null
        ? deadline!.difference(now).inDays
        : null;
    
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
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start, 
          children: [
            Text(
              "Catatan : $kegiatan",
              style: TextStyle(
                fontSize: 14,
                color: done ? Colors.grey : Colors.black54,
              ),
            ),
            if (deadline != null)
              Row(
                children: [
                  Icon(
                    Icons.calendar_today,
                    size: 14,
                    color: isOverdue ? Colors.red : Colors.blue,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    "Deadline: ${deadline!.toLocal().toString().split(' ')[0]}",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: isOverdue ? Colors.red : Colors.blue,
                      decoration: done ? TextDecoration.lineThrough : null,
                    ),
                  ),
                ],
              ),
              
            if (daysLeft != null)
            Text(
                isOverdue
                    ? "Lewat ${daysLeft!.abs()} hari"
                    : "Sisa ${daysLeft! + 1} hari", 
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: isOverdue ? Colors.red : Colors.green,
                ),
              ),
          ],
        ),
      ),
    );
  }
}