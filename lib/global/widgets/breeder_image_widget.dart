import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/utils/enums/gender_types_enum.dart';
import 'package:bunny_sync/global/widgets/images/app_image_widget.dart';
import 'package:flutter/material.dart';

class BreederImageWidget extends StatelessWidget {
  const BreederImageWidget({
    super.key,
    required this.url,
    this.size = 70,
    this.gender,
  });

  final String url;
  final double size;
  final GenderTypes? gender;

  @override
  Widget build(BuildContext context) {
    final gender = this.gender;

    return AppImageWidget(
      url: url,
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
