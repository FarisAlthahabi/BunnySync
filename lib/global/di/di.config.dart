// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:bunny_sync/features/add_breeder/cubit/add_breeder_cubit.dart'
    as _i14;
import 'package:bunny_sync/features/add_breeder/repo/add_breeder_repo.dart'
    as _i3;
import 'package:bunny_sync/features/authentication/bloc/authentication_bloc.dart'
    as _i15;
import 'package:bunny_sync/features/breeder_details/cubit/breeder_details_cubit.dart'
    as _i17;
import 'package:bunny_sync/features/breeder_details/repo/breeder_details_repo.dart'
    as _i4;
import 'package:bunny_sync/features/breeders/cubit/breeders_cubit.dart' as _i18;
import 'package:bunny_sync/features/breeders/repo/breeders_repo.dart' as _i5;
import 'package:bunny_sync/features/dashboard/cubit/dashboard_cubit.dart'
    as _i6;
import 'package:bunny_sync/features/main_navigation/cubit/main_navigation_cubit.dart'
    as _i10;
import 'package:bunny_sync/features/sign_in/cubit/sign_in_cubit.dart' as _i19;
import 'package:bunny_sync/features/sign_in/repo/sign_in_repo.dart' as _i12;
import 'package:bunny_sync/global/blocs/permissions_cubit/permissions_cubit.dart'
    as _i11;
import 'package:bunny_sync/global/di/modules/app_module.dart' as _i20;
import 'package:bunny_sync/global/dio/dio_client.dart' as _i7;
import 'package:bunny_sync/global/localization/cubit/localization_cubit.dart'
    as _i9;
import 'package:bunny_sync/global/localization/language_changer.dart' as _i8;
import 'package:bunny_sync/global/repos/repos.dart' as _i16;
import 'package:bunny_sync/global/repos/user_repo.dart' as _i13;
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
    gh.factory<_i3.AddBreederRepo>(() => _i3.HttpAddBreederRepo());
    gh.factory<_i4.BreederDetailsRepo>(() => _i4.HttpBreederDetailsRepo());
    gh.factory<_i5.BreedersRepo>(() => _i5.HttpBreedersRepo());
    gh.factory<_i6.DashboardCubit>(() => _i6.DashboardCubit());
    gh.singleton<_i7.DioClient>(() => _i7.DioClient());
    await gh.singletonAsync<_i8.LanguageChanger>(
      () {
        final i = _i8.LanguageChanger();
        return i.init().then((_) => i);
      },
      preResolve: true,
    );
    gh.factory<_i9.LocalizationCubit>(() => _i9.LocalizationCubit());
    gh.factory<_i10.MainNavigationCubit>(() => _i10.MainNavigationCubit());
    gh.factory<_i11.PermissionsCubit>(() => _i11.PermissionsCubit());
    gh.factory<_i12.SignInRepo>(() => _i12.HttpSignInRepo());
    await gh.singletonAsync<_i13.UserRepo>(
      () {
        final i = _i13.UserRepo();
        return i.init().then((_) => i);
      },
      preResolve: true,
    );
    gh.singletonAsync<bool>(() => appModule.disablePrintOnRelease());
    gh.singleton<double>(() => appModule.translations());
    gh.factory<_i14.AddBreederCubit>(
        () => _i14.AddBreederCubit(gh<_i3.AddBreederRepo>()));
    gh.singleton<_i15.AuthenticationBloc>(
        () => _i15.AuthenticationBloc(gh<_i16.UserRepo>()));
    gh.factory<_i17.BreederDetailsCubit>(
        () => _i17.BreederDetailsCubit(gh<_i4.BreederDetailsRepo>()));
    gh.factory<_i18.BreedersCubit>(
        () => _i18.BreedersCubit(gh<_i5.BreedersRepo>()));
    gh.factory<_i19.SignInCubit>(() => _i19.SignInCubit(
          gh<_i12.SignInRepo>(),
          gh<_i15.AuthenticationBloc>(),
        ));
    return this;
  }
}

class _$AppModule extends _i20.AppModule {}
