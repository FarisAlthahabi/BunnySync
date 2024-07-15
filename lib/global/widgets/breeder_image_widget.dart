import 'package:bunny_sync/global/gen/assets.gen.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/utils/enums/gender_types_enum.dart';
import 'package:bunny_sync/global/widgets/images/app_local_image_widget.dart';
import 'package:flutter/material.dart';

class BreederImageWidget extends StatelessWidget {
  const BreederImageWidget({
    super.key,
    this.size = 70,
    this.gender,
  });

  final double size;
  final GenderTypes? gender;

  @override
  Widget build(BuildContext context) {
    final gender = this.gender;

    return AppLocalImageWidget(
      url: Assets.icons.logo.path,
      width: size,
      height: size,
      fit: BoxFit.cover,
      border: gender != null
          ? Border.all(
              width: 4.5,
              color: gender.color(context),
            )
          : null,
      borderRadius: AppConstants.circularBorderRadius,
    );
  }
}
