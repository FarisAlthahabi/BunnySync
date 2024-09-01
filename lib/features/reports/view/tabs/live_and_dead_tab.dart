import 'package:bunny_sync/features/reports/cubit/reports_cubit.dart';
import 'package:bunny_sync/features/reports/view/widgets/column_chart_widget.dart';
import 'package:bunny_sync/global/widgets/main_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return Center(
      child: BlocBuilder<ReportsCubit, GeneralReportsState>(
        buildWhen: (previous, current) => current is LiveAndDeadState,
        builder: (context, state) {
          if (state is LiveAndDeadFetch) {
            final List<ColumnChartModel> data = List.generate(
              state.liveAndDead.breeders.length,
              (index) => ColumnChartModel(
                xAxisProperty: state.liveAndDead.breeders[index],
                yAxisProperty: state.liveAndDead.live[index].toDouble(),
              ),
            );
            return Skeletonizer(
              enabled: state is LiveAndDeadLoading,
              child: ColumnChartWidget(
                data: data,
                animationDuration: state is LiveAndDeadLoading ? 0 : 1500,
              ),
            );
          } else if (state is LiveAndDeadFail) {
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
