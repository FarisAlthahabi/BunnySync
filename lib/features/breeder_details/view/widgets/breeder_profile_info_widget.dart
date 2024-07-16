import 'package:bunny_sync/features/breeders/models/breeder_entry_model/breeder_entry_model.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/images/app_image_widget.dart';
import 'package:flutter/material.dart';

class BreederProfileInfoWidget extends StatelessWidget {
  const BreederProfileInfoWidget({
    super.key,
    required this.breeder,
  });

  final BreederEntryModel breeder;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 70,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            AppImageWidget(
              width: 100,
              height: 100,
              url: breeder.photo,
              fit: BoxFit.cover,
              border: Border.all(
                width: 4.5,
                color: breeder.gender.color(context),
              ),
              borderRadius: AppConstants.circularBorderRadius,
            ),
            const SizedBox(width: 25),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  breeder.name,
                  style: context.tt.headlineSmall,
                ),
                const SizedBox(height: 15),
                Text(
                  '${'id'.i18n}: ${breeder.id} | ${'prefix'.i18n}: ${breeder.prefix}',
                  style: context.tt.bodyMedium,
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    breeder.gender.genderIcon,
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      breeder.gender.name,
                      style: context.tt.bodyMedium,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
