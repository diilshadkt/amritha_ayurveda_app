import 'package:amrita_ayurvedic_app/core/constants/login_constants.dart';
import 'package:amrita_ayurvedic_app/core/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class TitleWidget extends HookWidget {
  const TitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final appConstants = LoginConstants();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: theme.spaces.space_300),
      child: SizedBox(
        height: theme.spaces.space_400 * 2.6,
        child: Text(
          appConstants.txtHead,
          style: theme.typography.h600.copyWith(
            fontSize: theme.spaces.space_300 * 1.2,
          ),
        ),
      ),
    );
  }
}
