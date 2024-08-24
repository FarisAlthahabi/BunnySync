import 'package:auto_route/auto_route.dart';
import 'package:bunny_sync/features/breeder_details/view/tabs/notes_tab.dart';
import 'package:bunny_sync/features/breeder_details/view/widgets/details_tab_bar.dart';
import 'package:bunny_sync/features/ledger/view/ledger_view.dart';
import 'package:bunny_sync/features/litter_details/cubit/litter_details_cubit.dart';
import 'package:bunny_sync/features/litter_details/view/tabs/kits_tab.dart';
import 'package:bunny_sync/features/litter_details/view/widgets/litter_profile_info_widget.dart';
import 'package:bunny_sync/features/litters/models/litter_entry_model/litter_entry_model.dart';
import 'package:bunny_sync/features/tasks/view/tasks_view.dart';
import 'package:bunny_sync/global/blocs/note_cubit/cubit/notes_cubit.dart';
import 'package:bunny_sync/global/di/di.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/mixins/create_scroll_listener_mixin.dart';
import 'package:bunny_sync/global/mixins/mixins.dart';
import 'package:bunny_sync/global/router/router.dart';
import 'package:bunny_sync/global/widgets/bottom_sheet_widget.dart';
import 'package:bunny_sync/global/widgets/custom_app_bar.dart';
import 'package:bunny_sync/global/widgets/main_show_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

abstract class LitterDetailsViewCallbacks {

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
class LitterDetailsView extends StatelessWidget {
  const LitterDetailsView({
    super.key,
    required this.litter,
  });

  final LitterEntryModel litter;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => get<LitterDetailsCubit>(),
        ),
        BlocProvider(
          create: (context) => get<NotesCubit>(),
        ),
      ],
      child: LitterDetailsPage(
        litter: litter,
      ),
    );
  }
}

class LitterDetailsPage extends StatefulWidget {
  const LitterDetailsPage({
    super.key,
    required this.litter,
  });

  final LitterEntryModel litter;

  @override
  State<LitterDetailsPage> createState() => _LitterDetailsPageState();
}

class _LitterDetailsPageState extends State<LitterDetailsPage>
    with CreateScrollListenerMixin , PostFrameMixin
    implements LitterDetailsViewCallbacks {
  late final LitterDetailsCubit litterDetailsCubit = context.read();

  late final NotesCubit notesCubit = context.read();

  final parentScrollController = ScrollController();
  final List<ScrollController> childScrollController =
      List.generate(4, (index) => ScrollController());

  @override
  void onPostFrame() {
     for (final element in childScrollController) {
      element.addListener(
        createScrollListener(
          parent: parentScrollController,
          child: element,
        ),
      );
    }
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
    // TODO: implement onDeleteLitterTab
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

  List<TabModel> get tabs => [
        TabModel(title: 'kits'.i18n),
        TabModel(title: 'tasks'.i18n),
        TabModel(title: 'ledger'.i18n),
        TabModel(title: 'notes'.i18n),
      ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        body: SafeArea(
          child: CustomScrollView(
            controller: parentScrollController,
            physics: const NeverScrollableScrollPhysics(),
            slivers: [
              SliverAppBar(
                expandedHeight: 250,
                centerTitle: true,
                title: Text(
                  'litter'.i18n,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: IconButton(
                      onPressed: ()=> onMoreOptionsTap(widget.litter),
                      icon: const Icon(Icons.more_horiz_outlined),
                    ),
                  ),
                ],
                flexibleSpace: FlexibleSpaceBar(
                  background: LitterProfileInfoWidget(
                    paddingTop: 70,
                    litter: widget.litter,
                  ),
                ),
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(0),
                  child: Skeleton.shade(
                    child: DetailsTabBar(tabs: tabs),
                  ),
                ),
              ),
              SliverFillRemaining(
                child: TabBarView(
                  children: [
                    KitsTab(
                      litterId: widget.litter.id,
                      scrollController: childScrollController[0],
                    ),
                    TasksView(
                      litterId: widget.litter.id,
                      scrollController: childScrollController[1],
                    ),
                    LedgerView(
                      litterId: widget.litter.id,
                      controler: childScrollController[2],
                    ),
                    NotesTab(
                      litterId: widget.litter.id,
                      controller: childScrollController[3],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
