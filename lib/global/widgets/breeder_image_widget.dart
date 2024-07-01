import 'package:bunny_sync/global/gen/assets.gen.dart';
import 'package:bunny_sync/global/theme/theme_extensions/app_theme_extension/app_theme_extension.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/images/app_local_image_widget.dart';
import 'package:flutter/material.dart';

class BreederImageWidget extends StatelessWidget {
  const BreederImageWidget({
    super.key,
    required this.maleOrFemale,
    this.size = 70,
  });

  final bool maleOrFemale;
  final double size;

  @override
  Widget build(BuildContext context) {
    return AppLocalImageWidget(
      url: Assets.icons.logo.path,
      width: size,
      height: size,
      fit: BoxFit.cover,
      border: Border.all(
        width: 4.5,
        color: maleOrFemale? context.appThemeExtension.maleColor : context.appThemeExtension.femaleColor,
      ),
      borderRadius: AppConstants.circularBorderRadius,
    );
  }
}
