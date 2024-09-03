import 'package:bunny_sync/features/reports/cubit/reports_cubit.dart';
import 'package:bunny_sync/global/extensions/date_time_x.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/element_tile.dart';
import 'package:bunny_sync/global/widgets/main_error_widget.dart';
import 'package:bunny_sync/global/widgets/texts/bordered_textual_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

abstract class BreederMortalityTabCallBacks {
  void onTryAgainTap();
}

class BreederMortalityTab extends StatelessWidget {
  const BreederMortalityTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const BreederMortalityPage();
  }
}

class BreederMortalityPage extends StatefulWidget {
  const BreederMortalityPage({super.key});

  @override
  State<BreederMortalityPage> createState() => _BreederMortalityPageState();
}

class _BreederMortalityPageState extends State<BreederMortalityPage>
    implements BreederMortalityTabCallBacks {
  late final ReportsCubit reportsCubit = context.read();

  @override
  void initState() {
    super.initState();
    reportsCubit.getBreederMortality();
  }

  @override
  void onTryAgainTap() {
    reportsCubit.getBreederMortality();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReportsCubit, GeneralReportsState>(
      buildWhen: (previous, current) => current is BreederMortalityState,
      builder: (context, state) {
        if (state is BreederMortalityFetch) {
          return Skeletonizer(
            enabled: state is BreederMortalityLoading,
            child: Padding(
              padding: AppConstants.padding16,
              child: Column(
                children: [
                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: AppConstants.padding16,
                    itemCount: state.breederMortality.length,
                    itemBuilder: (context, index) {
                      final item = state.breederMortality[index];
                      return ElementTile(
                        model: item,
                        leading: Skeleton.shade(
                          child: BorderedTextualWidget(
                            text: '${index + 1}',
                          ),
                        ),
                        title: Text(
                          strutStyle: const StrutStyle(height: 1.6),
                          "${"name".i18n} : ${item.name}",
                          style: context.tt.titleSmall?.copyWith(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        tag: "${"age".i18n} : ${item.age}",
                        createdAt: "${"died_on".i18n} : ${item.deathDate.formatMMddYYYY}",
                        note: "${"couse_of_death".i18n} : ${item.reason}",
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 16,
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        } else if (state is BreederMortalityEmpty) {
          return MainErrorWidget(
            height: 0.4.sh,
            error: state.message,
          );
        } else if (state is BreederMortalityFail) {
          return MainErrorWidget(
            height: 0.4.sh,
            error: state.message,
            onTap: onTryAgainTap,
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
