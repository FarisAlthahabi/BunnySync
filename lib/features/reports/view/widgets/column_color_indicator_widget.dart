import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:flutter/material.dart';

class ColumnColorIndicatorWidget extends StatelessWidget {
  const ColumnColorIndicatorWidget({
    super.key,
    required this.labels,
    required this.colors,
  });

  final List<String> labels;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 20,
        ),
        ...List.generate(
          labels.length,
          (index) => Row(
            children: [
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  borderRadius: AppConstants.borderRadius5,
                  color: colors[index],
                ),
              ),
              const SizedBox(width: 8),
              Text(
                labels[index],
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
