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
    this.color,
  });

  final String url;
  final double size;
  final GenderTypes? gender;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final gender = this.gender;
    final color = this.color;
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
          : color != null
              ? Border.all(
                  width: 4.5,
                  color: color,
                )
              : null,
      borderRadius: AppConstants.circularBorderRadius,
    );
  }
}
