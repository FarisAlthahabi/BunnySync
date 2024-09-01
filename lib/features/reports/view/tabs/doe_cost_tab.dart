import 'package:bunny_sync/features/reports/cubit/reports_cubit.dart';
import 'package:bunny_sync/features/reports/view/widgets/column_chart_widget.dart';
import 'package:bunny_sync/global/widgets/main_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

abstract class DoeCostTabCallBacks {
  void onTryAgainTap();
}

class DoeCostTab extends StatelessWidget {
  const DoeCostTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const DoeCostPage();
  }
}

class DoeCostPage extends StatefulWidget {
  const DoeCostPage({super.key});

  @override
  State<DoeCostPage> createState() => _DoeCostPageState();
}

class _DoeCostPageState extends State<DoeCostPage>
    implements DoeCostTabCallBacks {
  late final ReportsCubit reportsCubit = context.read();

  @override
  void initState() {
    super.initState();
    reportsCubit.getDoeCost();
  }

  @override
  void onTryAgainTap() {
    reportsCubit.getDoeCost();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<ReportsCubit, GeneralReportsState>(
        buildWhen: (previous, current) => current is DoeCostState,
        builder: (context, state) {
          if (state is DoeCostFetch) {
            final List<ColumnChartModel> data = List.generate(
              state.doeCost.breeders.length,
              (index) => ColumnChartModel(
                xAxisProperty: state.doeCost.breeders[index],
                yAxisProperty: state.doeCost.costs[index],
              ),
            );
            return Skeletonizer(
              enabled: state is DoeCostLoading,
              child: ColumnChartWidget(
                data: data,
                animationDuration: state is DoeCostLoading ? 0 : 1500,
              ),
            );
          } else if (state is DoeCostFail) {
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
