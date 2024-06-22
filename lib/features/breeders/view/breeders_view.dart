import 'package:auto_route/auto_route.dart';
import 'package:bunny_sync/features/breeders/view/widgets/breeders_list_widget.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/custom_app_bar.dart';
import 'package:bunny_sync/global/widgets/keep_alive_widget.dart';
import 'package:flutter/material.dart';

@RoutePage()
class BreedersView extends StatelessWidget {
  const BreedersView({super.key});

  @override
  Widget build(BuildContext context) {
    return const BreedersPage();
  }
}

class BreedersPage extends StatefulWidget {
  const BreedersPage({super.key});

  @override
  State<BreedersPage> createState() => _BreedersPageState();
}

class _BreedersPageState extends State<BreedersPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: SafeArea(
          top: false,
          child: CustomScrollView(
            slivers: [
              CustomAppBar(
                onSearchChanged: (value) {},
                title: 'breeders'.i18n,
                tabs: [
                  TabModel(
                    title: 'active'.i18n,
                    indicatorValue: '5',
                  ),
                  TabModel(
                    title: 'inactive'.i18n,
                    indicatorValue: '5',
                  ),
                  TabModel(
                    title: 'all'.i18n,
                  ),
                ],
              ),
              const SliverFillRemaining(
                child: TabBarView(
                  children: [
                    KeepAliveWidget(
                      child: BreedersListWidget(
                        padding: AppConstants.paddingH16V28,
                      ),
                    ),
                    KeepAliveWidget(
                      child: BreedersListWidget(
                        padding: AppConstants.paddingH16V28,
                      ),
                    ),
                    KeepAliveWidget(
                      child: BreedersListWidget(
                        padding: AppConstants.paddingH16V28,
                      ),
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
