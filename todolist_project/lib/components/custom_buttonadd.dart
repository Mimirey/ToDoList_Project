import 'package:flutter/material.dart';

class CustomButtonadd extends StatelessWidget {
  final VoidCallback onAdd;

  const CustomButtonadd({super.key, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        onAdd();
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Item Added')));
      },
      child: Icon(Icons.add),
    );
  }
}
