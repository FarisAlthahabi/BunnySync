import 'package:bunny_sync/global/gen/assets.gen.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/images/app_local_image_widget.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

DataRow2 litterRow({
  required VoidCallback onShowKitsTab,
  required BuildContext context,
  required VoidCallback onEditTab,
  required VoidCallback onDeleteTab,
  required int index,
}) {
  return DataRow2(
    cells: [
      DataCell(
        Center(
          child: InkWell(
            onTap: onShowKitsTab,
            child: Container(
              padding: AppConstants.padding3,
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.greyShade,
                  width: 1.5,
                ),
              ),
              child: const CircleAvatar(
                backgroundColor: AppColors.greenShade,
                child: Icon(
                  Icons.add,
                  color: AppColors.backgroundColor,
                  size: 16,
                ),
              ),
            ),
          ),
        ),
      ),
      DataCell(
        Center(
          child: Text(
            '${index + 1}',
          ),
        ),
      ),
      DataCell(
        Center(
          child: Text(
            'L0624AD',
            style: context.tt.bodyMedium?.copyWith(
              color: AppColors.mainColor,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
      DataCell(
        Center(
          child: AppLocalImageWidget(
            url: Assets.icons.logo.path,
            height: 40,
            width: 40,
            borderRadius: AppConstants.circularBorderRadius,
          ),
        ),
      ),
      DataCell(
        Center(
          child: AppLocalImageWidget(
            url: Assets.icons.logo.path,
            height: 40,
            width: 40,
            borderRadius: AppConstants.circularBorderRadius,
          ),
        ),
      ),
      const DataCell(
        Center(
          child: Text(
            '27\nDays',
          ),
        ),
      ),
      const DataCell(
        Center(
          child: Text(
            '8',
          ),
        ),
      ),
      const DataCell(
        Center(
          child: Text(
            '7',
          ),
        ),
      ),
      const DataCell(
        Center(
          child: Text(
            '1',
          ),
        ),
      ),
      const DataCell(
        Center(
          child: Text(
            '1',
          ),
        ),
      ),
      DataCell(
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: onEditTab,
                child: const Icon(
                  Icons.edit_note_outlined,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              InkWell(
                onTap: onDeleteTab,
                child: const Icon(Icons.delete_outline_outlined),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
