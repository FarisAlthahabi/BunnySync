import 'package:bunny_sync/features/reports/cubit/reports_cubit.dart';
import 'package:bunny_sync/features/reports/view/widgets/column_chart_widget.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/main_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

abstract class SurvivalRateTabCallBacks {
  void onTryAgainTap();
}

class SurvivalRateTab extends StatelessWidget {
  const SurvivalRateTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const SurvivalRatePage();
  }
}

class SurvivalRatePage extends StatefulWidget {
  const SurvivalRatePage({super.key});

  @override
  State<SurvivalRatePage> createState() => _SurvivalRatePageState();
}

class _SurvivalRatePageState extends State<SurvivalRatePage>
    implements SurvivalRateTabCallBacks {
  late final ReportsCubit reportsCubit = context.read();

  @override
  void initState() {
    super.initState();
    reportsCubit.getSurvivalRate();
  }

  @override
  void onTryAgainTap() {
    reportsCubit.getSurvivalRate();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<ReportsCubit, GeneralReportsState>(
        buildWhen: (previous, current) => current is SurvivalRateState,
        builder: (context, state) {
          if (state is SurvivalRateFetch) {
            final item = state.survivalRate;
            final List<ChartModel> data = List.generate(
              item.breeders.length,
              (index) => ChartModel(
                xAxisProperty: item.breeders[index],
                yAxisProperty: item.count[index],
              ),
            );
            if (data.isEmpty) {
              return const Padding(
                padding: AppConstants.padding16,
                child: SfCartesianChart(),
              );
            }
            return Skeletonizer(
              enabled: state is SurvivalRateLoading,
              child: Padding(
                padding: AppConstants.padding16,
                child: ColumnChartWidget(
                  data: data,
                  animationDuration: state is SurvivalRateLoading ? 0 : 1500,
                ),
              ),
            );
          } else if (state is SurvivalRateFail) {
            return MainErrorWidget(
              error: state.message,
              onTap: onTryAgainTap,
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
