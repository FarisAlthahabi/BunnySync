import 'package:auto_route/auto_route.dart';
import 'package:bunny_sync/features/breeder_details/view/widgets/breeder_litter_tile.dart';
import 'package:bunny_sync/features/litters/cubit/litters_cubit.dart';
import 'package:bunny_sync/features/litters/models/litter_entry_model/litter_entry_model.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/router/router.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/animation/indexed_list_slide_fade_animated_tile.dart';
import 'package:bunny_sync/global/widgets/bottom_sheet_widget.dart';
import 'package:bunny_sync/global/widgets/buttons/main_add_floating_button.dart';
import 'package:bunny_sync/global/widgets/main_error_widget.dart';
import 'package:bunny_sync/global/widgets/main_show_bottom_sheet.dart';
import 'package:bunny_sync/global/widgets/main_snack_bar.dart';
import 'package:bunny_sync/global/widgets/search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:skeletonizer/skeletonizer.dart';

abstract class LittersTabCallbacks {
  void onTryAgainTap();

  void onLitterTap(LitterEntryModel litterEntryModel);

  void onAddLitterTab();

  void onEditLitterTab(LitterEntryModel litterEntryModel);

  void onDeleteLitterTab(LitterEntryModel litterEntryModel);

  void onChanged(String value);

  void onMoreOptionsTap(LitterEntryModel litterEntryModel);

  void onCageCard(LitterEntryModel litterEntryModel);

  void onArchive(LitterEntryModel litterEntryModel);

  void onSell(LitterEntryModel litterEntryModel);

  void onWeight(LitterEntryModel litterEntryModel);

  void onButcher(LitterEntryModel litterEntryModel);
}

class LittersTab extends StatefulWidget {
  const LittersTab({
    super.key,
    required this.breederId,
    this.controller,
  });

  final int breederId;
  final ScrollController? controller;

  @override
  State<LittersTab> createState() => _LittersTabState();
}

class _LittersTabState extends State<LittersTab>
    implements LittersTabCallbacks {
  late final LittersCubit littersCubit = context.read();

  @override
  void initState() {
    super.initState();
    littersCubit.getLitters(breederId: widget.breederId);
  }

  @override
  void onLitterTap(LitterEntryModel litterEntryModel) {
    context.router.push(
      LitterDetailsRoute(litter: litterEntryModel),
    );
  }

  @override
  void onAddLitterTab() {
    context.router.push(AddLitterRoute());
  }

  @override
  void onMoreOptionsTap(LitterEntryModel litterEntryModel) {
    mainShowBottomSheet(
      context,
      widget: BottomSheetWidget(
        title: 'litter_options'.i18n,
        onEdit: onEditLitterTab,
        onDelete: onDeleteLitterTab,
        onSell: onSell,
        onWeight: onWeight,
        onButcher: onButcher,
        onArchive: onArchive,
        onCageCard: onCageCard,
        model: litterEntryModel,
      ),
    );
  }

  @override
  void onTryAgainTap() {
    littersCubit.getLitters(breederId: widget.breederId);
  }

  @override
  void onArchive(LitterEntryModel litterEntryModel) {
    // TODO: implement onArchive
  }

  @override
  void onButcher(LitterEntryModel litterEntryModel) {
    // TODO: implement onButcher
  }

  @override
  void onCageCard(LitterEntryModel litterEntryModel) {
    // TODO: implement onCageCard
  }

  @override
  void onSell(LitterEntryModel litterEntryModel) {
    // TODO: implement onSell
  }

  @override
  void onWeight(LitterEntryModel litterEntryModel) {
    // TODO: implement onWeight
  }

  @override
  void onDeleteLitterTab(LitterEntryModel litterEntryModel) {
    context.router.popForced();
    mainShowBottomSheet(
      context,
      widget: BottomSheetWidget(
        title: 'are_you_sure_to_delete_litter'.i18n,
        model: litterEntryModel,
        onConfirm: (litterEntryModel) {
          context.router.popForced();
          littersCubit.deleteLitter(litterEntryModel.id);
        },
      ),
    );
  }

  @override
  void onEditLitterTab(LitterEntryModel litterEntryModel) {
    context.router.popForced();
    context.router.push(
      AddLitterRoute(
        litterEntryModel: litterEntryModel,
      ),
    );
  }

  @override
  void onChanged(String value) {
    // TODO: implement onChaned
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: widget.controller,
        child: Column(
          children: [
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                const SizedBox(width: 20),
                Expanded(
                  flex: 4,
                  child: SearchTextField(
                    onChanged: onChanged,
                    hintText: '${'search'.i18n}..',
                  ),
                ),
                const SizedBox(width: 20),
              ],
            ),
            BlocConsumer<LittersCubit, GeneralLittersState>(
              listener: (context, state) {
                if (state is DeleteLitterSuccess) {
                  context.loaderOverlay.hide();
                  MainSnackBar.showSuccessMessageBar(
                    context,
                    'litter_delete'.i18n,
                  );
                } else if (state is LittersFail) {
                  context.loaderOverlay.hide();
                  MainSnackBar.showErrorMessageBar(
                    context,
                    state.message,
                  );
                } else if (state is DeleteLitterLoading) {
                  context.loaderOverlay.show();
                } else if (state is DeleteLitterFail) {
                  context.loaderOverlay.hide();
                  MainSnackBar.showErrorMessageBar(
                    context,
                    state.message,
                  );
                }
              },
              buildWhen: (previous, current) => current is LittersState,
              builder: (context, state) {
                if (state is LittersFetch) {
                  return Skeletonizer(
                    enabled: state is LittersLoading,
                    child: ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: AppConstants.padding16,
                      itemCount: state.littersStatusModel.all.length,
                      itemBuilder: (context, index) {
                        final item = state.littersStatusModel.all[index];
                        return IndexedListSlideFadeAnimatedTile(
                          index: index,
                          child: BreederLitterTile(
                            onMoreOptionsTap: onMoreOptionsTap,
                            index: index,
                            litter: item,
                            onTap: onLitterTap,
                          ),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 16),
                    ),
                  );
                } else if (state is LittersEmpty) {
                  return Column(
                    children: [
                      const SizedBox(height: 150),
                      MainErrorWidget(
                        error: state.message,
                      ),
                    ],
                  );
                } else if (state is LittersFail) {
                  return Column(
                    children: [
                      const SizedBox(height: 150),
                      MainErrorWidget(
                        error: state.message,
                        onTap: onTryAgainTap,
                      ),
                    ],
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          ],
        ),
      ),
      floatingActionButton: MainAddFloatingButton(
        onAddTap: onAddLitterTab,
      ),
    );
  }
}
