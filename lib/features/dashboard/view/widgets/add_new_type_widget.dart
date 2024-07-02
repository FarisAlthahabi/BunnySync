import 'package:bunny_sync/features/dashboard/view/widgets/breeder_type_widget.dart';
import 'package:bunny_sync/global/extensions/string_x.dart';
import 'package:bunny_sync/global/gen/assets.gen.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:flutter/material.dart';

class AddNewTypeWidget extends StatelessWidget {
  const AddNewTypeWidget({
    super.key,
    required this.onBreederTap,
    required this.onLitterTap,
  });

  final VoidCallback onBreederTap;
  final VoidCallback onLitterTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: Padding(
        padding: AppConstants.paddingH16,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "add_new_type".i18n,
              style: context.tt.titleLarge?.copyWith(height: 1.3),
            ),
            Row(
              children: [
                BreederTypeWidget(
                  onTap: onBreederTap,
                  icon: Assets.icons.genders.path.svg(
                    color: context.cs.primary,
                  ),
                  title: "breeder".i18n,
                ),
                const SizedBox(
                  width: 16,
                ),
                BreederTypeWidget(
                  onTap: onLitterTap,
                  icon: Assets.icons.squares.path.svg(
                    color: context.cs.primary,
                  ),
                  title: "litter".i18n,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
