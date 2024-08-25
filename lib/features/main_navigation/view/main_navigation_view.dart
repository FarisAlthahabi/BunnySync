import 'package:auto_route/auto_route.dart';
import 'package:bunny_sync/features/main_navigation/cubit/main_navigation_cubit.dart';
import 'package:bunny_sync/global/blocs/litter_concerns_cubit/cubit/litter_concerns_cubit.dart';
import 'package:bunny_sync/global/blocs/rabbit_concerns_cubit/rabbit_concerns_cubit.dart';
import 'package:bunny_sync/global/blocs/weight_cubit/cubit/weight_cubit.dart';
import 'package:bunny_sync/global/di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class MainNavigationView extends StatelessWidget {
  const MainNavigationView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => get<MainNavigationCubit>(),
        ),
        BlocProvider(
          create: (context) => get<RabbitConcernsCubit>(),
        ),
        BlocProvider(
          create: (context) => get<LitterConcernsCubit>(),
        ),
        BlocProvider(
          create: (context) => get<WeightCubit>(),
        ),
      ],
      child: const MainNavigationPage(),
    );
  }
}

class MainNavigationPage extends StatelessWidget {
  const MainNavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<MainNavigationCubit, MainNavigationState>(
      listener: (context, state) {},
      child: const AutoRouter(),
    );
  }
}
