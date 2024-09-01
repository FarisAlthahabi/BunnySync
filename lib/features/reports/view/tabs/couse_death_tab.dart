import 'package:bunny_sync/features/reports/cubit/reports_cubit.dart';
import 'package:bunny_sync/features/reports/view/widgets/column_chart_widget.dart';
import 'package:bunny_sync/global/widgets/main_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

abstract class CouseDeathTabCallBacks {
  void onTryAgainTap();
}

class CouseDeathTab extends StatelessWidget {
  const CouseDeathTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const CouseDeathPage();
  }
}

class CouseDeathPage extends StatefulWidget {
  const CouseDeathPage({super.key});

  @override
  State<CouseDeathPage> createState() => _CouseDeathPageState();
}

class _CouseDeathPageState extends State<CouseDeathPage>
    implements CouseDeathTabCallBacks {
  late final ReportsCubit reportsCubit = context.read();

  @override
  void initState() {
    super.initState();
    reportsCubit.getCouseDeath();
  }

  @override
  void onTryAgainTap() {
    reportsCubit.getCouseDeath();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<ReportsCubit, GeneralReportsState>(
        buildWhen: (previous, current) => current is CouseDeathState,
        builder: (context, state) {
          if (state is CouseDeathFetch) {
            final List<ColumnChartModel> data = List.generate(
              state.couseDeath.reason.length,
              (index) => ColumnChartModel(
                xAxisProperty: state.couseDeath.reason[index],
                yAxisProperty: state.couseDeath.count[index].toDouble(),
              ),
            );
            return Skeletonizer(
              enabled: state is CouseDeathLoading,
              child: ColumnChartWidget(
                data: data,
                animationDuration: state is CouseDeathLoading ? 0 : 1500,
              ),
            );
          } else if (state is CouseDeathFail) {
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
