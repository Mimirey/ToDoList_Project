import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextfield extends StatelessWidget {
  final bool isNumber;
  final TextEditingController controller;
  final String label;
  final Color labelColor;
  final bool pass; // pass/hide dikontrol dari parent
  final VoidCallback? onSuffixIconTap;

  const CustomTextfield({
    super.key,
    required this.controller,
    required this.label,
    required this.labelColor,
    this.pass = false,
    this.isNumber = false,
    this.onSuffixIconTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: pass,
      keyboardType: isNumber
          ? TextInputType.number
          : (pass ? TextInputType.visiblePassword : TextInputType.text),
      inputFormatters: isNumber ? [FilteringTextInputFormatter.digitsOnly] : [],
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: labelColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        suffixIcon: onSuffixIconTap != null
            ? IconButton(
                icon: Icon(pass ? Icons.visibility_off : Icons.visibility),
                onPressed: onSuffixIconTap,
              )
            : null,
      ),
    );
  }
}