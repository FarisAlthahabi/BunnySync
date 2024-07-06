import 'package:auto_route/auto_route.dart';
import 'package:bunny_sync/features/breeders/cubit/breeders_cubit.dart';
import 'package:bunny_sync/features/breeders/view/widgets/breeders_list_widget.dart';
import 'package:bunny_sync/global/di/di.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/router/router.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/custom_app_bar.dart';
import 'package:bunny_sync/global/widgets/keep_alive_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

abstract class BreedersViewCallbacks {
  void onBreederTap(int breederId);

  void onTryAgainTap();
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
  void onTryAgainTap() {
    breedersCubit.getBreeders();
  }

  @override
  void onBreederTap(int breederId) {
    context.router.push(
      BreederDetailsRoute(breederId: breederId),
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
                  if (state is BreedersFetch) {
                    return Skeletonizer.sliver(
                      enabled: state is BreedersLoading,
                      child: CustomAppBar(
                        onSearchChanged: (value) {},
                        title: 'breeders'.i18n,
                        tabs: [
                          TabModel(
                            title: 'active'.i18n,
                            indicatorValue: state.breedersStatusModel.active.length.toString(),
                          ),
                          TabModel(
                            title: 'inactive'.i18n,
                            indicatorValue: state.breedersStatusModel.inactive.length.toString(),
                          ),
                          TabModel(
                            title: 'all'.i18n,
                          ),
                        ],
                      ),
                    );
                  }
                  return const SliverToBoxAdapter(
                    child: SizedBox(),
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
                                controller: child1ScrollController,
                                breedersModel: state.breedersStatusModel.active,
                                padding: AppConstants.paddingH16V28,
                                onBreederTap: onBreederTap,
                              ),
                            ),
                            KeepAliveWidget(
                              child: BreedersListWidget(
                                controller: child2ScrollController,
                                breedersModel: state.breedersStatusModel.inactive,
                                padding: AppConstants.paddingH16V28,
                                onBreederTap: onBreederTap,
                              ),
                            ),
                            KeepAliveWidget(
                              child: BreedersListWidget(
                                controller: child3ScrollController,
                                breedersModel: state.breedersStatusModel.all,
                                padding: AppConstants.paddingH16V28,
                                onBreederTap: onBreederTap,
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
                                child:  Text("try_again".i18n),
                              ),
                            ],
                          ),
                        ),
                      );
                    } else {
                      return const Scaffold(
                        body: Center(
                          child: Text(
                            'An error has been occoured',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    }
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
