import 'package:amrita_ayurvedic_app/core/themes/app_theme.dart';
import 'package:flutter/material.dart';

class SubTitleWidget extends StatelessWidget {
  final String title;
  const SubTitleWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: theme.spaces.space_300,
      ),
      child: Row(
        children: [
          Text(
            title,
            style: theme.typography.h400.copyWith(
              fontSize: 16,
            ),
          )
        ],
      ),
    );
  }
}
