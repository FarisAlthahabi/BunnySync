import 'package:bunny_sync/features/breeders/models/breeder_model.dart';
import 'package:bunny_sync/global/gen/assets.gen.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/widgets/breeder_image_widget.dart';
import 'package:flutter/material.dart';

class BreederProfileInfo extends StatelessWidget {
  const BreederProfileInfo({
    super.key,
    required this.breeder,
  });

  final BreederModel breeder;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        children: [
          const SizedBox(
            height: 70,
          ),
          Row(
            children: [
              BreederImageWidget(
                size: 100,
                image: breeder.image,
                maleOrFemale: true,
              ),
              const SizedBox(width: 35),
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
                      Assets.icons.genders.svg(),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        'buck',
                        style: context.tt.bodyMedium,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
