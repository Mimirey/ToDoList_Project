import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final bool isNumber;
  final TextEditingController controller;
  final String label;
  final Color labelColor;
  final bool pass;

  const CustomTextfield({
    super.key,
    required this.controller,
    required this.label,
    required this.labelColor,
    required this.pass,
    required this.isNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        controller: controller,
        obscureText: pass,
        keyboardType: isNumber ? TextInputType.number : TextInputType.text,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: labelColor),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
