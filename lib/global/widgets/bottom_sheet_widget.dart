import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:flutter/material.dart';

abstract class BottomSheetItemModel {}

class BottomSheetWidget<T extends BottomSheetItemModel>
    extends StatelessWidget {
  const BottomSheetWidget({
    super.key,
    required this.title,
    this.model,
    this.onEdit,
    this.onDelete,
    this.child,
  });

  final String title;
  final Widget? child;
  final ValueSetter<T>? onEdit;
  final ValueSetter<T>? onDelete;
  final T? model;

  @override
  Widget build(BuildContext context) {
    final child = this.child;
    final onEdit = this.onEdit;
    final onDelete = this.onDelete;
    final model = this.model;

    if (child == null && model == null) {
      throw Exception(
        "Either child or model should be provided to BottomSheetWidget",
      );
    }

    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 16,
          left: 16,
          right: 16,
          bottom: 16,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: context.tt.titleLarge?.copyWith(height: 1.3),
            ),
            const SizedBox(height: 12),
            if (child != null) child,
            if (child == null)
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (onEdit != null && model != null)
                    TextButton(
                      onPressed: () => onEdit(model),
                      style: TextButton.styleFrom(
                        alignment: AlignmentDirectional.centerStart,
                      ),
                      child: Text(
                        "edit".i18n,
                      ),
                    ),
                  if (onDelete != null && model != null)
                    TextButton(
                      onPressed: () => onDelete(model),
                      style: TextButton.styleFrom(
                        alignment: AlignmentDirectional.centerStart,
                      ),
                      child: Text(
                        "delete".i18n,
                      ),
                    ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
