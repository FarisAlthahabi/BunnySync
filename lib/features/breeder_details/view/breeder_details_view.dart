import 'package:auto_route/auto_route.dart';
import 'package:bunny_sync/features/breeder_details/cubit/breeder_details_cubit.dart';
import 'package:bunny_sync/features/breeder_details/view/tabs/attachment_tab.dart';
import 'package:bunny_sync/features/breeder_details/view/tabs/images_tab.dart';
import 'package:bunny_sync/features/breeder_details/view/tabs/litters_tab.dart';
import 'package:bunny_sync/features/breeder_details/view/tabs/notes_tab.dart';
import 'package:bunny_sync/features/breeder_details/view/tabs/pedigree_tab.dart';
import 'package:bunny_sync/features/breeder_details/view/tabs/profile_tab.dart';
import 'package:bunny_sync/features/breeder_details/view/widgets/breeder_profile_info_widget.dart';
import 'package:bunny_sync/features/breeder_details/view/widgets/details_tab_bar.dart';
import 'package:bunny_sync/features/breeders/models/breeder_entry_model/breeder_entry_model.dart';
import 'package:bunny_sync/features/ledger/view/ledger_view.dart';
import 'package:bunny_sync/features/main_navigation/cubit/main_navigation_cubit.dart';
import 'package:bunny_sync/features/tasks/view/tasks_view.dart';
import 'package:bunny_sync/global/blocs/delete_breeder_cubit/delete_breeder_cubit.dart';
import 'package:bunny_sync/global/di/di.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/mixins/create_scroll_listener_mixin.dart';
import 'package:bunny_sync/global/router/router.dart';
import 'package:bunny_sync/global/widgets/bottom_sheet_widget.dart';
import 'package:bunny_sync/global/widgets/custom_app_bar.dart';
import 'package:bunny_sync/global/widgets/main_show_bottom_sheet.dart';
import 'package:bunny_sync/global/widgets/main_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

abstract class BreederDetailsViewCallbacks {
  void onMoreOptionsTap(BreederEntryModel breederEntryModel);

  void onEditBreeder(BreederEntryModel breederEntryModel);

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

  void onDeleteBreeder(BreederEntryModel breederEntryModel);
}

@RoutePage()
class BreederDetailsView extends StatelessWidget {
  const BreederDetailsView({
    super.key,
    required this.breederEntryModel,
  });

  final BreederEntryModel breederEntryModel;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BreederDetailsCubit>(
          create: (context) =>
              get<BreederDetailsCubit>(param1: breederEntryModel),
        ),
        BlocProvider<DeleteBreederCubit>(
          create: (context) => get<DeleteBreederCubit>(),
        ),
        BlocProvider<LittersCubit>(
          create: (context) => get<LittersCubit>(),
        ),
      ],
      child: BreederDetailsPage(
        breederEntryModel: breederEntryModel,
      ),
    );
  }
}

class BreederDetailsPage extends StatefulWidget {
  const BreederDetailsPage({
    super.key,
    required this.breederEntryModel,
  });

  final BreederEntryModel breederEntryModel;

  @override
  State<BreederDetailsPage> createState() => _BreederDetailsPageState();
}

