import 'package:bunny_sync/features/intro/models/goal_model.dart';
import 'package:bunny_sync/global/gen/assets.gen.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/multi_selector_widget.dart';
import 'package:flutter/material.dart';

abstract class SelectGoalScreenCallBacks {
  void onChecked(bool? isChecked);
}

class SelectGoalScreen extends StatelessWidget
    implements SelectGoalScreenCallBacks {
  const SelectGoalScreen({super.key});

  @override
  void onChecked(bool? isChecked) {}

  @override
  Widget build(BuildContext context) {
    //TODO: Should come from the bloc.
    final goals = [
      GoalModel(title: 'sewing'.i18n, icon: Assets.icons.sewing.path),
      GoalModel(title: 'fur'.i18n, icon: Assets.icons.fur.path),
      GoalModel(title: 'pet'.i18n, icon: Assets.icons.petHome.path),
    ];

    return Padding(
      padding: AppConstants.paddingH16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 50,
          ),
          Text(
            'select_your_goals'.i18n,
            textAlign: TextAlign.start,
            style: context.tt.headlineMedium,
          ),
          const SizedBox(height: 4),
          Text(
            'select_multiple_goals'.i18n,
            style: context.tt.bodyMedium,
          ),
          const SizedBox(
            height: 40,
          ),
          MultiSelectorWidget(
            options: goals,
            onChecked: (selected) {},
          ),
        ],
      ),
    );
  }
}
