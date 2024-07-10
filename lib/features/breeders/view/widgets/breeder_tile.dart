import 'package:bunny_sync/features/breeders/models/breeder_entry_model/breeder_entry_model.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/models/rabbit_property_model.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/breeder_image_widget.dart';
import 'package:bunny_sync/global/widgets/info_properties_widget.dart';
import 'package:bunny_sync/global/widgets/main_tile.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BreederTile extends StatelessWidget {
  const BreederTile({
    super.key,
    required this.breeder,
    required this.onTap,
    required this.onMoreOptionsTap,
  });

  final BreederEntryModel breeder;
  final ValueSetter<BreederEntryModel> onTap;
  final ValueChanged<BreederEntryModel> onMoreOptionsTap;

  @override
  Widget build(BuildContext context) {
    final rabbitProperties = [
      RabbitPropertyModel(title: 'litters'.i18n, value: breeder.litters ?? '-'),
      RabbitPropertyModel(title: 'kits'.i18n, value: breeder.kits ?? '-'),
      RabbitPropertyModel(title: 'age'.i18n, value: breeder.age ?? '-'),
      RabbitPropertyModel(title: 'weight'.i18n, value: breeder.weight ?? '-'),
    ];

    return MainTile(
      padding: AppConstants.paddingSB16,
      onTap: () => onTap(breeder),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: AppConstants.paddingT16,
                child: Row(
                  children: [
                    const Skeleton.shade(
                      child: BreederImageWidget(
                        maleOrFemale: true,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          breeder.name,
                          style: context.tt.headlineSmall,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          '${'id'.i18n}: ${breeder.id} | ${'prefix'.i18n}: ${breeder.prefix}',
                          style: context.tt.bodyMedium,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Spacer(),
              const SizedBox(width: 3),
              TextButton(
                onPressed: () {
                  onMoreOptionsTap(breeder);
                },
                style: TextButton.styleFrom(
                  padding: AppConstants.padding4,
                  minimumSize: Size.zero,
                ),
                child: const Icon(Icons.more_vert_rounded),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Row(
            children: [
              Spacer(
                flex: 15,
              ),
              Expanded(
                flex: 70,
                child: Skeleton.shade(
                  child: Divider(),
                ),
              ),
              Spacer(
                flex: 15,
              ),
            ],
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsetsDirectional.only(end: 16.0),
            child: InfoPropertiesWidget(
              properties: rabbitProperties,
              propertyStructures: List.generate(
                rabbitProperties.length,
                (index) {
                  return PropertyStructure(
                    mainAxisCellCount: 1.6,
                    crossAxisCellCount: 3,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
