import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:bunny_sync/features/breeders/cubit/breeders_cubit.dart';
import 'package:bunny_sync/features/breeders/models/breeder_entry_model/breeder_entry_model.dart';
import 'package:bunny_sync/features/breeders/view/widgets/breeder_more_options_widget.dart';
import 'package:bunny_sync/features/breeders/view/widgets/breeders_list_widget.dart';
import 'package:bunny_sync/global/di/di.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/router/router.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/bottom_sheet_widget.dart';
import 'package:bunny_sync/global/widgets/custom_app_bar.dart';
import 'package:bunny_sync/global/widgets/keep_alive_widget.dart';
import 'package:bunny_sync/global/widgets/loading_indicator.dart';
import 'package:bunny_sync/global/widgets/main_show_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

abstract class BreedersViewCallbacks {
  void onBreederTap(BreederEntryModel breederEntryModel);

  void onEditBreeder(BreederEntryModel breederEntryModel);

  void onDeleteBreeder();

  void onMoreOptionsTap(BreederEntryModel breederEntryModel);

  void onTryAgainTap();

  void onSearchChanged(String value);

  void onDeleteSearch();
}

@RoutePage()
class BreedersView extends StatelessWidget {
  const BreedersView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => get<BreedersCubit>(),
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
    implements BreedersViewCallbacks {
  late final BreedersCubit breedersCubit = context.read();

  final parentScrollController = ScrollController();
  final child1ScrollController = ScrollController();
  final child2ScrollController = ScrollController();
  final child3ScrollController = ScrollController();

  final TextEditingController searchController = TextEditingController();
  final FocusNode searchFocusNode = FocusNode();

  Timer? _debounce;

  bool isParentScrollingDownward = false;
  bool isParentScrollingUpward = false;

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

  VoidCallback createScrollListener({
    required ScrollController parent,
    required ScrollController child,
  }) {
    return () {
      child.addListener(() {
        if (child.position.userScrollDirection == ScrollDirection.reverse &&
            !isParentScrollingDownward) {
          parent.animateTo(
            200,
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeIn,
          );
          isParentScrollingDownward = true;
          isParentScrollingUpward = false;
        } else if (child.position.userScrollDirection ==
                ScrollDirection.forward &&
            !isParentScrollingUpward) {
          parent.animateTo(
            0,
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeIn,
          );
          isParentScrollingUpward = true;
          isParentScrollingDownward = false;
        }
      });
    };
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
        child: BreederMoreOptionsWidget(
          breederEntryModel: breederEntryModel,
          onEditBreeder: onEditBreeder,
          onDeleteBreeder: onDeleteBreeder,
        ),
      ),
    );
  }

  @override
  void onDeleteBreeder() {
    // TODO
  }

  @override
  void onEditBreeder(BreederEntryModel breederEntryModel) {
    Navigator.pop(context);
    context.router.push(
      AddBreederRoute(breederEntryModel: breederEntryModel),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
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
                            ? state
                                .breedersStatusModel.active.length
                                .toString()
                            : null,
                      ),
                      TabModel(
                        title: 'inactive'.i18n,
                        indicatorValue: state is BreedersFetch
                            ? state
                                .breedersStatusModel.inactive.length
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
                      searchController: searchController,
                      onSearchChanged: onSearchChanged,
                      onDeleteSearch: searchController.text.isNotEmpty
                          ? onDeleteSearch
                          : null,
                      title: title,
                      tabs: tabs,
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
                                breeders:
                                    state.breedersStatusModel.inactive,
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
                      return const Center(
                        child: LoadingIndicator(
                          color: AppColors.mainColor,
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
    );
  }
}
