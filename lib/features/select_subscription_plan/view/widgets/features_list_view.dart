import 'package:bunny_sync/features/profile/model/plan_model/plan_model.dart';
import 'package:bunny_sync/features/select_subscription_plan/models/feature_model.dart';
import 'package:bunny_sync/features/select_subscription_plan/view/widgets/feature_of_plan_tile.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:flutter/material.dart';

class FeaturesListView extends StatefulWidget {
  const FeaturesListView({
    super.key,
    required this.planModel,
  });

  final PlanModel planModel;

  @override
  State<FeaturesListView> createState() => _FeaturesListViewState();
}

class _FeaturesListViewState extends State<FeaturesListView> {
  bool isShowMore = false;

  @override
  Widget build(BuildContext context) {
    final Map<String, bool> map = {};
    for (final feature in widget.planModel.features) {
      map[feature] = false;
    }
    final features = List.generate(
      widget.planModel.features.length,
      (index) => FeatureModel(
        widget.planModel.features[index],
        isSelected: widget.planModel.options.modules.limit,
      ),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Switch(
              inactiveTrackColor: context.cs.onPrimary,
              value: isShowMore,
              onChanged: (value) {
                setState(() {
                  isShowMore = value;
                });
              },
            ),
            const SizedBox(width: 10),
            Text(
              isShowMore ? 'show_less_features'.i18n : 'show_all_features'.i18n,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: context.cs.primaryFixed,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          color: context.cs.surfaceTint,
          child: Row(
            children: [
              Text(
                'features'.i18n,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: context.cs.primaryFixed,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 5),
        ConstrainedBox(
          constraints: isShowMore
              ? const BoxConstraints()
              : const BoxConstraints(maxHeight: 220),
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: widget.planModel.features.length,
            itemBuilder: (context, index) {
              return FeatureOfPlanTile(
                feature: features[index],
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 5,
              );
            },
          ),
        ),
      ],
    );
  }
}
