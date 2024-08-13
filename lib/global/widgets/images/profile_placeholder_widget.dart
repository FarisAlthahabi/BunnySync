import 'package:bunny_sync/global/gen/assets.gen.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:flutter/material.dart';

class ProfilePlaceholderWidget extends StatelessWidget {
  const ProfilePlaceholderWidget({
    super.key,
    this.size = 40,
    this.padding = 0,
    this.imageSize,
  });

  final double size;
  final double padding;
  final double? imageSize;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: size,
      backgroundColor: context.cs.tertiaryFixed,
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: Assets.icons.profile.svg(
          width: imageSize,
          height: imageSize,
          color: context.cs.surfaceContainerHighest,
        ),
      ),
    );
  }
}
