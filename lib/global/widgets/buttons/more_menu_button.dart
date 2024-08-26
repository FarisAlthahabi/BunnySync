import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:flutter/material.dart';

class MoreMenuButton extends StatelessWidget {
  const MoreMenuButton({
    super.key,
    required this.onTap,
    this.color,
  });

  final VoidCallback onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        padding: AppConstants.padding4,
        minimumSize: Size.zero,
        backgroundColor: color,
      ),
      child: const Icon(Icons.more_vert_rounded),
    );
  }
}
