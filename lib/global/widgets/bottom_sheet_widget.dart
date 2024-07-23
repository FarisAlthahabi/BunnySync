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
    this.onBreed,
    this.onBirth,
    this.onCageCard,
    this.onPedigree,
    this.onSell,
    this.onWeight,
    this.onButcher,
    this.onDied,
    this.onArchive,
    this.onCull,
    this.onNotes,
  });

  final String title;
  final Widget? child;
  final ValueSetter<T>? onEdit;
  final ValueSetter<T>? onBreed;
  final ValueSetter<T>? onBirth;
  final ValueSetter<T>? onCageCard;
  final ValueSetter<T>? onPedigree;
  final ValueSetter<T>? onSell;
  final ValueSetter<T>? onWeight;
  final ValueSetter<T>? onButcher;
  final ValueSetter<T>? onDied;
  final ValueSetter<T>? onArchive;
  final ValueSetter<T>? onCull;
  final ValueSetter<T>? onNotes;
  final ValueSetter<T>? onDelete;
  final T? model;

  @override
  Widget build(BuildContext context) {
    final child = this.child;
    final onEdit = this.onEdit;
    final onBreed = this.onBreed;
    final onBirth = this.onBirth;
    final onCageCard = this.onCageCard;
    final onPedigree = this.onPedigree;
    final onSell = this.onSell;
    final onWeight = this.onWeight;
    final onButcher = this.onButcher;
    final onDied = this.onDied;
    final onArchive = this.onArchive;
    final onCull = this.onCull;
    final onNotes = this.onArchive;
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
                  if (onBreed != null && model != null)
                    TextButton(
                      onPressed: () => onBreed(model),
                      style: TextButton.styleFrom(
                        alignment: AlignmentDirectional.centerStart,
                      ),
                      child: Text(
                        "breed".i18n,
                      ),
                    ),
                  if (onBirth != null && model != null)
                    TextButton(
                      onPressed: () => onBirth(model),
                      style: TextButton.styleFrom(
                        alignment: AlignmentDirectional.centerStart,
                      ),
                      child: Text(
                        "birth".i18n,
                      ),
                    ),
                  if (onCageCard != null && model != null)
                    TextButton(
                      onPressed: () => onCageCard(model),
                      style: TextButton.styleFrom(
                        alignment: AlignmentDirectional.centerStart,
                      ),
                      child: Text(
                        "cage_card".i18n,
                      ),
                    ),
                  if (onPedigree != null && model != null)
                    TextButton(
                      onPressed: () => onPedigree(model),
                      style: TextButton.styleFrom(
                        alignment: AlignmentDirectional.centerStart,
                      ),
                      child: Text(
                        "pedigree".i18n,
                      ),
                    ),
                  if (onSell != null && model != null)
                    TextButton(
                      onPressed: () => onSell(model),
                      style: TextButton.styleFrom(
                        alignment: AlignmentDirectional.centerStart,
                      ),
                      child: Text(
                        "sell".i18n,
                      ),
                    ),
                  if (onWeight != null && model != null)
                    TextButton(
                      onPressed: () => onWeight(model),
                      style: TextButton.styleFrom(
                        alignment: AlignmentDirectional.centerStart,
                      ),
                      child: Text(
                        "weight".i18n,
                      ),
                    ),
                  if (onButcher != null && model != null)
                    TextButton(
                      onPressed: () => onButcher(model),
                      style: TextButton.styleFrom(
                        alignment: AlignmentDirectional.centerStart,
                      ),
                      child: Text(
                        "butcher".i18n,
                      ),
                    ),
                  if (onDied != null && model != null)
                    TextButton(
                      onPressed: () => onDied(model),
                      style: TextButton.styleFrom(
                        alignment: AlignmentDirectional.centerStart,
                      ),
                      child: Text(
                        "died".i18n,
                      ),
                    ),
                  if (onArchive != null && model != null)
                    TextButton(
                      onPressed: () => onArchive(model),
                      style: TextButton.styleFrom(
                        alignment: AlignmentDirectional.centerStart,
                      ),
                      child: Text(
                        "archive".i18n,
                      ),
                    ),
                  if (onCull != null && model != null)
                    TextButton(
                      onPressed: () => onCull(model),
                      style: TextButton.styleFrom(
                        alignment: AlignmentDirectional.centerStart,
                      ),
                      child: Text(
                        "cull".i18n,
                      ),
                    ),
                  if (onNotes != null && model != null)
                    TextButton(
                      onPressed: () => onNotes(model),
                      style: TextButton.styleFrom(
                        alignment: AlignmentDirectional.centerStart,
                      ),
                      child: Text(
                        "notes".i18n,
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
