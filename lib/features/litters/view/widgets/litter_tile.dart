import 'package:bunny_sync/features/litter_details/view/widgets/litter_profile_info_widget.dart';
import 'package:bunny_sync/features/litters/models/litter_model.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/info_properties_widget.dart';
import 'package:bunny_sync/global/widgets/main_tile.dart';
import 'package:flutter/material.dart';

class LitterTile extends StatelessWidget {
  const LitterTile({
    super.key,
    required this.litter,
    required this.onTap,
  });

  final LitterModel litter;
  final ValueSetter<LitterModel> onTap;

  @override
  Widget build(BuildContext context) {
    return MainTile(
      onTap: () => onTap(litter),
      child: Column(
        children: [
          Stack(
            children: [
              LitterProfileInfoWidget(
                litter: litter,
              ),
              Align(
                alignment: AlignmentDirectional.topEnd,
                child: TextButton(
                  onPressed: () {},
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
          const Row(
            children: [
              Spacer(
                flex: 15,
              ),
              Expanded(
                flex: 70,
                child: Divider(),
              ),
              Spacer(
                flex: 15,
              ),
            ],
          ),
          const SizedBox(height: 24),
          InfoPropertiesWidget(
            properties: litter.properties.sublist(0, 5),
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
        ],
      ),
    );
  }
}
