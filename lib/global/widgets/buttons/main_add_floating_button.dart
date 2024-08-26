import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:flutter/material.dart';

class MainAddFloatingButton extends StatelessWidget {
  const MainAddFloatingButton({
    super.key,
    required this.onAddTap,
  });

  final VoidCallback onAddTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppConstants.padding16,
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
