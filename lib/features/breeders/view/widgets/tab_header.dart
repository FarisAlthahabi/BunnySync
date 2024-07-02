import 'package:bunny_sync/global/theme/theme_extensions/app_theme_extension/app_theme_extension.dart';
import 'package:bunny_sync/global/widgets/indicator_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class TabHeader extends StatelessWidget {
  const TabHeader({
    super.key,
    required this.text,
    this.indicatorValue,
  });

  final String text;
  final String? indicatorValue;

  @override
  Widget build(BuildContext context) {
    final indicatorValue = this.indicatorValue;

    return Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text),
          if (indicatorValue != null)
          Row(
            children: [
              const SizedBox(width: 8),
              Skeleton.shade(
                child: IndicatorInfoWidget(
                  value: indicatorValue,
                  color: context.appThemeExtension.indicatorInfoColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
