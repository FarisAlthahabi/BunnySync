import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:flutter/material.dart';

abstract class GlobalModel {}

class BottomSheetWidget<T extends GlobalModel> extends StatelessWidget {
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
            if (child != null) child!,
            if (child == null)
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextButton(
                    onPressed: () => onEdit!(model!),
                    style: TextButton.styleFrom(
                      alignment: AlignmentDirectional.centerStart,
                    ),
                    child: Text(
                      "edit".i18n,
                    ),
                  ),
                  TextButton(
                    onPressed: () => onDelete!(model!),
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
