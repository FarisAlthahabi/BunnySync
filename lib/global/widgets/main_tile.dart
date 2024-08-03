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
    this.onEdit,
    this.model,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final VoidCallback? onTap;
  final List<BoxShadow>? boxShadow;
  final BorderRadius borderRadius;
  final ValueSetter<T>? onEdit;
  final T? model;

  @override
  Widget build(BuildContext context) {
    final model = this.model;
    final onEdit = this.onEdit;
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
          onTap: model == null || onEdit == null ? onTap : ()=> onEdit(model),
          child: Padding(
            padding: padding,
            child: child,
          ),
        ),
      ),
    );
  }
}
