
import 'package:amrita_ayurvedic_app/core/constants/app_assets.dart';
import 'package:amrita_ayurvedic_app/core/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageWidget extends HookWidget {
  const ImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final appAssets = AppAssetsConstants();

    return Stack(
      children: [
        SizedBox(
          width: MediaQuery.sizeOf(context).width,
          height: theme.spaces.space_500 * 6,
          child: Image.asset(
            appAssets.imgLogin,
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          top: 80,
          left: 160,
          child: SizedBox(
            width: theme.spaces.space_500 * 2.5,
            height: theme.spaces.space_500 * 2.5,
            child: SvgPicture.asset(
              appAssets.icLogo,
              fit: BoxFit.fill,
            ),
          ),
        )
      ],
    );
  }
}
