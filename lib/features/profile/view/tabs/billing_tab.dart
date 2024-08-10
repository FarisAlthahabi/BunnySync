import 'package:bunny_sync/features/profile/model/plan_model/plan_model.dart';
import 'package:bunny_sync/features/select_subscription_plan/view/widgets/features_list_view.dart';
import 'package:bunny_sync/features/select_subscription_plan/view/widgets/text_widgets.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:flutter/material.dart';

class BillingTab extends StatelessWidget {
  const BillingTab({
    super.key,
    required this.plan,
  });

  final PlanModel plan;

  @override
  Widget build(BuildContext context) {
    return BillingPage(plan: plan);
  }
}

class BillingPage extends StatefulWidget {
  const BillingPage({
    super.key,
    required this.plan,
  });

  final PlanModel plan;

  @override
  State<BillingPage> createState() => _BillingPageState();
}

class _BillingPageState extends State<BillingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: AppConstants.padding30,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: AppConstants.paddingB10,
                    child: Text(
                      widget.plan.options.modules.limit
                          ? 'unlimited'.i18n
                          : 'growth'.i18n,
                      style: context.tt.headlineMedium,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'plan'.i18n,
                    style: context.tt.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                strutStyle: const StrutStyle(height: 1.8),
                widget.plan.description,
                style: context.tt.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 20),
              FeaturesListView(
                planModel: widget.plan,
              ),
              const SizedBox(height: 20),
              const PrivacyPolicyTextWidget(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
