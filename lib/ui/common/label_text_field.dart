import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LabelTextField extends StatelessWidget {
  final String label;
  final String? hintText;
  final IconData? icon;
  final bool obscureText;

  const LabelTextField({
    super.key,
    required this.label,
    this.hintText,
    this.icon,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: .min,
      crossAxisAlignment: .stretch,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: .bold,
          ),
        ),
        TextField(
          obscureText: obscureText,
          decoration: InputDecoration(
            prefixIcon: Icon(icon),
            hintText: hintText,
          ),
        )
      ],
    );
  }
}