import 'package:auto_route/auto_route.dart';
import 'package:bunny_sync/features/litters/cubit/litters_cubit.dart';
import 'package:bunny_sync/features/litters/models/litter_entry_model/litter_entry_model.dart';
import 'package:bunny_sync/features/litters/view/widgets/litters_list_widget.dart';
import 'package:bunny_sync/global/di/di.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/router/router.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/custom_app_bar.dart';
import 'package:bunny_sync/global/widgets/keep_alive_widget.dart';
import 'package:bunny_sync/global/widgets/main_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

abstract class LittersViewCallbacks {
  void onLitterTap(LitterEntryModel breeder);

  void onOptionsTap();

  void onTryAgainTap();
}

@RoutePage()
class LittersView extends StatelessWidget {
  const LittersView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => get<LittersCubit>(),
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
    implements LittersViewCallbacks {
  late final LittersCubit littersCubit = context.read();

  @override
  void initState() {
    super.initState();

    littersCubit.getLitters();
  }

  @override
  void onLitterTap(LitterEntryModel litter) {
    context.router.push(
      LitterDetailsRoute(litter: litter),
    );
  }

  @override
  void onTryAgainTap() {
    littersCubit.getLitters();
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
                  return const SizedBox.shrink();
                },
              ),
              SliverFillRemaining(
                child: BlocBuilder<LittersCubit, GeneralLittersState>(
                  builder: (context, state) {
                    if (state is LittersFetch) {
                      return Skeletonizer(
                        enabled: state is LittersLoading,
                        child: TabBarView(
                          children: [
                            KeepAliveWidget(
                              child: LittersListWidget(
                                litters: state.littersStatusModel.active,
                                padding: AppConstants.paddingH16V28,
                                onLitterTap: onLitterTap,
                              ),
                            ),
                            KeepAliveWidget(
                              child: LittersListWidget(
                                litters: state.littersStatusModel.inactive,
                                padding: AppConstants.paddingH16V28,
                                onLitterTap: onLitterTap,
                              ),
                            ),
                            KeepAliveWidget(
                              child: LittersListWidget(
                                litters: state.littersStatusModel.all,
                                padding: AppConstants.paddingH16V28,
                                onLitterTap: onLitterTap,
                              ),
                            ),
                          ],
                        ),
                      );
                    } else if (state is LittersEmpty) {
                      return MainErrorWidget(error: state.message);
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
