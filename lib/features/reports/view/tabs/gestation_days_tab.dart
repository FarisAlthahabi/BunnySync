import 'package:bunny_sync/features/reports/cubit/reports_cubit.dart';
import 'package:bunny_sync/features/reports/view/widgets/column_chart_widget.dart';
import 'package:bunny_sync/features/reports/view/widgets/line_chart_widget.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/main_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

abstract class GestationDaysTabCallBacks {
  void onTryAgainTap();
}

class GestationDaysTab extends StatelessWidget {
  const GestationDaysTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const GestationDaysPage();
  }
}

class GestationDaysPage extends StatefulWidget {
  const GestationDaysPage({super.key});

  @override
  State<GestationDaysPage> createState() => _GestationDaysPageState();
}

class _GestationDaysPageState extends State<GestationDaysPage>
    implements GestationDaysTabCallBacks {
  late final ReportsCubit reportsCubit = context.read();

  @override
  void initState() {
    super.initState();
    reportsCubit.getGestationDays();
  }

  @override
  void onTryAgainTap() {
    reportsCubit.getGestationDays();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<ReportsCubit, GeneralReportsState>(
        buildWhen: (previous, current) => current is GestationDaysState,
        builder: (context, state) {
          if (state is GestationDaysFetch) {
            final item = state.gestationDays;
            final List<ChartModel> data = List.generate(
              item.breeders.length,
              (index) => ChartModel(
                xAxisProperty: item.breeders[index],
                yAxisProperty: item.days[index].toDouble(),
              ),
            );
            if (data.isEmpty) {
              return const Padding(
                padding: AppConstants.padding16,
                child: SfCartesianChart(),
              );
            }
            return Skeletonizer(
              enabled: state is GestationDaysLoading,
              child: Padding(
                padding: AppConstants.padding16,
                child: LineChartWidget(
                  data: data,
                  animationDuration: state is GestationDaysLoading ? 0 : 1500,
                ),
              ),
            );
          } else if (state is GestationDaysFail) {
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
