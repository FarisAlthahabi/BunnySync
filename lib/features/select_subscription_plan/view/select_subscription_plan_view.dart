import 'package:auto_route/auto_route.dart';
import 'package:bunny_sync/features/select_subscription_plan/models/feature_model.dart';
import 'package:bunny_sync/features/select_subscription_plan/models/plan_model.dart';
import 'package:bunny_sync/features/select_subscription_plan/view/widgets/feature_of_plan_tile.dart';
import 'package:bunny_sync/features/select_subscription_plan/view/widgets/plan_tile.dart';
import 'package:bunny_sync/features/select_subscription_plan/view/widgets/text_widgets.dart';
import 'package:bunny_sync/global/gen/assets.gen.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/router/router.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/buttons/main_action_button.dart';
import 'package:bunny_sync/global/widgets/main_app_bar.dart';
import 'package:flutter/material.dart';

abstract class SelectSubscriptionPlanViewCallBacks {
  void onSelectPlan(PlanModel plan);

  void onContinueTap();
}

@RoutePage()
class SelectSubscriptionPlanView extends StatelessWidget {
  const SelectSubscriptionPlanView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SelectSubscriptionPlanPage();
  }
}

class SelectSubscriptionPlanPage extends StatefulWidget {
  const SelectSubscriptionPlanPage({super.key});

  @override
  State<SelectSubscriptionPlanPage> createState() =>
      _SelectSubscriptionPlanPageState();
}

class _SelectSubscriptionPlanPageState extends State<SelectSubscriptionPlanPage>
    implements SelectSubscriptionPlanViewCallBacks {
  @override
  void onSelectPlan(PlanModel plan) {
    setState(() {
      selectedPlanIndex = plans.indexOf(plan);
    });
  }

  @override
  void onContinueTap() {
    context.router.push(SignInRoute());
  }

  //TODO: Should come from the bloc
  final plans = [
    PlanModel(
      id: 0,
      title: 'Personal',
      colorHex: '7267EF',
      icon: Assets.icons.profile.path,
      price: 3.9,
      yearlyPrice: 29,
      features: [
        FeatureModel('Duis cupidatat velitr', isSelected: true),
        FeatureModel('Officia aliqua sunt ', isSelected: true),
        FeatureModel('Enim aliquip labore dolo', isSelected: true),
        FeatureModel('Incididunt ex voluptate', isSelected: false),
        FeatureModel('Reprehenderit aliquip occaeca', isSelected: false),
      ],
    ),
    PlanModel(
      id: 1,
      title: 'Small team',
      colorHex: '15ABFF',
      icon: Assets.icons.meeting.path,
      price: 79,
      yearlyPrice: 7.9,
      features: [
        FeatureModel('Duis cupidatat velitr', isSelected: true),
        FeatureModel('Officia aliqua sunt ', isSelected: true),
        FeatureModel('Enim aliquip labore dolo', isSelected: true),
        FeatureModel('Incididunt ex voluptate', isSelected: true),
        FeatureModel('Reprehenderit aliquip occaeca', isSelected: true),
      ],
    ),
  ];

  //TODO: To be changed in bloc
  int selectedPlanIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: Text(
          'pricing_plan'.i18n,
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: SingleChildScrollView(
                padding: AppConstants.padding16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: PlanTile(
                            plan: plans[0],
                            isSelected: selectedPlanIndex == 0,
                            onSelect: onSelectPlan,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: PlanTile(
                            plan: plans[1],
                            isSelected: selectedPlanIndex == 1,
                            onSelect: onSelectPlan,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const DetailTextWidget(),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
                      color: context.cs.surfaceTint,
                      child: Text(
                        'features'.i18n,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(50, 55, 67, 1),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: plans[selectedPlanIndex].features.length,
                      itemBuilder: (context, index) {
                        return FeatureOfPlanTile(
                          feature: plans[selectedPlanIndex].features[index],
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 5,
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    const PrivacyPolicyTextWidget(),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 40,
              left: 16,
              right: 16,
              child: MainActionButton(
                onTap: onContinueTap,
                text: 'continue'.i18n,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