class _BreederDetailsPageState extends State<BreederDetailsPage>
    with CreateScrollListenerMixin
    implements BreederDetailsViewCallbacks {
  late final BreederDetailsCubit breederDetailsCubit = context.read();

  late final MainNavigationCubit mainNavigationCubit = context.read();

  late final DeleteBreederCubit deleteBreederCubit = context.read();

  final parentScrollController = ScrollController();
  final List<ScrollController> childScrollController =
      List.generate(6, (index) => ScrollController());

  List<TabModel> get tabs => [
        TabModel(title: 'profile'.i18n),
        TabModel(title: 'litters'.i18n),
        TabModel(title: 'tasks'.i18n),
        TabModel(title: 'pedigree'.i18n),
        TabModel(title: 'ledger'.i18n),
        TabModel(title: 'notes'.i18n),
        TabModel(title: 'images'.i18n),
        TabModel(title: 'attachments'.i18n),
      ];

  @override
  void initState() {
    super.initState();
    for (final element in childScrollController) {
      element.addListener(
        createScrollListener(
          parent: parentScrollController,
          child: element,
        ),
      );
    }

    breederDetailsCubit.getBreederDetails();
  }

  @override
  void dispose() {
    parentScrollController.dispose();
    for (final element in childScrollController) {
      element.dispose();
    }
    super.dispose();
  }

  @override
  void onMoreOptionsTap(BreederEntryModel breederEntryModel) {
    mainShowBottomSheet(
      context,
      widget: BottomSheetWidget(
        title: 'breeder_options'.i18n,
        model: breederEntryModel,
        onArchive: onArchive,
        onBirth: onBirth,
        onBreed: onBreed,
        onCageCard: onCageCard,
        onButcher: onButcher,
        onCull: onCull,
        onEdit: onEditBreeder,
        onDelete: onDeleteBreeder,
        onDied: onDied,
        onNotes: onNotes,
        onPedigree: onPedigree,
        onSell: onSell,
        onWeight: onWeight,
      ),
    );
  }

  @override
  void onEditBreeder(BreederEntryModel breederEntryModel) {
    context.router.popForced();
    context.router.push(
      AddBreederRoute(
        breederEntryModel: breederEntryModel,
      ),
    );
  }

  @override
  void onArchive(BreederEntryModel breederEntryModel) {
    // TODO: implement onArchive
  }

  @override
  void onBirth(BreederEntryModel breederEntryModel) {
    // TODO: implement onBirth
  }

  @override
  void onBreed(BreederEntryModel breederEntryModel) {
    // TODO: implement onBreed
  }

  @override
  void onButcher(BreederEntryModel breederEntryModel) {
    // TODO: implement onButcher
  }

  @override
  void onCageCard(BreederEntryModel breederEntryModel) {
    // TODO: implement onCageCard
  }

  @override
  void onCull(BreederEntryModel breederEntryModel) {
    // TODO: implement onCull
  }

  @override
  void onDied(BreederEntryModel breederEntryModel) {
    // TODO: implement onDied
  }

  @override
  void onNotes(BreederEntryModel breederEntryModel) {
    // TODO: implement onNotes
  }

  @override
  void onPedigree(BreederEntryModel breederEntryModel) {
    // TODO: implement onPedigree
  }

  @override
  void onSell(BreederEntryModel breederEntryModel) {
    // TODO: implement onSell
  }

  @override
  void onWeight(BreederEntryModel breederEntryModel) {
    // TODO: implement onWeight
  }

  @override
  void onDeleteBreeder(BreederEntryModel breederEntryModel) {
    context.router.popForced();
    mainShowBottomSheet(
      context,
      widget: BottomSheetWidget(
        title: 'are_you_sure_to_delete_breeder'.i18n,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
              onPressed: () {
                context.router.popForced();
                deleteBreederCubit.deleteBreeder(breederEntryModel);
              },
              child: Text('yes'.i18n),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<MainNavigationCubit, MainNavigationState>(
          listener: (context, state) {
            if (state is BreederUpdated) {
              breederDetailsCubit.updateBreeder(state.breederEntryModel);
            }
          },
        ),
        BlocListener<DeleteBreederCubit, GeneralDeleteBreederState>(
          listener: (context, state) {
            if (state is DeleteBreederSuccess) {
              mainNavigationCubit.deleteBreeder(state.breeder);
              MainSnackBar.showSuccessMessageBar(
                context,
                'breeder_deleted'.i18n,
              );
              context.router.popForced();
            }
          },
        ),
      ],
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
        ),
        child: DefaultTabController(
          length: tabs.length,
          child: Scaffold(
            body: SafeArea(
              child: CustomScrollView(
                controller: parentScrollController,
                physics: const NeverScrollableScrollPhysics(),
                slivers: [
                  BlocBuilder<BreederDetailsCubit, GeneralBreederDetailsState>(
                    buildWhen: (prev, curr) => curr is BreederDetailsState,
                    builder: (context, state) {
                      if (state is BreederDetailsFetch) {
                        return Skeletonizer.sliver(
                          enabled: state is BreederDetailsLoading,
                          child: SliverAppBar(
                            expandedHeight: 250,
                            centerTitle: true,
                            collapsedHeight: 60,
                            title: Text(
                              'breeder'.i18n,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            actions: [
                              Padding(
                                padding: const EdgeInsets.only(right: 16),
                                child: IconButton(
                                  onPressed: () =>
                                      onMoreOptionsTap(state.breederEntryModel),
                                  icon: const Icon(Icons.more_horiz_outlined),
                                ),
                              ),
                            ],
                            flexibleSpace: FlexibleSpaceBar(
                              background: BreederProfileInfoWidget(
                                breeder: state.breederEntryModel,
                              ),
                            ),
                            bottom: PreferredSize(
                              preferredSize: const Size.fromHeight(0),
                              child: Center(
                                child: DetailsTabBar(
                                  tabs: tabs,
                                ),
                              ),
                            ),
                          ),
                        );
                      }
                      return const SliverToBoxAdapter(
                        child: SizedBox(),
                      );
                    },
                  ),
                  SliverFillRemaining(
                    child: TabBarView(
                      children: [
                        ProfileTab(
                          breederId: widget.breederEntryModel.id,
                          controller: childScrollController[0],
                        ),
                        LittersTab(
                          breederId: widget.breederEntryModel.id,
                          controller: childScrollController[1],
                        ),
                        TasksView(
                          scrollController: childScrollController[4],
                        ),
                        PedigreeTab(
                          breederId: widget.breederEntryModel.id,
                          controller: childScrollController[2],
                        ),
                        LedgerView(
                          breederId: widget.breederEntryModel.id,
                        ),
                        NotesTab(
                          breederId: widget.breederEntryModel.id,
                          controller: childScrollController[3],
                        ),
                        ImagesTab(
                          breederId: widget.breederEntryModel.id,
                          controller: childScrollController[5],
                        ),
                        AttachmentTab(
                          breederId: widget.breederEntryModel.id,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
