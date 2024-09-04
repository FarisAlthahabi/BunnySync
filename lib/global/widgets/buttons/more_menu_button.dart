import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:flutter/material.dart';

class MoreMenuButton extends StatelessWidget {
  const MoreMenuButton({
    super.key,
    required this.onTap,
    this.color,
    this.isHorizontal,
    this.backgroundColor,
  });

  final VoidCallback onTap;
  final Color? color;
  final bool? isHorizontal;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        padding: AppConstants.padding4,
        minimumSize: Size.zero,
        backgroundColor: backgroundColor,
      ),
      child: Icon(
        color: color,
        isHorizontal == null
            ? Icons.more_vert_rounded
            : Icons.more_horiz_outlined,
      ),
    );
  }
}
