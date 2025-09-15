import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todolist_project/controllers/clock_controller.dart';

class LiveClock extends StatelessWidget {
  final TextStyle? textStyle;
  final bool showSeconds;

  LiveClock({super.key, this.textStyle, this.showSeconds = true});

  final clockController = Get.put(ClockController(), permanent: true);

  @override
Widget build(BuildContext context) {
  return Obx(() {
    final now = clockController.currentTime.value;
    final formattedTime = showSeconds
        ? "${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}"
        : "${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}";
    
    final formattedDate = DateFormat('EEEE, d MMMM yyyy', 'id_ID').format(now); 

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          formattedDate,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          formattedTime,
          style: textStyle ??
              const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    );
  });
}
}
