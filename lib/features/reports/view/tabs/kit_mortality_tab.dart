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

abstract class KitMortalityTabCallBacks {
  void onTryAgainTap();
}

class KitMortalityTab extends StatelessWidget {
  const KitMortalityTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const KitMortalityPage();
  }
}

class KitMortalityPage extends StatefulWidget {
  const KitMortalityPage({super.key});

  @override
  State<KitMortalityPage> createState() => _KitMortalityPageState();
}

class _KitMortalityPageState extends State<KitMortalityPage>
    implements KitMortalityTabCallBacks {
  late final ReportsCubit reportsCubit = context.read();

  @override
  void initState() {
    super.initState();
    reportsCubit.getKitMortality();
  }

  @override
  void onTryAgainTap() {
    reportsCubit.getKitMortality();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReportsCubit, GeneralReportsState>(
      buildWhen: (previous, current) => current is KitMortalityState,
      builder: (context, state) {
        if (state is KitMortalityFetch) {
          return Skeletonizer(
            enabled: state is KitMortalityLoading,
            child: Padding(
              padding: AppConstants.padding16,
              child: Column(
                children: [
                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: AppConstants.padding16,
                    itemCount: state.kitMortality.length,
                    itemBuilder: (context, index) {
                      final item = state.kitMortality[index];
                      return ElementTile(
                        model: item,
                        leading: Skeleton.shade(
                          child: BorderedTextualWidget(
                            text: '${index + 1}',
                          ),
                        ),
                        title: Text(
                          strutStyle: const StrutStyle(height: 1.6),
                          "${"buck".i18n} : ${item.maleBreederName}",
                          style: context.tt.titleSmall?.copyWith(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        tag: "${"kit".i18n} : ${item.kitName}",
                        type: Text(
                          "${"doe".i18n} : ${item.femaleBreederName}",
                          style: context.tt.titleSmall?.copyWith(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        secondaryTag: "${"litter_id".i18n} : ${item.litterName}",
                        createdAt: "${"died_on".i18n} :\n ${item.deathDate.formatMMddYYYY}",
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
        } else if (state is KitMortalityEmpty) {
          return MainErrorWidget(
            height: 0.4.sh,
            error: state.message,
          );
        } else if (state is KitMortalityFail) {
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
