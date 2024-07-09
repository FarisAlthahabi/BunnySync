import 'package:bunny_sync/features/dashboard/view/widgets/new_type_widget.dart';
import 'package:bunny_sync/global/extensions/string_x.dart';
import 'package:bunny_sync/global/gen/assets.gen.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/theme/theme.dart';
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
    return Row(
      children: [
        NewTypeWidget(
          onTap: onBreederTap,
          icon: Assets.icons.genders.path.svg(
            color: context.cs.primary,
          ),
          title: "breeder".i18n,
        ),
        const SizedBox(
          width: 16,
        ),
        NewTypeWidget(
          onTap: onLitterTap,
          icon: Assets.icons.squares.path.svg(
            color: context.cs.primary,
          ),
          title: "litter".i18n,
        ),
      ],
    );
  }
}
