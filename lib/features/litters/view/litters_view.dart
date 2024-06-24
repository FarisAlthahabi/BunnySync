import 'package:auto_route/auto_route.dart';
import 'package:bunny_sync/features/litters/models/litter_model.dart';
import 'package:bunny_sync/features/litters/view/widgets/litters_list_widget.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/router/router.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/custom_app_bar.dart';
import 'package:bunny_sync/global/widgets/keep_alive_widget.dart';
import 'package:flutter/material.dart';

abstract class LittersViewCallbacks {
  void onLitterTap(LitterModel breeder);

  void onOptionsTap();
}

@RoutePage()
class LittersView extends StatelessWidget {
  const LittersView({super.key});

  @override
  Widget build(BuildContext context) {
    return const LittersPage();
  }
}

class LittersPage extends StatefulWidget {
  const LittersPage({super.key});

  @override
  State<LittersPage> createState() => _LittersPageState();
}

class _LittersPageState extends State<LittersPage>
    implements LittersViewCallbacks {
  @override
  void onLitterTap(LitterModel litter) {
    context.router.push(
      LitterDetailsRoute(litter: litter),
    );
  }

  @override
  void onOptionsTap() {}

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
                title: 'litters'.i18n,
                tabs: [
                  TabModel(
                    title: 'active'.i18n,
                    indicatorValue: '9',
                  ),
                  TabModel(
                    title: 'inactive'.i18n,
                    indicatorValue: '9',
                  ),
                  TabModel(
                    title: 'all'.i18n,
                  ),
                ],
              ),
              SliverFillRemaining(
                child: TabBarView(
                  children: [
                    KeepAliveWidget(
                      child: LittersListWidget(
                        padding: AppConstants.paddingH16V28,
                        onLitterTap: onLitterTap,
                      ),
                    ),
                    KeepAliveWidget(
                      child: LittersListWidget(
                        padding: AppConstants.paddingH16V28,
                        onLitterTap: onLitterTap,
                      ),
                    ),
                    KeepAliveWidget(
                      child: LittersListWidget(
                        padding: AppConstants.paddingH16V28,
                        onLitterTap: onLitterTap,
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
