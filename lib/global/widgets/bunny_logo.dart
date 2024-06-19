import 'package:bunny_sync/global/gen/assets.gen.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:flutter/material.dart';

class BunnyLogo extends StatelessWidget {
  const BunnyLogo({
    super.key,
    this.size = 74,
    this.borderRadius = AppConstants.borderRadius18,
  });

  final double size;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: Assets.icons.logo.image(
        width: size,
        height: size,
      ),
    );
  }
}
