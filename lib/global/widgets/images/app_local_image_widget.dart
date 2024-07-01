import 'package:flutter/material.dart';

class AppLocalImageWidget extends StatelessWidget {
  const AppLocalImageWidget({
    super.key,
    required this.url,
    this.borderRadius = BorderRadius.zero,
    this.fit,
    this.width,
    this.height,
    this.border,
  });

  final String url;
  final BorderRadiusGeometry borderRadius;
  final BoxFit? fit;
  final double? width;
  final double? height;
  final Border? border;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: border,
        borderRadius: borderRadius,
      ),
      child: ClipRRect(
        borderRadius: borderRadius,
        child: SizedBox(
          width: width,
          height: height,
          child: Image.asset(
            url,
            fit: fit,
          ),
        ),
      ),
    );
  }
}
