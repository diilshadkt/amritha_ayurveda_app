import 'package:amrita_ayurvedic_app/core/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ButtonWidget extends HookWidget {
  final void Function()? onPressed;
  final String buttonName;
  const ButtonWidget({
    super.key,
    required this.buttonName,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: theme.spaces.space_300),
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: theme.spaces.space_500 * 1.4,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: theme.colors.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                theme.spaces.space_100,
              ),
            ),
          ),
          onPressed: onPressed,
          child: Text(
            buttonName,
            style: theme.typography.h500.copyWith(
              color: theme.colors.secondary,
            ),
          ),
        ),
      ),
    );
  }
}
