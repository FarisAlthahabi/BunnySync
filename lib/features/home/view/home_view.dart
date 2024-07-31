import 'package:auto_route/auto_route.dart';
import 'package:bunny_sync/features/authentication/bloc/authentication_bloc.dart';
import 'package:bunny_sync/features/home/view/widgets/home_tile.dart';
import 'package:bunny_sync/features/sign_in/cubit/sign_in_cubit.dart';
import 'package:bunny_sync/global/di/di.dart';
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
import 'package:bunny_sync/global/widgets/main_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

abstract class HomeViewCallBacks {
  void onLogOutTap();

  void onBreedersTap();

  void onLittersTap();

  void onKitsTap();

  void onFinancesTap();
}

@RoutePage()
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => get<SignInCubit>(),
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
    context.router.push(const LedgerRoute());
  }

  @override
  void onKitsTap() {
    context.router.push(const LedgerRoute());
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
                color: AppColors.mainColor,
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
              AnimationLimiter(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(top: 16),
                  children: [
                    IndexedGridScaleFadeAnimatedTile(
                      onTap: onBreedersTap,
                      index: 0,
                      columnCount: 2,
                      child: HomeTile(
                        icon: Assets.icons.gendersThin.path,
                        title: 'active_breeders'.i18n,
                        subtitle: 'total'.i18n,
                        secondSubtitle: '11 ${'does'.i18n} 5 ${'bucks'.i18n}',
                      ),
                    ),
                    IndexedGridScaleFadeAnimatedTile(
                      onTap: onLittersTap,
                      index: 1,
                      columnCount: 2,
                      child: HomeTile(
                        icon: Assets.icons.apps.path,
                        title: 'active_litters'.i18n,
                        subtitle: 'total'.i18n,
                        secondSubtitle: '12 ${'kits'.i18n}',
                      ),
                    ),
                    IndexedGridScaleFadeAnimatedTile(
                      onTap: onKitsTap,
                      index: 2,
                      columnCount: 2,
                      child: HomeTile(
                        icon: Assets.icons.cake.path,
                        title: 'kits_born'.i18n,
                        subtitle: 'sold'.i18n,
                        secondSubtitle:
                            '11 ${'butchered'.i18n} 5 ${'died'.i18n}',
                      ),
                    ),
                    IndexedGridScaleFadeAnimatedTile(
                      onTap: onFinancesTap,
                      index: 3,
                      columnCount: 2,
                      child: HomeTile(
                        icon: Assets.icons.roundDollar.path,
                        title: 'monthly_finances'.i18n,
                        subtitle: 'income'.i18n,
                        secondSubtitle: '90\$ ${'expenses'.i18n}',
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
