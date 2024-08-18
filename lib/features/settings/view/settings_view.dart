import 'package:auto_route/auto_route.dart';
import 'package:bunny_sync/features/settings/models/settings_tile_model.dart';
import 'package:bunny_sync/features/settings/view/widgets/setting_tile.dart';
import 'package:bunny_sync/global/extensions/date_time_x.dart';
import 'package:bunny_sync/global/gen/assets.gen.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/router/router.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/bunny_logo.dart';
import 'package:bunny_sync/global/widgets/images/profile_placeholder_widget.dart';
import 'package:bunny_sync/global/widgets/main_app_bar.dart';
import 'package:flutter/material.dart';

abstract class SettingsViewCallBacks {
  void onCustomersTap();

  void onLedgerTap();

  void onCategoriesTap();

  void onScheduleTap();

  void onCageCardsTap();

  void onReportsTap();

  void onHealthTap();

  void onPhotoTap();
}

@RoutePage()
class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SettingsPage();
  }
}

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage>
    implements SettingsViewCallBacks {
  @override
  void onPhotoTap() {
    context.router.push(const ProfileRoute());
  }

  @override
  void onCageCardsTap() {
    context.router.push(const CageCardsRoute());
  }

  @override
  void onCategoriesTap() {
    context.router.push(const CategoriesRoute());
  }

  @override
  void onCustomersTap() {
    context.router.push(const CustomersRoute());
  }

  @override
  void onHealthTap() {
    context.router.push(const HealthRoute());
  }

  @override
  void onLedgerTap() {
    context.router.push(const LedgerRoute());
  }

  @override
  void onReportsTap() {
    // TODO: implement onReportsTap
  }

  @override
  void onScheduleTap() {
    context.router.push(
      TasksRoute(
        title: 'Tasks'.i18n,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<SettingsTileModel> financeOptions = [
      SettingsTileModel(
        icon: Assets.icons.contacts.path,
        title: 'customers'.i18n,
        call: onCustomersTap,
      ),
      SettingsTileModel(
        icon: Assets.icons.calculator.path,
        title: 'ledger'.i18n,
        call: onLedgerTap,
      ),
      SettingsTileModel(
        icon: Assets.icons.selection.path,
        title: 'categories'.i18n,
        call: onCategoriesTap,
      ),
    ];

    final List<SettingsTileModel> otherOptions = [
      SettingsTileModel(
        icon: Assets.icons.calendarDate.path,
        title: 'schedule'.i18n,
        call: onScheduleTap,
      ),
      SettingsTileModel(
        icon: Assets.icons.cardholder.path,
        title: 'cage_cards'.i18n,
        call: onCageCardsTap,
      ),
      SettingsTileModel(
        icon: Assets.icons.chart.path,
        title: 'reports'.i18n,
        call: onReportsTap,
      ),
      SettingsTileModel(
        icon: Assets.icons.heart.path,
        title: 'health'.i18n,
        call: onHealthTap,
      ),
    ];
    return Scaffold(
      appBar: MainAppBar(
        leadingWith: 70,
        leading: const Center(
          child: BunnyLogo(
            size: 40,
            borderRadius: AppConstants.borderRadius12,
          ),
        ),
        actions: [
          InkWell(
            onTap: onPhotoTap,
            child: const ProfilePlaceholderWidget(size: 20),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          top: false,
          child: Padding(
            padding: AppConstants.padding16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DateTime.now().formatMMDoYYYY,
                ),
                Text(
                  'more'.i18n,
                  style: context.tt.displayLarge,
                ),
                const SizedBox(
                  height: 20,
                ),
                ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    SettingTile(
                      title: 'finance'.i18n,
                      items: financeOptions,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SettingTile(
                      title: 'other'.i18n,
                      items: otherOptions,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
