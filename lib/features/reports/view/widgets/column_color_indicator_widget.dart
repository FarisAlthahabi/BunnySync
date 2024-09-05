import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:flutter/material.dart';

class ColumnChartIndicatorModel {
  ColumnChartIndicatorModel({
    required this.label,
    required this.color,
  });
  final String label;
 final  Color color;
}

class ColumnColorIndicatorWidget extends StatelessWidget {
  const ColumnColorIndicatorWidget({
    super.key,
    required this.indicators,
  });

  final List<ColumnChartIndicatorModel> indicators ;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 20,
        ),
        ...List.generate(
          indicators.length,
          (index) => Row(
            children: [
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  borderRadius: AppConstants.borderRadius5,
                  color: indicators[index].color,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                indicators[index].label,
                style: context.tt.titleMedium,
              ),
              const SizedBox(width: 16),
            ],
          ),
        ),
      ],
    );
  }
}
