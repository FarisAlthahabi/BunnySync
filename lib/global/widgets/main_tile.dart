import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/bottom_sheet_widget.dart';
import 'package:flutter/material.dart';

class MainTile<T extends BottomSheetItemModel> extends StatelessWidget {
  const MainTile({
    super.key,
    required this.child,
    this.padding = AppConstants.padding16,
    this.borderRadius = AppConstants.borderRadius8,
    this.onTap,
    this.boxShadow,
    this.model,
    this.onEditTap,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final VoidCallback? onTap;
  final List<BoxShadow>? boxShadow;
  final BorderRadius borderRadius;
  final ValueSetter<T>? onEditTap;
  final T? model;

  @override
  Widget build(BuildContext context) {
    final onEditTap = this.onEditTap;
    final model = this.model;
    return Container(
      decoration: BoxDecoration(
        color: context.cs.surface,
        borderRadius: borderRadius,
        boxShadow: boxShadow ?? AppShadows.getTileShadow(context),
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          borderRadius: borderRadius,
          onTap: onEditTap != null && model != null
              ? () => onEditTap(model)
              : onTap,
          child: Padding(
            padding: padding,
            child: child,
          ),
        ),
      ),
    );
  }
}
