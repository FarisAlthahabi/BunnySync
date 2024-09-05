import 'package:bunny_sync/features/reports/cubit/reports_cubit.dart';
import 'package:bunny_sync/features/reports/view/widgets/column_chart_widget.dart';
import 'package:bunny_sync/global/theme/theme_extensions/app_theme_extension/app_theme_extension.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/main_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

abstract class CauseDeathTabCallBacks {
  void onTryAgainTap();
}

class CauseDeathTab extends StatelessWidget {
  const CauseDeathTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const CauseDeathPage();
  }
}

class CauseDeathPage extends StatefulWidget {
  const CauseDeathPage({super.key});

  @override
  State<CauseDeathPage> createState() => _CauseDeathPageState();
}

class _CauseDeathPageState extends State<CauseDeathPage>
    implements CauseDeathTabCallBacks {
  late final ReportsCubit reportsCubit = context.read();

  @override
  void initState() {
    super.initState();
    reportsCubit.getCauseDeath();
  }

  @override
  void onTryAgainTap() {
    reportsCubit.getCauseDeath();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReportsCubit, GeneralReportsState>(
      buildWhen: (previous, current) => current is CauseDeathState,
      builder: (context, state) {
        if (state is CauseDeathFetch) {
          final item = state.causeDeath;
          final List<ChartModel> data = List.generate(
            item.reason.length,
            (index) => ChartModel(
              xAxisProperty: item.reason[index],
              yAxisProperty: [item.count[index].toDouble()],
            ),
          );
          return Skeletonizer(
            enabled: state is CauseDeathLoading,
            child: Padding(
              padding: AppConstants.padding16,
              child: ColumnChartWidget(
                data: data,
                animationDuration: state is CauseDeathLoading ? 0 : 1500,
                columnColor: [context.appThemeExtension.causeOfDeathChartColor],
              ),
            ),
          );
        } else if (state is CauseDeathFail) {
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
