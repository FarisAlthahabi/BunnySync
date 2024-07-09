import 'package:bunny_sync/features/breeders/models/breeder_entry_model/breeder_entry_model.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:flutter/material.dart';

class BreederMoreOptionsWidget extends StatelessWidget {
  const BreederMoreOptionsWidget({
    super.key,
    required this.onEditBreeder,
    required this.onDeleteBreeder,
    required this.breederEntryModel,
  });

  final ValueSetter<BreederEntryModel> onEditBreeder;
  final VoidCallback onDeleteBreeder;
  final BreederEntryModel breederEntryModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextButton(
          onPressed: () => onEditBreeder(breederEntryModel),
          style: TextButton.styleFrom(
            alignment: AlignmentDirectional.centerStart,
          ),
          child: Text(
            "edit".i18n,
          ),
        ),
        TextButton(
          onPressed: onDeleteBreeder,
          style: TextButton.styleFrom(
            alignment: AlignmentDirectional.centerStart,
          ),
          child: Text(
            "delete".i18n,
          ),
        ),
      ],
    );
  }
}
