import 'package:bunny_sync/features/breeders/models/breeder_entry_model/breeder_entry_model.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
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
    return SizedBox(
      height: 180,
      child: Padding(
        padding: AppConstants.padding16,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "breeder_options".i18n,
              style: context.tt.titleLarge?.copyWith(height: 1.3),
            ),
            SizedBox(
              width: 110,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "edit".i18n,
                    style: context.tt.bodyLarge
                        ?.copyWith(fontSize: 12, height: 1.2),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  InkWell(
                    hoverColor: AppColors.backgroundColor,
                    onTap: () {
                      onEditBreeder(breederEntryModel);
                    },
                    child: CircleAvatar(
                      backgroundColor: AppColors.greyShade9,
                      radius: 22,
                      child: Icon(
                        Icons.edit,
                        color: context.cs.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 110,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "delete".i18n,
                    style: context.tt.bodyLarge
                        ?.copyWith(fontSize: 12, height: 1.2),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  InkWell(
                    hoverColor: AppColors.backgroundColor,
                    onTap: onDeleteBreeder,
                    child: CircleAvatar(
                      backgroundColor: AppColors.greyShade9,
                      radius: 22,
                      child: Icon(
                        Icons.delete,
                        color: context.cs.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
