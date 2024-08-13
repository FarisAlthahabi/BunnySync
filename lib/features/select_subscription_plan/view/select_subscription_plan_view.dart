import 'package:auto_route/auto_route.dart';
import 'package:bunny_sync/features/authentication/bloc/authentication_bloc.dart';
import 'package:bunny_sync/features/profile/model/user_model/user_fake_model.dart';
import 'package:bunny_sync/features/select_subscription_plan/models/feature_model.dart';
import 'package:bunny_sync/features/select_subscription_plan/models/plan_view_model.dart';
import 'package:bunny_sync/features/select_subscription_plan/view/widgets/features_list_view.dart';
import 'package:bunny_sync/features/select_subscription_plan/view/widgets/plan_tile.dart';
import 'package:bunny_sync/features/select_subscription_plan/view/widgets/text_widgets.dart';
import 'package:bunny_sync/global/gen/assets.gen.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/buttons/main_action_button.dart';
import 'package:bunny_sync/global/widgets/main_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class SelectSubscriptionPlanViewCallBacks {
  void onSelectPlan(PlanViewModel plan);

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
  late final AuthenticationBloc authenticationBloc = context.read();
  @override
  void onSelectPlan(PlanViewModel plan) {
    setState(() {
      selectedPlanIndex = plans.indexOf(plan);
    });
  }

  @override
  void onContinueTap() {
    authenticationBloc.add(IsAuthenticatedOrFirstTime());
  }

  //TODO: Should come from the bloc
  final plans = [
    PlanViewModel(
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
    PlanViewModel(
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
                      height: 30,
                    ),
                    const DetailTextWidget(),
                    const SizedBox(
                      height: 10,
                    ),
                    const FeaturesListView(
                      planModel: fakePlan,
                    ),
                    const SizedBox(height: 20),
                    PrivacyPolicyTextWidget(
                      text: 'by_joining'.i18n,
                    ),
                    const SizedBox(height: 100),
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
