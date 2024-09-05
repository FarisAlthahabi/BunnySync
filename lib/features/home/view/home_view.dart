import 'package:auto_route/auto_route.dart';
import 'package:bunny_sync/features/authentication/bloc/authentication_bloc.dart';
import 'package:bunny_sync/features/home/cubit/home_cubit.dart';
import 'package:bunny_sync/features/home/view/widgets/home_tile.dart';
import 'package:bunny_sync/features/sign_in/cubit/sign_in_cubit.dart';
import 'package:bunny_sync/global/di/di.dart';
import 'package:bunny_sync/global/extensions/currency_display_x.dart';
import 'package:bunny_sync/global/extensions/date_time_x.dart';
import 'package:bunny_sync/global/gen/assets.gen.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/router/router.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/animation/indexed_grid_scale_fade_animated_tile.dart';
import 'package:bunny_sync/global/widgets/bunny_logo.dart';
import 'package:bunny_sync/global/widgets/loading_indicator.dart';
import 'package:bunny_sync/global/widgets/main_app_bar.dart';
import 'package:bunny_sync/global/widgets/main_error_widget.dart';
import 'package:bunny_sync/global/widgets/main_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:skeletonizer/skeletonizer.dart';

abstract class HomeViewCallBacks {
  void onLogOutTap();

  void onBreedersTap();

  void onLittersTap();

  void onKitsTap();

  void onFinancesTap();

  void onTryAgainTap();
}

@RoutePage()
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => get<SignInCubit>(),
        ),
        BlocProvider(
          create: (context) => get<HomeCubit>(),
        ),
      ],
      child: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> implements HomeViewCallBacks {
  late final AuthenticationBloc authenticationBloc = context.read();

  late final SignInCubit signInCubit = context.read();

  late final HomeCubit homeCubit = context.read();

  @override
  void initState() {
    super.initState();

    homeCubit.getDashboardInfo();
  }

  @override
  void onLogOutTap() {
    signInCubit.logout();
  }

  @override
  void onBreedersTap() {
    context.tabsRouter.setActiveIndex(1);
  }

  @override
  void onLittersTap() {
    context.tabsRouter.setActiveIndex(2);
  }

  @override
  void onFinancesTap() {
    context.router.push(LedgerRoute());
  }

  @override
  void onKitsTap() {
    context.router.push(LedgerRoute());
  }

  @override
  void onTryAgainTap() {
    homeCubit.getDashboardInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        leadingWith: 70,
        leading: const Center(
          child: BunnyLogo(
            size: 40,
            borderRadius: AppConstants.borderRadius12,
          ),
        ),
        actions: [
          BlocConsumer<SignInCubit, GeneralSignInState>(
            listener: (context, state) {
              if (state is LogOutSuccess) {
                MainSnackBar.showSuccessMessageBar(
                  context,
                  "logout_success".i18n,
                );
              } else if (state is SignInError) {
                MainSnackBar.showErrorMessageBar(
                  context,
                  state.message,
                );
              }
            },
            builder: (context, state) {
              if (state is SignInLoading) {
                return LoadingIndicator(
                  color: context.cs.primary,
                );
              }
              return IconButton(
                iconSize: 30,
                color: context.cs.primary,
                onPressed: onLogOutTap,
                icon: const Icon(Icons.logout_rounded),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        top: false,
        child: Padding(
          padding: AppConstants.padding16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateTime.now().formatMMDoYYYY,
              ),
              Text(
                'dashboard'.i18n,
                style: Theme.of(context).textTheme.displayLarge,
              ),
              BlocBuilder<HomeCubit, GeneralHomeState>(
                builder: (context, state) {
                  if (state is HomeFetch) {
                    final Duration duration = state is HomeLoading
                        ? Duration.zero
                        : const Duration(seconds: 1);
                    final item = state.dashboardModel;
                    final male = item.activeBreeders.maleBreedersCount;
                    final female = item.activeBreeders.femaleBreedersCount;
                    return Skeletonizer(
                      enabled: state is HomeLoading,
                      child: AnimationLimiter(
                        child: GridView.count(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          shrinkWrap: true,
                          padding: const EdgeInsets.only(top: 16),
                          children: [
                            Skeleton.shade(
                              child: IndexedGridScaleFadeAnimatedTile(
                                duration: duration,
                                onTap: onBreedersTap,
                                index: 0,
                                columnCount: 2,
                                child: HomeTile(
                                  icon: Assets.icons.gendersThin.path,
                                  title: 'active_breeders'.i18n,
                                  subtitle:
                                      '${item.activeBreeders.allBreedersCount} ${'total'.i18n}',
                                  secondSubtitle:
                                      '$male ${'bucks'.i18n} $female ${'does'.i18n}',
                                ),
                              ),
                            ),
                            Skeleton.shade(
                              child: IndexedGridScaleFadeAnimatedTile(
                                duration: duration,
                                onTap: onLittersTap,
                                index: 1,
                                columnCount: 2,
                                child: HomeTile(
                                  icon: Assets.icons.apps.path,
                                  title: 'active_litters'.i18n,
                                  subtitle:
                                      '${item.activeLitters.length} ${'total'.i18n}',
                                  secondSubtitle:
                                      '${item.kitsToDate} ${'kits'.i18n}',
                                ),
                              ),
                            ),
                            Skeleton.shade(
                              child: IndexedGridScaleFadeAnimatedTile(
                                duration: duration,
                                onTap: onKitsTap,
                                index: 2,
                                columnCount: 2,
                                child: HomeTile(
                                  icon: Assets.icons.cake.path,
                                  title:
                                      '${item.diedKits.soldKitsCount} ${'kits_born'.i18n}',
                                  subtitle: '${item.soldCount} ${'sold'.i18n}',
                                  secondSubtitle:
                                      '${item.butcherCount} ${'butchered'.i18n} ${item.diedCount} ${'died'.i18n}',
                                ),
                              ),
                            ),
                            Skeleton.shade(
                              child: IndexedGridScaleFadeAnimatedTile(
                                duration: duration,
                                onTap: onFinancesTap,
                                index: 3,
                                columnCount: 2,
                                child: HomeTile(
                                  icon: Assets.icons.roundDollar.path,
                                  title: 'monthly_finances'.i18n,
                                  subtitle:
                                      '${item.income.showAsCurrency(isSymbolAtStart: false)} ${'income'.i18n}',
                                  secondSubtitle:
                                      '${item.expense.showAsCurrency(isSymbolAtStart: false)} ${'expenses'.i18n}',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  } else if (state is HomeFail) {
                    return MainErrorWidget(
                      height: 0.5.sh,
                      error: state.message,
                      onTap: onTryAgainTap,
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
