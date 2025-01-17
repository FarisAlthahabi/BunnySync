import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:bunny_sync/features/breeders/cubit/breeders_cubit.dart';
import 'package:bunny_sync/features/breeders/models/breeder_entry_model/breeder_entry_model.dart';
import 'package:bunny_sync/features/breeders/view/breed_view.dart';
import 'package:bunny_sync/features/breeders/view/save_birth_view.dart';
import 'package:bunny_sync/features/breeders/view/set_butcher_view.dart';
import 'package:bunny_sync/features/breeders/view/set_sell_view.dart';
import 'package:bunny_sync/features/breeders/view/widgets/breeders_list_widget.dart';
import 'package:bunny_sync/features/main_navigation/cubit/main_navigation_cubit.dart';
import 'package:bunny_sync/features/weight/view/weights_view.dart';
import 'package:bunny_sync/global/blocs/delete_breeder_cubit/delete_breeder_cubit.dart';
import 'package:bunny_sync/global/blocs/rabbit_concerns_cubit/rabbit_concerns_cubit.dart';
import 'package:bunny_sync/global/di/di.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/mixins/create_scroll_listener_mixin.dart';
import 'package:bunny_sync/global/router/router.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/utils/enums/gender_types_enum.dart';
import 'package:bunny_sync/global/utils/utils.dart';
import 'package:bunny_sync/global/widgets/bottom_sheet_widget.dart';
import 'package:bunny_sync/global/widgets/custom_app_bar.dart';
import 'package:bunny_sync/global/widgets/keep_alive_widget.dart';
import 'package:bunny_sync/global/widgets/loading_indicator.dart';
import 'package:bunny_sync/global/widgets/main_show_bottom_sheet.dart';
import 'package:bunny_sync/global/widgets/main_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:skeletonizer/skeletonizer.dart';

abstract class BreedersViewCallbacks {
  void onBreederTap(BreederEntryModel breederEntryModel);

  void onEditBreeder(BreederEntryModel breederEntryModel);

  void onDeleteBreeder(BreederEntryModel breederEntryModel);

  void onMoreOptionsTap(BreederEntryModel breederEntryModel);

  void onTryAgainTap();

  void onSearchChanged(String value);

  void onDeleteSearch();

  void onBreed(BreederEntryModel breederEntryModel);

  void onBirth(BreederEntryModel breederEntryModel);

  void onCageCard(BreederEntryModel breederEntryModel);

  void onPedigree(BreederEntryModel breederEntryModel);

  void onSell(BreederEntryModel breederEntryModel);

  void onWeight(BreederEntryModel breederEntryModel);

  void onButcher(BreederEntryModel breederEntryModel);

  void onDied(BreederEntryModel breederEntryModel);

  void onArchive(BreederEntryModel breederEntryModel);

  void onCull(BreederEntryModel breederEntryModel);

  void onNotes(BreederEntryModel breederEntryModel);

  void onSetActive(BreederEntryModel breederEntryModel);

  void onScanTap();

  void onGenderSelected(GenderTypes? gender);
}

@RoutePage()
class BreedersView extends StatelessWidget {
  const BreedersView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BreedersCubit>(
          create: (context) => get<BreedersCubit>(),
        ),
        BlocProvider<DeleteBreederCubit>(
          create: (context) => get<DeleteBreederCubit>(),
        ),
      ],
      child: const BreedersPage(),
    );
  }
}

class BreedersPage extends StatefulWidget {
  const BreedersPage({super.key});

  @override
  State<BreedersPage> createState() => _BreedersPageState();
}

