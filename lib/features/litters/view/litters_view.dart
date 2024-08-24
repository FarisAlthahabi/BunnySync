import 'package:auto_route/auto_route.dart';
import 'package:bunny_sync/features/litters/cubit/litters_cubit.dart';
import 'package:bunny_sync/features/litters/models/litter_entry_model/litter_entry_model.dart';
import 'package:bunny_sync/features/litters/view/widgets/litters_list_widget.dart';
import 'package:bunny_sync/features/main_navigation/cubit/main_navigation_cubit.dart';
import 'package:bunny_sync/global/blocs/note_cubit/cubit/notes_cubit.dart';
import 'package:bunny_sync/global/di/di.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/mixins/create_scroll_listener_mixin.dart';
import 'package:bunny_sync/global/router/router.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/bottom_sheet_widget.dart';
import 'package:bunny_sync/global/widgets/custom_app_bar.dart';
import 'package:bunny_sync/global/widgets/keep_alive_widget.dart';
import 'package:bunny_sync/global/widgets/main_error_widget.dart';
import 'package:bunny_sync/global/widgets/main_show_bottom_sheet.dart';
import 'package:bunny_sync/global/widgets/main_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:skeletonizer/skeletonizer.dart';

abstract class LittersViewCallbacks {
  void onLitterTap(LitterEntryModel breeder);

  void onTryAgainTap();

  void onMoreOptionsTap(LitterEntryModel litterEntryModel);

  void onEditLitterTab(LitterEntryModel litterEntryModel);

  void onDeleteLitterTab(LitterEntryModel litterEntryModel);

  void onCageCard(LitterEntryModel litterEntryModel);

  void onArchive(LitterEntryModel litterEntryModel);

  void onSell(LitterEntryModel litterEntryModel);

  void onWeight(LitterEntryModel litterEntryModel);

  void onButcher(LitterEntryModel litterEntryModel);
}

@RoutePage()
class LittersView extends StatelessWidget {
  const LittersView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => get<LittersCubit>(),
        ),
        BlocProvider(
          create: (context) => get<NotesCubit>(),
        ),
      ],
      child: const LittersPage(),
    );
  }
}

class LittersPage extends StatefulWidget {
  const LittersPage({super.key});

  @override
  State<LittersPage> createState() => _LittersPageState();
}

class _LittersPageState extends State<LittersPage>
    with CreateScrollListenerMixin
    implements LittersViewCallbacks {
  late final LittersCubit littersCubit = context.read();

  late final NotesCubit notesCubit = context.read();

  final parentScrollController = ScrollController();
  final child1ScrollController = ScrollController();
  final child2ScrollController = ScrollController();
  final child3ScrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    littersCubit.getLitters();

    child1ScrollController.addListener(
      createScrollListener(
        parent: parentScrollController,
        child: child1ScrollController,
      ),
    );

    child2ScrollController.addListener(
      createScrollListener(
        parent: parentScrollController,
        child: child2ScrollController,
      ),
    );

    child3ScrollController.addListener(
      createScrollListener(
        parent: parentScrollController,
        child: child3ScrollController,
      ),
    );
  }

  @override
  void dispose() {
    parentScrollController.dispose();
    child1ScrollController.dispose();
    child2ScrollController.dispose();
    child3ScrollController.dispose();
    super.dispose();
  }

  @override
  void onLitterTap(LitterEntryModel litter) {
    context.router.push(
      LitterDetailsRoute(litter: litter),
    );
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
  void onDeleteLitterTab(LitterEntryModel litterEntryModel) {
    context.router.popForced();
    mainShowBottomSheet(
      context,
      widget: BottomSheetWidget(
        title: 'are_you_sure_to_delete_litter'.i18n,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
              onPressed: () {
                context.router.popForced();
                littersCubit.deleteLitter(litterEntryModel.id);
              },
              child: Text('yes'.i18n),
            ),
          ],
        ),
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
  void onSell(LitterEntryModel litterEntryModel) {
    // TODO: implement onSell
  }

  @override
  void onWeight(LitterEntryModel litterEntryModel) {
    // TODO: implement onWeight
  }

  @override
  void onTryAgainTap() {
    littersCubit.getLitters();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<MainNavigationCubit, MainNavigationState>(
          listener: (context, state) {
            if (state is LitterAdded) {
              //TODO: add litter manually
              littersCubit.getLitters();
            }
          },
        ),
        BlocListener<LittersCubit, GeneralLittersState>(
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
        ),
      ],
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          body: SafeArea(
            top: false,
            child: CustomScrollView(
              controller: parentScrollController,
              physics: const NeverScrollableScrollPhysics(),
              slivers: [
                BlocBuilder<LittersCubit, GeneralLittersState>(
                  builder: (context, state) {
                    if (state is LittersFetch) {
                      return Skeletonizer.sliver(
                        enabled: state is LittersLoading,
                        child: CustomAppBar(
                          onSearchChanged: (value) {},
                          title: 'litters'.i18n,
                          tabs: [
                            TabModel(
                              title: 'active'.i18n,
                              indicatorValue: state
                                  .littersStatusModel.active.length
                                  .toString(),
                            ),
                            TabModel(
                              title: 'inactive'.i18n,
                              indicatorValue: state
                                  .littersStatusModel.inactive.length
                                  .toString(),
                            ),
                            TabModel(
                              title: 'all'.i18n,
                            ),
                          ],
                        ),
                      );
                    }
                    return const SliverToBoxAdapter(
                      child: SizedBox.shrink(),
                    );
                  },
                ),
                SliverFillRemaining(
                  child: BlocBuilder<LittersCubit, GeneralLittersState>(
                    buildWhen: (previous, current) => current is LittersState,
                    builder: (context, state) {
                      if (state is LittersFetch) {
                        return Skeletonizer(
                          enabled: state is LittersLoading,
                          child: TabBarView(
                            children: [
                              KeepAliveWidget(
                                child: LittersListWidget(
                                  onMoreOptionsTap: onMoreOptionsTap,
                                  controller: child1ScrollController,
                                  litters: state.littersStatusModel.active,
                                  padding: AppConstants.paddingH16V28,
                                  onLitterTap: onLitterTap,
                                  onRefresh: littersCubit.getLitters,
                                ),
                              ),
                              KeepAliveWidget(
                                child: LittersListWidget(
                                  onMoreOptionsTap: onMoreOptionsTap,
                                  controller: child2ScrollController,
                                  litters: state.littersStatusModel.inactive,
                                  padding: AppConstants.paddingH16V28,
                                  onLitterTap: onLitterTap,
                                  onRefresh: littersCubit.getLitters,
                                ),
                              ),
                              KeepAliveWidget(
                                child: LittersListWidget(
                                  onMoreOptionsTap: onMoreOptionsTap,
                                  controller: child3ScrollController,
                                  litters: state.littersStatusModel.all,
                                  padding: AppConstants.paddingH16V28,
                                  onLitterTap: onLitterTap,
                                  onRefresh: littersCubit.getLitters,
                                ),
                              ),
                            ],
                          ),
                        );
                      } else if (state is LittersFail) {
                        return MainErrorWidget(
                          error: state.message,
                          onTap: onTryAgainTap,
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
