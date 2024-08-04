import 'package:auto_route/auto_route.dart';
import 'package:bunny_sync/features/health/cubit/health_cubit.dart';
import 'package:bunny_sync/global/router/router.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/element_tile.dart';
import 'package:bunny_sync/global/widgets/main_error_widget.dart';
import 'package:bunny_sync/global/widgets/texts/bordered_textual_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

abstract class TreatmentTabCallBacks {
  void onAddTap();

  void onTryAgainTap();
}

class TreatmentTab extends StatefulWidget {
  const TreatmentTab({super.key});

  @override
  State<TreatmentTab> createState() => _TreatmentTabState();
}

class _TreatmentTabState extends State<TreatmentTab>
    implements TreatmentTabCallBacks {
  late final HealthCubit healthCubit = context.read();

  @override
  void initState() {
    healthCubit.getTreatments();
    super.initState();
  }

  @override
  void onAddTap() {
    context.router.push(const AddTreatmentRoute());
  }

  @override
  void onTryAgainTap() {
    healthCubit.getTreatments();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HealthCubit, GeneralHealthState>(
        builder: (context, state) {
          if (state is TreatmentsFetch) {
            return Skeletonizer(
              enabled: state is TreatmentsLoading,
              child: SingleChildScrollView(
                child: Padding(
                  padding: AppConstants.padding16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: state.treatments.length,
                        itemBuilder: (context, index) {
                          final item = state.treatments[index];
                          return ElementTile(
                            leading: Skeleton.shade(
                              child: BorderedTextualWidget(
                                text: item.id.toString(),
                              ),
                            ),
                            tag: item.rabbitName,
                            createdAt: item.startDate.toString(),
                            title: Text(
                              strutStyle: const StrutStyle(height: 1.6),
                              item.name,
                              style: context.tt.titleSmall?.copyWith(
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            type: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.favorite_outline_outlined,
                                  color: context.cs.onSurface,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  item.medication,
                                  style: context.tt.labelSmall
                                      ?.copyWith(color: context.cs.tertiary),
                                ),
                              ],
                            ),
                            note: item.note,
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 16,
                          );
                        },
                      ),
                      const SizedBox(height: 50),
                    ],
                  ),
                ),
              ),
            );
          } else if (state is TreatmentsEmpty) {
            return MainErrorWidget(error: state.message);
          } else if (state is TreatmentsFail) {
            return MainErrorWidget(
              error: state.message,
              onTap: onTryAgainTap,
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
      floatingActionButton: Padding(
        padding: AppConstants.padding16,
        child: FloatingActionButton(
          onPressed: onAddTap,
          shape: RoundedRectangleBorder(
            borderRadius: AppConstants.circularBorderRadius,
          ),
          backgroundColor: context.cs.secondaryContainer,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
