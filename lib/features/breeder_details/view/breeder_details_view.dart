import 'package:auto_route/annotations.dart';
import 'package:bunny_sync/features/breeder_details/cubit/breeder_details_cubit.dart';
import 'package:bunny_sync/features/breeder_details/view/tabs/notes_tab.dart';
import 'package:bunny_sync/features/breeder_details/view/tabs/pedigree_tab.dart';
import 'package:bunny_sync/features/breeder_details/view/tabs/profile_tab.dart';
import 'package:bunny_sync/features/breeder_details/view/widgets/breeder_profile_info_widget.dart';
import 'package:bunny_sync/features/breeder_details/view/widgets/details_tab_bar.dart';
import 'package:bunny_sync/features/breeders/models/breeder_entry_model/breeder_entry_model.dart';
import 'package:bunny_sync/global/di/di.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BreederDetailsViewCallbacks {
  void onMoreOptionsTap();
}

@RoutePage()
class BreederDetailsView extends StatelessWidget {
  const BreederDetailsView({super.key, required this.breederEntryModel,});

  final BreederEntryModel breederEntryModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => get<BreederDetailsCubit>(),
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
    implements BreederDetailsViewCallbacks {
  late final BreederDetailsCubit breederDetailsCubit = context.read();

  List<TabModel> get tabs => [
        TabModel(title: 'profile'.i18n),
        TabModel(title: 'litters'.i18n),
        TabModel(title: 'pedigree'.i18n),
        TabModel(title: 'notes'.i18n),
        TabModel(title: 'tasks'.i18n),
      ];



  @override
  void onMoreOptionsTap() {}


  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
      ),
      child:  DefaultTabController(
              length: tabs.length,
              child: Scaffold(
                body: SafeArea(
                  child: CustomScrollView(
                    physics: const NeverScrollableScrollPhysics(),
                    slivers: [
                      SliverAppBar(
                        expandedHeight: 250,
                        centerTitle: true,
                        title: Text(
                          'breeder'.i18n,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        actions: [
                          Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: IconButton(
                              onPressed: onMoreOptionsTap,
                              icon: const Icon(Icons.more_horiz_outlined),
                            ),
                          ),
                        ],
                        flexibleSpace: FlexibleSpaceBar(
                          background: BreederProfileInfoWidget(
                            breeder: widget.breederEntryModel,
                          ),
                        ),
                        bottom: PreferredSize(
                          preferredSize: const Size.fromHeight(0),
                          child: DetailsTabBar(tabs: tabs),
                        ),
                      ),
                      SliverFillRemaining(
                        child: TabBarView(
                          children: [
                            ProfileTabBarView(breederId: widget.breederEntryModel.id),
                            ProfileTabBarView(breederId: widget.breederEntryModel.id),
                            PedigreeTabBarView(breederId: widget.breederEntryModel.id),
                            NotesTabBarView(breederId: widget.breederEntryModel.id),
                            ProfileTabBarView(breederId: widget.breederEntryModel.id),
                            ProfileTab(breederId: widget.breederEntryModel.id),
                            PedigreeTab(breederId: widget.breederEntryModel.id),
                            NotesTab(breederId: widget.breederEntryModel.id),
                          ],
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
