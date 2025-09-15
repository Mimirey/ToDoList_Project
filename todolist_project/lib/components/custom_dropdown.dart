import 'package:flutter/material.dart';

class CustomDropdown<T> extends StatelessWidget {
  final String label;
  final List<T> items;
  final T? value;
  final ValueChanged<T?> onChanged;
  final String Function(T)? itemLabel;

  const CustomDropdown({super.key, required this.label, required this.items, this.value, required this.onChanged, this.itemLabel});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
        ),
        DropdownButtonFormField<T>(
          initialValue:value,
          items: items.map((T item){
            return DropdownMenuItem<T>(
              value: item,
              child: Text(itemLabel != null ? itemLabel!(item) : item.toString()));
          }).toList(),
          onChanged: onChanged,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal:12,vertical: 8),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))
          ),
        
      ),
    
    ]
    );
  }
}
