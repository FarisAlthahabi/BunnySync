// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:bunny_sync/features/authentication/bloc/authentication_bloc.dart'
    as _i11;
import 'package:bunny_sync/features/dashboard/cubit/dashboard_cubit.dart'
    as _i3;
import 'package:bunny_sync/features/main_navigation/cubit/main_navigation_cubit.dart'
    as _i7;
import 'package:bunny_sync/features/sign_in/cubit/sign_in_cubit.dart' as _i13;
import 'package:bunny_sync/features/sign_in/repo/sign_in_repo.dart' as _i9;
import 'package:bunny_sync/global/blocs/permissions_cubit/permissions_cubit.dart'
    as _i8;
import 'package:bunny_sync/global/di/modules/app_module.dart' as _i14;
import 'package:bunny_sync/global/dio/dio_client.dart' as _i4;
import 'package:bunny_sync/global/localization/cubit/localization_cubit.dart'
    as _i6;
import 'package:bunny_sync/global/localization/language_changer.dart' as _i5;
import 'package:bunny_sync/global/repos/repos.dart' as _i12;
import 'package:bunny_sync/global/repos/user_repo.dart' as _i10;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.factory<_i3.DashboardCubit>(() => _i3.DashboardCubit());
    gh.singleton<_i4.DioClient>(() => _i4.DioClient());
    await gh.singletonAsync<_i5.LanguageChanger>(
      () {
        final i = _i5.LanguageChanger();
        return i.init().then((_) => i);
      },
      preResolve: true,
    );
    gh.factory<_i6.LocalizationCubit>(() => _i6.LocalizationCubit());
    gh.factory<_i7.MainNavigationCubit>(() => _i7.MainNavigationCubit());
    gh.factory<_i8.PermissionsCubit>(() => _i8.PermissionsCubit());
    gh.factory<_i9.SignInRepo>(() => _i9.HttpSignInRepo());
    await gh.singletonAsync<_i10.UserRepo>(
      () {
        final i = _i10.UserRepo();
        return i.init().then((_) => i);
      },
      preResolve: true,
    );
    gh.singletonAsync<bool>(() => appModule.disablePrintOnRelease());
    gh.singleton<double>(() => appModule.translations());
    gh.singleton<_i11.AuthenticationBloc>(
        () => _i11.AuthenticationBloc(gh<_i12.UserRepo>()));
    gh.factory<_i13.SignInCubit>(() => _i13.SignInCubit(
          gh<_i9.SignInRepo>(),
          gh<_i11.AuthenticationBloc>(),
        ));
    return this;
  }
}

class _$AppModule extends _i14.AppModule {}
