import 'package:amrita_ayurvedic_app/core/themes/app_theme.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String labelText;
  final Widget? icon;
  final TextEditingController controller;
  const TextFieldWidget(
      {super.key,
      required this.labelText,
      required this.controller,
      this.icon});

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context).colors;
    final space = AppTheme.of(context).spaces;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: space.space_300,
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          fillColor: colors.textInverse,
          filled: true,
          labelText: labelText,
          suffixIcon: icon,
          labelStyle: TextStyle(color: colors.textSubtle),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: colors.textInverse,
              width: 0.1,
            ),
          ),
        ),
      ),
    );
  }
}
