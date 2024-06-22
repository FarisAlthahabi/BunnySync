import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:flutter/material.dart';

class MainTile extends StatelessWidget {
  const MainTile({
    super.key,
    this.padding = AppConstants.padding16,
    required this.child,
  });

  final EdgeInsetsGeometry padding;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: context.cs.surface,
        borderRadius: BorderRadius.circular(8),
        boxShadow: AppShadows.getTileShadow(context),
      ),
      child: child,
    );
  }
}
