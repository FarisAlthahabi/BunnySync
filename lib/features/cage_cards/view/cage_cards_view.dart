import 'package:auto_route/auto_route.dart';
import 'package:bunny_sync/features/cage_cards/cubit/cage_cards_cubit.dart';
import 'package:bunny_sync/features/cage_cards/model/cage_model/cage_model.dart';
import 'package:bunny_sync/global/di/di.dart';
import 'package:bunny_sync/global/extensions/date_time_x.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/router/router.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/bottom_sheet_widget.dart';
import 'package:bunny_sync/global/widgets/buttons/main_add_floating_button.dart';
import 'package:bunny_sync/global/widgets/element_tile.dart';
import 'package:bunny_sync/global/widgets/main_app_bar.dart';
import 'package:bunny_sync/global/widgets/main_error_widget.dart';
import 'package:bunny_sync/global/widgets/main_show_bottom_sheet.dart';
import 'package:bunny_sync/global/widgets/main_snack_bar.dart';
import 'package:bunny_sync/global/widgets/texts/bordered_textual_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:skeletonizer/skeletonizer.dart';

abstract class CageCardsViewCallBacks {
  void onAddTap();

  void onTryAgainTap();

  void onCageTap(CageModel cageModel);

  void onEditCageTap(CageModel cageModel);

  void onAddCageCopyTap(CageModel cageModel);

  void onDeleteCageTap(CageModel cageModel);
}

@RoutePage()
class CageCardsView extends StatelessWidget {
  const CageCardsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => get<CageCardsCubit>(),
      child: const CageCardsPage(),
    );
  }
}

class CageCardsPage extends StatefulWidget {
  const CageCardsPage({super.key});

  @override
  State<CageCardsPage> createState() => _CageCardsPageState();
}

class _CageCardsPageState extends State<CageCardsPage>
    implements CageCardsViewCallBacks {
  late final CageCardsCubit cageCardsCubit = context.read();

  @override
  void initState() {
    cageCardsCubit.getCageCards();
    super.initState();
  }

  @override
  void onCageTap(CageModel cageModel) {
    mainShowBottomSheet(
      context,
      widget: BottomSheetWidget(
        title: 'cages_options'.i18n,
        onEdit: onEditCageTap,
        onCopy: onAddCageCopyTap,
        onDelete: onDeleteCageTap,
        model: cageModel,
      ),
    );
  }

  @override
  void onEditCageTap(CageModel cageModel) {
    Navigator.pop(context);
    context.router.push(
      AddCageRoute(
        cageCardsCubit: cageCardsCubit,
        cageModel: cageModel,
        isCopy: false,
      ),
    );
  }

  @override
  void onAddCageCopyTap(CageModel cageModel) {
    Navigator.pop(context);
    context.router.push(
      AddCageRoute(
        cageCardsCubit: cageCardsCubit,
        cageModel: cageModel,
        isCopy: true,
      ),
    );
  }

  @override
  void onDeleteCageTap(CageModel cageModel) {
    context.router.popForced();
    mainShowBottomSheet(
      context,
      widget: BottomSheetWidget(
        title: 'are_you_sure_to_delete_cage'.i18n,
        model: cageModel,
        onConfirm: (cageModel) {
          context.router.popForced();
          cageCardsCubit.deleteCageCard(cageModel.id);
        },
      ),
    );
  }

  @override
  void onAddTap() {
    context.router.push(
      AddCageRoute(
        cageCardsCubit: cageCardsCubit,
      ),
    );
  }

  @override
  void onTryAgainTap() {
    cageCardsCubit.getCageCards();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(),
      body: BlocConsumer<CageCardsCubit, GeneralCageCardsState>(
        listener: (context, state) {
          if (state is DeleteCageCardSuccess) {
            context.loaderOverlay.hide();
            MainSnackBar.showSuccessMessageBar(
              context,
              'customer_delete'.i18n,
            );
          } else if (state is CageCardsFail) {
            context.loaderOverlay.hide();
            MainSnackBar.showErrorMessageBar(
              context,
              state.message,
            );
          } else if (state is DeleteCageCardLoading) {
            context.loaderOverlay.show();
          } else if (state is DeleteCageCardFail) {
            context.loaderOverlay.hide();
            MainSnackBar.showErrorMessageBar(
              context,
              state.message,
            );
          }
        },
        buildWhen: (prev, curr) => curr is CageCardsState,
        builder: (context, state) {
          if (state is CageCardsFetch) {
            return Skeletonizer(
              enabled: state is CageCardsLoading,
              child: SingleChildScrollView(
                child: Padding(
                  padding: AppConstants.padding16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'cage_cards'.i18n,
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                      const SizedBox(height: 10),
                      ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: state.cageCards.length,
                        itemBuilder: (context, index) {
                          final item = state.cageCards[index];
                          return ElementTile(
                            onTap: onCageTap,
                            model: item,
                            leading: Skeleton.shade(
                              child: BorderedTextualWidget(
                                text: (index + 1).toString(),
                              ),
                            ),
                            tag: item.type.name,
                            createdAt: item.createdAt.formatMMMMMDoYYYY,
                            title: Text(
                              strutStyle: const StrutStyle(height: 1.6),
                              item.name,
                              style: context.tt.titleMedium?.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            type: Text(
                              item.orientation.name,
                              style: context.tt.labelMedium?.copyWith(
                                color: context.cs.tertiary,
                              ),
                            ),
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
          } else if (state is CageCardsEmpty) {
            return MainErrorWidget(
              error: state.message,
            );
          } else if (state is CageCardsFail) {
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
