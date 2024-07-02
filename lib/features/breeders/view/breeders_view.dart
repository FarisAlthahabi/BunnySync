import 'package:auto_route/auto_route.dart';
import 'package:bunny_sync/features/breeders/cubit/breeders_cubit.dart';
import 'package:bunny_sync/features/breeders/models/breeder_model/breeder_model.dart';
import 'package:bunny_sync/features/breeders/view/widgets/breeders_list_widget.dart';
import 'package:bunny_sync/global/di/di.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/router/router.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/custom_app_bar.dart';
import 'package:bunny_sync/global/widgets/keep_alive_widget.dart';
import 'package:bunny_sync/global/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BreedersViewCallbacks {
  void onBreederTap(BreederModel breeder);

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
  @override
  void initState() {
    breedersCubit.getBreeders();
    super.initState();
  }

  @override
  void onTryAgainTap() {
    breedersCubit.getBreeders();
  }

  @override
  void onBreederTap(BreederModel breeder) {
    context.router.push(
      BreederDetailsRoute(breeder: breeder),
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
              SliverFillRemaining(
                child: BlocBuilder<BreedersCubit, GeneralBreedersState>(
                  builder: (context, state) {
                    if (state is BreedersLoading) {
                      return const Scaffold(
                        body: Center(
                          child: LoadingIndicator(
                            color: AppColors.mainColor,
                          ),
                        ),
                      );
                    } else if (state is BreedersSuccess) {
                      return TabBarView(
                        children: [
                          KeepAliveWidget(
                            child: BreedersListWidget(
                              breedersModel: state.breedersModel,
                              padding: AppConstants.paddingH16V28,
                              onBreederTap: onBreederTap,
                            ),
                          ),
                          KeepAliveWidget(
                            child: BreedersListWidget(
                              breedersModel: state.breedersModel,
                              padding: AppConstants.paddingH16V28,
                              onBreederTap: onBreederTap,
                            ),
                          ),
                          KeepAliveWidget(
                            child: BreedersListWidget(
                              breedersModel: state.breedersModel,
                              padding: AppConstants.paddingH16V28,
                              onBreederTap: onBreederTap,
                            ),
                          ),
                        ],
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
                                child: const Text('Try again'),
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
