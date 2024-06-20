import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerPlaceHolderWidget extends StatelessWidget {
  const ShimmerPlaceHolderWidget({
    super.key,
    this.height,
    this.radius = AppConstants.value12,
    required this.backgroundColor,
    required this.highlightColor,
  });

  final double? height;
  final double radius;
  final Color backgroundColor;
  final Color highlightColor;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Shimmer.fromColors(
        baseColor: backgroundColor,
        highlightColor: highlightColor,
        child: Container(
          height: height,
          color: backgroundColor,
        ),
      ),
    );
  }
}
