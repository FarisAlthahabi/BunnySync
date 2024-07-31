import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BoxedIconWidget extends StatelessWidget {
  const BoxedIconWidget({
    super.key,
    required this.icon,
    this.color,
    this.iconColor,
  });

  final String icon;
  final Color? color;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: AppConstants.borderRadius8,
        color: color,
      ),
      child: SvgPicture.asset(
        icon,
        color: iconColor,
      ),
    );
  }
}
