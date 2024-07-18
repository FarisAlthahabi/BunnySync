import 'package:bunny_sync/global/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class ImageErrorCoveredWidget extends StatelessWidget {
  const ImageErrorCoveredWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(Assets.icons.logo.path);
  }
}
