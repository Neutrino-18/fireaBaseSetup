import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String labelText;

  const MyTextField({required this.labelText ,super.key});

  @override
  Widget build(BuildContext context) {
    return  TextField(
      decoration: InputDecoration(
        labelText: labelText,
      ),
    );
  }
}