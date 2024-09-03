import 'package:bunny_sync/features/reports/cubit/reports_cubit.dart';
import 'package:bunny_sync/features/reports/view/widgets/column_chart_widget.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/main_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

abstract class KitWeightTabCallBacks {
  void onTryAgainTap();
}

class KitWeightTab extends StatelessWidget {
  const KitWeightTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const KitWeightPage();
  }
}

class KitWeightPage extends StatefulWidget {
  const KitWeightPage({super.key});

  @override
  State<KitWeightPage> createState() => _KitWeightPageState();
}

class _KitWeightPageState extends State<KitWeightPage>
    implements KitWeightTabCallBacks {
  late final ReportsCubit reportsCubit = context.read();

  @override
  void initState() {
    super.initState();
    reportsCubit.getKitWeightReport();
  }

  @override
  void onTryAgainTap() {
    reportsCubit.getKitWeightReport();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<ReportsCubit, GeneralReportsState>(
        buildWhen: (previous, current) => current is KitWeightReportState,
        builder: (context, state) {
          if (state is KitWeightReportFetch) {
            final item = state.kitWeightReport;
            final List<ChartModel> data = List.generate(
              item.breeders.length,
              (index) => ChartModel(
                xAxisProperty: item.breeders[index],
                yAxisProperty: item.avgWeight[index],
              ),
            );
            return Skeletonizer(
              enabled: state is KitWeightReportLoading,
              child: Padding(
                padding: AppConstants.padding16,
                child: ColumnChartWidget(
                  data: data,
                  animationDuration: state is KitWeightReportLoading ? 0 : 1500,
                ),
              ),
            );
          } else if (state is KitWeightReportFail) {
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
