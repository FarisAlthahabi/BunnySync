import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:flutter/material.dart';

class MainAddFloatingButton extends StatelessWidget {
  const MainAddFloatingButton({
    super.key,
    required this.onAddTap,
    this.padding,
  });

  final VoidCallback onAddTap;
  final double? padding;

  @override
  Widget build(BuildContext context) {
    final padding = this.padding;
    return Padding(
      padding:
          padding != null ? EdgeInsets.all(padding) : AppConstants.padding16,
      child: FloatingActionButton(
        onPressed: onAddTap,
        shape: RoundedRectangleBorder(
          borderRadius: AppConstants.circularBorderRadius,
        ),
        backgroundColor: context.cs.secondaryContainer,
        child: const Icon(Icons.add),
      ),
    );
  }
}