class _BreedersPageState extends State<BreedersPage>
    with CreateScrollListenerMixin
    implements BreedersViewCallbacks {
  late final DeleteBreederCubit deleteBreederCubit = context.read();

  late final BreedersCubit breedersCubit = context.read();

  late final RabbitConcernsCubit rabbitConcernsCubit = context.read();

  final parentScrollController = ScrollController();
  final child1ScrollController = ScrollController();
  final child2ScrollController = ScrollController();
  final child3ScrollController = ScrollController();

  final TextEditingController searchController = TextEditingController();
  final FocusNode searchFocusNode = FocusNode();

  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    breedersCubit.getBreeders();
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
    searchController.dispose();
    _debounce?.cancel();

    super.dispose();
  }

  @override
  void onSearchChanged(String value) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(AppConstants.duration400ms, () {
      breedersCubit.getSearchedBreeders(value);
    });
  }

  @override
  void onDeleteSearch() {
    searchController.clear();
    searchFocusNode.unfocus();
    breedersCubit.getSearchedBreeders('');
  }

  @override
  void onTryAgainTap() {
    breedersCubit.getBreeders();
  }

  @override
  void onBreederTap(BreederEntryModel breederEntryModel) {
    context.router.push(
      BreederDetailsRoute(breederEntryModel: breederEntryModel),
    );
  }

  @override
  void onMoreOptionsTap(BreederEntryModel breederEntryModel) {
    mainShowBottomSheet(
      context,
      widget: BottomSheetWidget(
        title: 'breeder_options'.i18n,
        onEdit: onEditBreeder,
        onSetActive: onSetActive,
        onDelete: onDeleteBreeder,
        model: breederEntryModel,
        onArchive: onArchive,
        onBirth: onBirth,
        onBreed: onBreed,
        onCageCard: onCageCard,
        onButcher: onButcher,
        onCull: onCull,
        onDied: onDied,
        onNotes: onNotes,
        onPedigree: onPedigree,
        onSell: onSell,
        onWeight: onWeight,
      ),
    );
  }

  @override
  void onSetActive(BreederEntryModel breederEntryModel) {
    context.router.popForced();
    mainShowBottomSheet(
      context,
      widget: BottomSheetWidget(
        title: 'are_you_sure_to_set_breeder_active'.i18n,
        model: breederEntryModel,
        onConfirm: (breederEntryModel) => rabbitConcernsCubit.setActive(
          breederId: breederEntryModel.id,
        ),
      ),
    );
  }

  @override
  void onDeleteBreeder(BreederEntryModel breederEntryModel) {
    context.router.popForced();
    mainShowBottomSheet(
      context,
      widget: BottomSheetWidget(
        title: 'are_you_sure_to_delete_breeder'.i18n,
        model: breederEntryModel,
        onConfirm: (breederEntryModel) {
          context.router.popForced();
          deleteBreederCubit.deleteBreeder(breederEntryModel);
        },
      ),
    );
  }

  @override
  void onEditBreeder(BreederEntryModel breederEntryModel) {
    Navigator.pop(context);
    context.router.push(
      AddBreederRoute(
        breederEntryModel: breederEntryModel,
      ),
    );
  }

  @override
  void onArchive(BreederEntryModel breederEntryModel) {
    Utils.showComingSoonToast();
  }

  @override
  void onBirth(BreederEntryModel breederEntryModel) {
    context.router.popForced();
    mainShowBottomSheet(
      context,
      widget: BottomSheetWidget(
        isTitleCenter: true,
        title: 'birth'.i18n,
        child: const SaveBirthView(),
      ),
    );
  }

  @override
  void onBreed(BreederEntryModel breederEntryModel) {
    context.router.popForced();
    mainShowBottomSheet(
      context,
      widget: BottomSheetWidget(
        isTitleCenter: true,
        title: 'breed'.i18n,
        child: const BreedView(),
      ),
    );
  }

  @override
  void onButcher(BreederEntryModel breederEntryModel) {
    context.router.popForced();
    mainShowBottomSheet(
      context,
      widget: BottomSheetWidget(
        isTitleCenter: true,
        title: 'butcher'.i18n,
        child: SetButcherView(
          breederId: breederEntryModel.id,
          breedersCubit: breedersCubit,
        ),
      ),
    );
  }

  @override
  void onCageCard(BreederEntryModel breederEntryModel) {
    Utils.showComingSoonToast();
  }

  @override
  void onCull(BreederEntryModel breederEntryModel) {
    Utils.showComingSoonToast();
  }

  @override
  void onDied(BreederEntryModel breederEntryModel) {
    Utils.showComingSoonToast();
  }

  @override
  void onNotes(BreederEntryModel breederEntryModel) {
    context.router.popForced();
    context.router.push(
      BreederDetailsRoute(
        breederEntryModel: breederEntryModel,
        initialIndex: 6,
      ),
    );
  }

  @override
  void onPedigree(BreederEntryModel breederEntryModel) {
    context.router.popForced();
    context.router.push(
      BreederDetailsRoute(
        breederEntryModel: breederEntryModel,
        initialIndex: 3,
      ),
    );
  }

  @override
  void onSell(BreederEntryModel breederEntryModel) {
    context.router.popForced();
    mainShowBottomSheet(
      context,
      widget: BottomSheetWidget(
        isTitleCenter: true,
        title: 'sell'.i18n,
        child: SetSellView(
          breederId: breederEntryModel.id,
        ),
      ),
    );
  }

  @override
  void onWeight(BreederEntryModel breederEntryModel) {
    context.router.popForced();
    mainShowBottomSheet(
      context,
      widget: BottomSheetWidget(
        isTitleCenter: true,
        title: 'weights'.i18n,
        child: WeightView(
          weightableModel: breederEntryModel,
        ),
      ),
    );
  }

  @override
  void onGenderSelected(GenderTypes? gender) {
    if (gender != null) {
      breedersCubit.getBreedersByGender(gender);
    } else {
      breedersCubit.getBreeders();
    }
  }

  @override
  void onScanTap() {
    context.router.push(const BarcodeScannerRoute());
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<MainNavigationCubit, MainNavigationState>(
          listener: (context, state) {
            if (state is BreederAdded) {
              breedersCubit.addBreeder(state.breederEntryModel);
            } else if (state is BreederUpdated) {
              breedersCubit.updateBreeder(state.breederEntryModel);
            } else if (state is BreederDeleted) {
              breedersCubit.deleteBreeder(state.breederEntryModel.id);
            } else if (state is LitterAdded) {
              //TODO: Implement this
              // breedersCubit.addLitter(state.addLitterModel);
            }
          },
        ),
        BlocListener<RabbitConcernsCubit, GeneralRabbitConcernsState>(
          listener: (context, state) {
            if (state is SetActiveSuccess) {
              context.loaderOverlay.hide();
              MainSnackBar.showSuccessMessageBar(
                context,
                'set_active_success'.i18n,
              );
              context.router.maybePop();
            } else if (state is SetActiveLoading) {
              context.loaderOverlay.show();
            } else if (state is SetActiveFail) {
              context.loaderOverlay.hide();
              MainSnackBar.showErrorMessageBar(
                context,
                state.message,
              );
            }
          },
        ),
        BlocListener<DeleteBreederCubit, GeneralDeleteBreederState>(
          listener: (context, state) {
            if (state is DeleteBreederSuccess) {
              breedersCubit.deleteBreeder(state.breeder.id);
              MainSnackBar.showSuccessMessageBar(
                context,
                'breeder_deleted'.i18n,
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
                BlocBuilder<BreedersCubit, GeneralBreedersState>(
                  builder: (context, state) {
                    var title = 'breeders'.i18n;
                    var tabs = <TabModel>[];

                    if (state is BreedersState) {
                      tabs = [
                        TabModel(
                          title: 'active'.i18n,
                          indicatorValue: state is BreedersFetch
                              ? state.breedersStatusModel.active.length
                                  .toString()
                              : null,
                        ),
                        TabModel(
                          title: 'inactive'.i18n,
                          indicatorValue: state is BreedersFetch
                              ? state.breedersStatusModel.inactive.length
                                  .toString()
                              : null,
                        ),
                        TabModel(
                          title: 'all'.i18n,
                        ),
                      ];
                    } else if (state is SearchBreederState) {
                      title = 'found_breeders'.i18n;
                    }

                    return Skeletonizer.sliver(
                      enabled: state is BreedersLoading,
                      child: CustomAppBar(
                        onScanTap: onScanTap,
                        searchController: searchController,
                        searchFocusNode: searchFocusNode,
                        onSearchChanged: onSearchChanged,
                        onDeleteSearch: searchController.text.isNotEmpty
                            ? onDeleteSearch
                            : null,
                        title: title,
                        tabs: tabs,
                        selectableItems: GenderTypes.values,
                        hint: 'gender'.i18n,
                        onFilterSelect: onGenderSelected,
                      ),
                    );
                  },
                ),
                SliverFillRemaining(
                  child: BlocBuilder<BreedersCubit, GeneralBreedersState>(
                    builder: (context, state) {
                      if (state is BreedersFetch) {
                        return Skeletonizer(
                          enabled: state is BreedersLoading,
                          child: TabBarView(
                            children: [
                              KeepAliveWidget(
                                child: BreedersListWidget(
                                  onMoreOptionsTap: onMoreOptionsTap,
                                  controller: child1ScrollController,
                                  breeders: state.breedersStatusModel.active,
                                  padding: AppConstants.paddingH16V28,
                                  onBreederTap: onBreederTap,
                                  onRefresh: breedersCubit.getBreeders,
                                ),
                              ),
                              KeepAliveWidget(
                                child: BreedersListWidget(
                                  onMoreOptionsTap: onMoreOptionsTap,
                                  controller: child2ScrollController,
                                  breeders: state.breedersStatusModel.inactive,
                                  padding: AppConstants.paddingH16V28,
                                  onBreederTap: onBreederTap,
                                  onRefresh: breedersCubit.getBreeders,
                                ),
                              ),
                              KeepAliveWidget(
                                child: BreedersListWidget(
                                  onMoreOptionsTap: onMoreOptionsTap,
                                  controller: child3ScrollController,
                                  breeders: state.breedersStatusModel.all,
                                  padding: AppConstants.paddingH16V28,
                                  onBreederTap: onBreederTap,
                                  onRefresh: breedersCubit.getBreeders,
                                ),
                              ),
                            ],
                          ),
                        );
                      } else if (state is BreedersFail) {
                        return Scaffold(
                          body: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  state.message,
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                TextButton(
                                  onPressed: onTryAgainTap,
                                  child: Text("try_again".i18n),
                                ),
                              ],
                            ),
                          ),
                        );
                      } else if (state is SearchBreederLoading) {
                        return Center(
                          child: LoadingIndicator(
                            color: context.cs.primary,
                          ),
                        );
                      } else if (state is SearchBreederSuccess) {
                        return KeepAliveWidget(
                          child: BreedersListWidget(
                            controller: child3ScrollController,
                            breeders: state.searchedBreeders,
                            padding: AppConstants.paddingH16V28,
                            onBreederTap: onBreederTap,
                            onMoreOptionsTap: onMoreOptionsTap,
                          ),
                        );
                      } else if (state is SearchBreederNotFound) {
                        return Center(
                          child: Text(
                            state.message,
                            style: context.tt.bodyLarge,
                          ),
                        );
                      } else if (state is SearchBreederFail) {
                        return Center(
                          child: Text(
                            state.message,
                            style: context.tt.bodyLarge,
                          ),
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
