import 'package:bunny_sync/features/app/view/bunny_sync_material_app.dart';
import 'package:bunny_sync/features/authentication/bloc/authentication_bloc.dart';
import 'package:bunny_sync/global/blocs/blocs.dart';
import 'package:bunny_sync/global/di/di.dart';
import 'package:bunny_sync/global/repos/repos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BunnySyncApp extends StatelessWidget {
  const BunnySyncApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (_) => get<UserRepo>(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => get<AuthenticationBloc>(),
          ),
          BlocProvider(
            create: (_) => get<PermissionsCubit>(),
          ),
        ],
        child: const BunnySyncMaterialApp(),
      ),
    );
  }
}
