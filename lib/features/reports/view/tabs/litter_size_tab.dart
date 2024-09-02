import 'package:bunny_sync/features/reports/cubit/reports_cubit.dart';
import 'package:bunny_sync/features/reports/view/widgets/column_chart_widget.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/main_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

abstract class LitterSizeTabCallBacks {
  void onTryAgainTap();
}

class LitterSizeTab extends StatelessWidget {
  const LitterSizeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const LitterSizePage();
  }
}

class LitterSizePage extends StatefulWidget {
  const LitterSizePage({super.key});

  @override
  State<LitterSizePage> createState() => _LitterSizePageState();
}

class _LitterSizePageState extends State<LitterSizePage>
    implements LitterSizeTabCallBacks {
  late final ReportsCubit reportsCubit = context.read();

  @override
  void initState() {
    super.initState();
    reportsCubit.getLitterSize();
  }

  @override
  void onTryAgainTap() {
    reportsCubit.getLitterSize();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<ReportsCubit, GeneralReportsState>(
        buildWhen: (previous, current) => current is LitterSizeState,
        builder: (context, state) {
          if (state is LitterSizeFetch) {
            final item = state.litterSize;
            final List<ChartModel> data = List.generate(
              item.breeders.length,
              (index) => ChartModel(
                xAxisProperty: item.breeders[index],
                yAxisProperty: item.avgKits[index],
              ),
            );
            if (data.isEmpty) {
              return const Padding(
                padding: AppConstants.padding16,
                child: SfCartesianChart(),
              );
            }
            return Skeletonizer(
              enabled: state is LitterSizeLoading,
              child: Padding(
                padding: AppConstants.padding16,
                child: ColumnChartWidget(
                  data: data,
                  animationDuration: state is LitterSizeLoading ? 0 : 1500,
                ),
              ),
            );
          } else if (state is LitterSizeFail) {
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
