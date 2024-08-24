import 'package:bunny_sync/features/litter_details/view/widgets/litter_profile_info_widget.dart';
import 'package:bunny_sync/features/litters/models/litter_entry_model/litter_entry_model.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/models/rabbit_property_model.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/info_properties_widget.dart';
import 'package:bunny_sync/global/widgets/main_tile.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class LitterTile extends StatelessWidget {
  const LitterTile({
    super.key,
    required this.litter,
    required this.onTap,
    required this.onMoreOptionsTap,
  });

  final LitterEntryModel litter;
  final ValueSetter<LitterEntryModel> onTap;
  final ValueSetter<LitterEntryModel> onMoreOptionsTap;

  @override
  Widget build(BuildContext context) {
    final properties = [
      RabbitPropertyModel(
        title: 'total'.i18n,
        //TODO: Not sure about this
        value: litter.live.toString(),
      ),
      RabbitPropertyModel(
        title: 'kits'.i18n,
        value: litter.kits.toString(),
      ),
      RabbitPropertyModel(
        title: 'age'.i18n,
        value: litter.age,
      ),
      RabbitPropertyModel(
        title: 'average'.i18n,
        //TODO: Not sure about this
        value: 'average'.i18n,
      ),
      RabbitPropertyModel(
        title: 'born'.i18n,
        value: litter.born,
      ),
      RabbitPropertyModel(
        title: 'died'.i18n,
        value: litter.dead.toString(),
      ),
    ];
    return MainTile(
      padding: AppConstants.paddingSB16,
      onTap: () => onTap(litter),
      child: Column(
        children: [
          Stack(
            children: [
              Padding(
                padding: AppConstants.paddingTE16,
                child: LitterProfileInfoWidget(
                  litter: litter,
                ),
              ),
              PositionedDirectional(
                top: 0,
                end: 0,
                child: TextButton(
                  onPressed: () {
                    onMoreOptionsTap(litter);
                  },
                  style: TextButton.styleFrom(
                    padding: AppConstants.padding4,
                    minimumSize: Size.zero,
                  ),
                  child: const Icon(Icons.more_vert_rounded),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsetsDirectional.only(end: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Row(
                  children: [
                    Spacer(
                      flex: 15,
                    ),
                    Expanded(
                      flex: 70,
                      child: Skeleton.shade(child: Divider()),
                    ),
                    Spacer(
                      flex: 15,
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Center(
                  child: InfoPropertiesWidget(
                    properties: properties.sublist(0, 5),
                    propertyStructures: [
                      PropertyStructure(
                        mainAxisCellCount: 1.6,
                        crossAxisCellCount: 3,
                      ),
                      PropertyStructure(
                        mainAxisCellCount: 1.6,
                        crossAxisCellCount: 3,
                      ),
                      PropertyStructure(
                        mainAxisCellCount: 1.6,
                        crossAxisCellCount: 2,
                      ),
                      PropertyStructure(
                        mainAxisCellCount: 1.6,
                        crossAxisCellCount: 2,
                      ),
                      PropertyStructure(
                        mainAxisCellCount: 1.6,
                        crossAxisCellCount: 2,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
