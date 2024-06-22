import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

abstract class InfoPropertyModel {
  String get title;

  String get value;
}

class PropertyStructure {
  PropertyStructure({
    required this.crossAxisCellCount,
    required this.mainAxisCellCount,
  });

  final num mainAxisCellCount;
  final int crossAxisCellCount;
}

class InfoPropertiesWidget<T extends InfoPropertyModel>
    extends StatelessWidget {
  const InfoPropertiesWidget({
    super.key,
    required this.properties,
    required this.propertyStructures,
  });

  final List<T> properties;
  final List<PropertyStructure> propertyStructures;

  @override
  Widget build(BuildContext context) {
    return StaggeredGrid.count(
      crossAxisCount: 6,
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      children: List.generate(
        properties.length,
        (index) {
          final property = properties[index];
          final propertyStructure = propertyStructures[index];
          return StaggeredGridTile.count(
            mainAxisCellCount: propertyStructure.mainAxisCellCount,
            crossAxisCellCount: propertyStructure.crossAxisCellCount,
            child: Container(
              padding: AppConstants.padding12,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: context.cs.primary,
                  width: 1.3,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    property.title,
                    style: context.tt.headlineSmall?.copyWith(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 2),
                  const Spacer(),
                  Text(
                    property.value,
                    style: context.tt.bodyMedium,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}