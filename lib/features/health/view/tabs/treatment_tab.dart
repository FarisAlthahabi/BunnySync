import 'package:auto_route/auto_route.dart';
import 'package:bunny_sync/features/health/cubit/health_cubit.dart';
import 'package:bunny_sync/features/health/model/treatment_model/treatment_model.dart';
import 'package:bunny_sync/global/extensions/date_time_x.dart';
import 'package:bunny_sync/global/localization/translations.i18n.dart';
import 'package:bunny_sync/global/mixins/post_frame_mixin.dart';
import 'package:bunny_sync/global/router/router.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/bottom_sheet_widget.dart';
import 'package:bunny_sync/global/widgets/element_tile.dart';
import 'package:bunny_sync/global/widgets/list_suffix_empty_space_widget.dart';
import 'package:bunny_sync/global/widgets/main_error_widget.dart';
import 'package:bunny_sync/global/widgets/main_show_bottom_sheet.dart';
import 'package:bunny_sync/global/widgets/main_snack_bar.dart';
import 'package:bunny_sync/global/widgets/texts/bordered_textual_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:skeletonizer/skeletonizer.dart';

abstract class TreatmentTabCallBacks {
  void onAddTap();

  void onTryAgainTap();

  void onTreatmentTap(TreatmentModel treatmentModel);

  void onEditTreatmentTap(TreatmentModel treatmentModel);

  void onDeleteTreatmentTap(TreatmentModel treatmentModel);
}

class TreatmentTab extends StatefulWidget {
  const TreatmentTab({
    super.key,
    this.addSuffixEmptySpace = false,
    this.breederId,
    this.controller,
  });

  final bool addSuffixEmptySpace;
  final int? breederId;
  final ScrollController? controller;

  @override
  State<TreatmentTab> createState() => _TreatmentTabState();
}

class _TreatmentTabState extends State<TreatmentTab>
    with PostFrameMixin
    implements TreatmentTabCallBacks {
  late final HealthCubit healthCubit = context.read();

  @override
  void onPostFrame() {
    healthCubit.getTreatments(
      breederId: widget.breederId,
    );
  }

  @override
  void onAddTap() {
    context.router.push(
      AddTreatmentRoute(
        healthCubit: healthCubit,
      ),
    );
  }

  @override
  void onDeleteTreatmentTap(TreatmentModel treatmentModel) {
    context.router.popForced();
    mainShowBottomSheet(
      context,
      widget: BottomSheetWidget(
        title: 'are_you_sure_to_delete_treatment'.i18n,
        model: treatmentModel,
        onConfirm: (treatmentModel) {
          context.router.popForced();
          healthCubit.deleteTreatment(treatmentModel.id);
        },
      ),
    );
  }

  @override
  void onEditTreatmentTap(TreatmentModel treatmentModel) {
    context.router.popForced();
    context.router.push(
      AddTreatmentRoute(
        healthCubit: healthCubit,
        treatmentModel: treatmentModel,
      ),
    );
  }

  @override
  void onTreatmentTap(TreatmentModel treatmentModel) {
    mainShowBottomSheet(
      context,
      widget: BottomSheetWidget(
        title: "treatment_options".i18n,
        model: treatmentModel,
        onEdit: onEditTreatmentTap,
        onDelete: onDeleteTreatmentTap,
      ),
    );
  }

  @override
  void onTryAgainTap() {
    healthCubit.getTreatments();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<HealthCubit, GeneralHealthState>(
        listener: (context, state) {
          if (state is DeleteTreatmentSuccess) {
            context.loaderOverlay.hide();
            MainSnackBar.showSuccessMessageBar(
              context,
              'treatment_deleted'.i18n,
            );
          } else if (state is TreatmentsFail) {
            context.loaderOverlay.hide();
            MainSnackBar.showErrorMessageBar(
              context,
              state.message,
            );
          } else if (state is DeleteTreatmentLoading) {
            context.loaderOverlay.show();
          } else if (state is DeleteTreatmentFail) {
            context.loaderOverlay.hide();
            MainSnackBar.showErrorMessageBar(
              context,
              state.message,
            );
          }
        },
        buildWhen: (prev, curr) => curr is TreatmentsState,
        builder: (context, state) {
          if (state is TreatmentsFetch) {
            return Skeletonizer(
              enabled: state is TreatmentsLoading,
              child: SingleChildScrollView(
                controller: widget.controller,
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
                          final medication = item.medication;

                          return ElementTile(
                            onTap: onTreatmentTap,
                            model: item,
                            leading: Skeleton.shade(
                              child: BorderedTextualWidget(
                                text: (index + 1).toString(),
                              ),
                            ),
                            tag: item.ailment,
                            createdAt: item.startDate.formatMMMMMDoYYYY,
                            title: Text(
                              strutStyle: const StrutStyle(height: 1.6),
                              item.name,
                              style: context.tt.titleMedium?.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            type: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                if (medication != null)
                                  Text(
                                    medication,
                                    style: context.tt.labelMedium
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
                      if (widget.addSuffixEmptySpace)
                        ListSuffixEmptySpaceWidget(
                          length: state.treatments.length,
                        ),
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
