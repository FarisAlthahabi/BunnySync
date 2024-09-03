import 'package:bunny_sync/features/reports/cubit/reports_cubit.dart';
import 'package:bunny_sync/features/reports/view/widgets/column_chart_widget.dart';
import 'package:bunny_sync/features/reports/view/widgets/line_chart_widget.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/main_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

abstract class RabbitMissesTabCallBacks {
  void onTryAgainTap();
}

class RabbitMissesTab extends StatelessWidget {
  const RabbitMissesTab({
    super.key,
    required this.rabbitgender,
  });

  final String rabbitgender;

  @override
  Widget build(BuildContext context) {
    return RabbitMissesPage(
      rabbitgender: rabbitgender,
    );
  }
}

class RabbitMissesPage extends StatefulWidget {
  const RabbitMissesPage({
    super.key,
    required this.rabbitgender,
  });

  final String rabbitgender;

  @override
  State<RabbitMissesPage> createState() => _RabbitMissesPageState();
}

class _RabbitMissesPageState extends State<RabbitMissesPage>
    implements RabbitMissesTabCallBacks {
  late final ReportsCubit reportsCubit = context.read();

  @override
  void initState() {
    super.initState();
    reportsCubit.getRabbitMisses(widget.rabbitgender);
  }

  @override
  void onTryAgainTap() {
    reportsCubit.getRabbitMisses(widget.rabbitgender);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<ReportsCubit, GeneralReportsState>(
        buildWhen: (previous, current) => current is RabbitMissesState,
        builder: (context, state) {
          if (state is RabbitMissesFetch) {
            final item = state.rabbitMisses;
            final List<ChartModel> data = List.generate(
              item.breeders.length,
              (index) => ChartModel(
                xAxisProperty: item.breeders[index],
                yAxisProperty: item.missed[index].toDouble(),
              ),
            );
            return Skeletonizer(
              enabled: state is RabbitMissesLoading,
              child: Padding(
                padding: AppConstants.padding16,
                child: LineChartWidget(
                  data: data,
                  animationDuration: state is RabbitMissesLoading ? 0 : 1500,
                ),
              ),
            );
          } else if (state is RabbitMissesFail) {
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
