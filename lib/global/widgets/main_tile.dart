import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:flutter/material.dart';

class MainTile extends StatelessWidget {
  const MainTile({
    super.key,
    this.padding = AppConstants.padding16,
    required this.child,
    this.onTap,
    this.borderRadius,
  });

  final EdgeInsetsGeometry padding;
  final Widget child;
  final VoidCallback? onTap;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.cs.surface,
        borderRadius: AppConstants.borderRadius8,
        boxShadow: AppShadows.getTileShadow(context),
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          borderRadius: borderRadius ?? AppConstants.borderRadius8,
          onTap: onTap,
          child: Padding(
            padding: padding,
            child: child,
          ),
        ),
      ),
    );
  }
}
