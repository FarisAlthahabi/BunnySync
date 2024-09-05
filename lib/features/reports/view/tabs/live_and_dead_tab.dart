import 'package:bunny_sync/features/reports/cubit/reports_cubit.dart';
import 'package:bunny_sync/features/reports/view/widgets/column_chart_widget.dart';
import 'package:bunny_sync/features/reports/view/widgets/column_color_indicator_widget.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/theme/theme_extensions/app_theme_extension/app_theme_extension.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/main_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

abstract class LiveAndDeadTabCallBacks {
  void onTryAgainTap();
}

class LiveAndDeadTab extends StatelessWidget {
  const LiveAndDeadTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const LiveAndDeadPage();
  }
}

class LiveAndDeadPage extends StatefulWidget {
  const LiveAndDeadPage({super.key});

  @override
  State<LiveAndDeadPage> createState() => _LiveAndDeadPageState();
}

class _LiveAndDeadPageState extends State<LiveAndDeadPage>
    implements LiveAndDeadTabCallBacks {
  late final ReportsCubit reportsCubit = context.read();

  @override
  void initState() {
    super.initState();
    reportsCubit.getLiveAndDead();
  }

  @override
  void onTryAgainTap() {
    reportsCubit.getLiveAndDead();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReportsCubit, GeneralReportsState>(
      buildWhen: (previous, current) => current is LiveAndDeadState,
      builder: (context, state) {
        if (state is LiveAndDeadFetch) {
          final item = state.liveAndDead;
          final List<ChartModel> data = List.generate(
            item.breeders.length,
            (index) => ChartModel(
              xAxisProperty: item.breeders[index],
              yAxisProperty: [
                item.live[index].toDouble(),
                item.died[index].toDouble(),
              ],
            ),
          );
          return Skeletonizer(
            enabled: state is LiveAndDeadLoading,
            child: Padding(
              padding: AppConstants.padding16,
              child: Column(
                children: [
                  ColumnColorIndicatorWidget(
                    indicators: [
                      ColumnChartIndicatorModel(
                        label: "live".i18n,
                        color: context.appThemeExtension.survivalRateChartColor,
                      ),
                      ColumnChartIndicatorModel(
                        label: "died".i18n,
                        color: context.appThemeExtension.diedKitsChartColor,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  ColumnChartWidget(
                    data: data,
                    animationDuration: state is LiveAndDeadLoading ? 0 : 1500,
                    columnColor: [
                      context.appThemeExtension.survivalRateChartColor,
                      context.appThemeExtension.diedKitsChartColor,
                    ],
                  ),
                ],
              ),
            ),
          );
        } else if (state is LiveAndDeadFail) {
          return MainErrorWidget(
            error: state.message,
            height: 0.4.sh,
            onTap: onTryAgainTap,
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
