import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  const CustomDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DropdownButton<String>(
        items:
            <String>['Sekolah', 'Kerja', 'Personal'].map((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
        hint: Text('Select Item'),
        onChanged: (String? value) {}, // masih belom berfungsi :v
      ),
    );
  }
}
