import 'package:auto_route/auto_route.dart';
import 'package:bunny_sync/features/health/cubit/health_cubit.dart';
import 'package:bunny_sync/features/health/model/ailment_model/ailment_model.dart';
import 'package:bunny_sync/global/extensions/date_time_x.dart';
import 'package:bunny_sync/global/localization/translations.i18n.dart';
import 'package:bunny_sync/global/mixins/mixins.dart';
import 'package:bunny_sync/global/router/router.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/bottom_sheet_widget.dart';
import 'package:bunny_sync/global/widgets/buttons/main_add_floating_button.dart';
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

abstract class AilmentsTabCallBacks {
  void onAddTap();

  void onTryAgainTap();

  void onAilmentTap(AilmentModel ailmentModel);

  void onEditAilmentTap(AilmentModel ailmentModel);

  void onDeleteAilmentTap(AilmentModel ailmentModel);
}

class AilmentsTab extends StatefulWidget {
  const AilmentsTab({
    super.key,
    this.addSuffixEmptySpace = false,
    this.breederId,
    this.controller,
  });

  final bool addSuffixEmptySpace;
  final int? breederId;
  final ScrollController? controller;

  @override
  State<AilmentsTab> createState() => _AilmentsTabState();
}

class _AilmentsTabState extends State<AilmentsTab>
    with PostFrameMixin
    implements AilmentsTabCallBacks {
  late final HealthCubit healthCubit = context.read();

  @override
  void onPostFrame() {
    healthCubit.getAilments(
      breederId: widget.breederId,
    );
  }

  @override
  void onAddTap() {
    context.router.push(
      AddAilmentRoute(
        healthCubit: healthCubit,
      ),
    );
  }

  @override
  void onAilmentTap(AilmentModel ailmentModel) {
    mainShowBottomSheet(
      context,
      widget: BottomSheetWidget(
        title: "ailments_options".i18n,
        model: ailmentModel,
        onEdit: onEditAilmentTap,
        onDelete: onDeleteAilmentTap,
      ),
    );
  }

  @override
  void onDeleteAilmentTap(AilmentModel ailmentModel) {
    context.router.popForced();
    mainShowBottomSheet(
      context,
      widget: BottomSheetWidget(
        title: 'are_you_sure_to_delete_ailment'.i18n,
        model: ailmentModel,
        onConfirm: (ailmentModel) {
          context.router.popForced();
          healthCubit.deleteAilment(ailmentModel.id);
        },
      ),
    );
  }

  @override
  void onEditAilmentTap(AilmentModel ailmentModel) {
    context.router.popForced();
    context.router.push(
      AddAilmentRoute(
        healthCubit: healthCubit,
        ailmentModel: ailmentModel,
      ),
    );
  }

  @override
  void onTryAgainTap() {
    healthCubit.getAilments();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<HealthCubit, GeneralHealthState>(
        listener: (context, state) {
          if (state is DeleteAilmentSuccess) {
            context.loaderOverlay.hide();
            MainSnackBar.showSuccessMessageBar(
              context,
              'ailment_deleted'.i18n,
            );
          } else if (state is AilmentsFail) {
            context.loaderOverlay.hide();
            MainSnackBar.showErrorMessageBar(
              context,
              state.message,
            );
          } else if (state is DeleteAilmentLoading) {
            context.loaderOverlay.show();
          } else if (state is DeleteAilmentFail) {
            context.loaderOverlay.hide();
            MainSnackBar.showErrorMessageBar(
              context,
              state.message,
            );
          }
        },
        buildWhen: (prev, curr) => curr is AilmentsState,
        builder: (context, state) {
          if (state is AilmentsFetch) {
            return Skeletonizer(
              enabled: state is AilmentsLoading,
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
                        itemCount: state.ailments.length,
                        itemBuilder: (context, index) {
                          final item = state.ailments[index];
                          return ElementTile(
                            onTap: onAilmentTap,
                            model: item,
                            leading: Skeleton.shade(
                              child: BorderedTextualWidget(
                                text: (index + 1).toString(),
                              ),
                            ),
                            tag: item.rabbitName,
                            createdAt: item.startDate.formatMMMMMDoYYYY,
                            title: Text(
                              strutStyle: const StrutStyle(height: 1.6),
                              item.displayName,
                              style: context.tt.titleMedium?.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            type: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  item.symptoms,
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
                          length: state.ailments.length,
                        ),
                    ],
                  ),
                ),
              ),
            );
          } else if (state is AilmentsEmpty) {
            return MainErrorWidget(error: state.message);
          } else if (state is AilmentsFail) {
            return MainErrorWidget(
              error: state.message,
              onTap: onTryAgainTap,
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
      floatingActionButton: MainAddFloatingButton(
        onAddTap: onAddTap,
      ),
    );
  }
}
