import 'package:auto_size_text/auto_size_text.dart';
import 'package:bunny_sync/features/ledger/view/widgets/ledger_tile.dart';
import 'package:bunny_sync/features/reports/models/report_stats_model/report_stats_model.dart';
import 'package:bunny_sync/global/extensions/currency_display_x.dart';
import 'package:bunny_sync/global/gen/assets.gen.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/theme/theme_extensions/app_theme_extension/app_theme_extension.dart';
import 'package:bunny_sync/global/widgets/icons/boxed_icon_widget.dart';
import 'package:flutter/material.dart';

class ReportStatsWidget extends StatefulWidget {
  const ReportStatsWidget({
    super.key,
    required this.reportStats,
  });

  final ReportStatsModel reportStats;

  @override
  State<ReportStatsWidget> createState() => _ReportStatsWidgetState();
}

class _ReportStatsWidgetState extends State<ReportStatsWidget> {
  @override
  Widget build(BuildContext context) {
    final item = widget.reportStats;
    final male = item.activeBreeders.maleBreedersCount;
    final female = item.activeBreeders.femaleBreedersCount;

    return GridView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 1.4,
      ),
      children: [
        LedgerTile(
          leading: BoxedIconWidget(
            icon: Assets.icons.gendersThin.path,
            color: context.appThemeExtension.incomePerBreederColor,
            iconColor: context.appThemeExtension.incomePerBreederIconColor,
          ),
          title: AutoSizeText(
            strutStyle: const StrutStyle(height: 1.6),
            'active_breeders'.i18n,
            style: context.tt.titleLarge?.copyWith(
              fontWeight: FontWeight.w400,
            ),
          ),
          subtitle: '${item.activeBreeders.allBreedersCount} ${'total'.i18n}',
          secondSubtitle: '$female ${'does'.i18n} $male ${'bucks'.i18n}',
        ),
        LedgerTile(
          leading: BoxedIconWidget(
            icon: Assets.icons.apps.path,
            color: context.appThemeExtension.expensesPerBreederColor,
            iconColor: context.appThemeExtension.expensesPerBreederIconColor,
          ),
          title: AutoSizeText(
            strutStyle: const StrutStyle(height: 1.6),
            'active_litters'.i18n,
            style: context.tt.titleLarge?.copyWith(
              fontWeight: FontWeight.w400,
            ),
          ),
          subtitle: '${item.activeLittersCount} ${'total'.i18n}',
          secondSubtitle: '${item.kitsToDateCount} ${'kits'.i18n}',
        ),
        LedgerTile(
          leading: BoxedIconWidget(
            icon: Assets.icons.cake.path,
            color: context.appThemeExtension.expensesColor,
            iconColor: context.appThemeExtension.expensesIconColor,
          ),
          title: AutoSizeText(
            strutStyle: const StrutStyle(height: 1.6),
            '${item.diedKits.soldKitsCount} ${"kits_born".i18n}',
            style: context.tt.titleLarge?.copyWith(
              fontWeight: FontWeight.w400,
            ),
          ),
          subtitle: '${item.sold} ${'sold'.i18n}',
          secondSubtitle: '${item.diedCulled} ${'died'.i18n}/${'culled'.i18n}',
        ),
        LedgerTile(
          leading: BoxedIconWidget(
            icon: Assets.icons.roundDollar.path,
            color: context.appThemeExtension.incomeColor,
            iconColor: context.appThemeExtension.incomeIconColor,
          ),
          title: AutoSizeText(
            strutStyle: const StrutStyle(height: 1.6),
            'finances'.i18n,
            style: context.tt.titleLarge?.copyWith(
              fontWeight: FontWeight.w400,
            ),
          ),
          subtitle:
              '${item.income.showAsCurrency(isSymbolAtStart: false)} ${'total'.i18n}',
          secondSubtitle:
              '${item.expense.showAsCurrency(isSymbolAtStart: false)} ${'expenses'.i18n}',
        ),
      ],
    );
  }
}
