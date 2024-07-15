// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:bunny_sync/features/add_breeder/cubit/add_breeder_cubit.dart'
    as _i15;
import 'package:bunny_sync/features/add_breeder/repo/add_breeder_repo.dart'
    as _i3;
import 'package:bunny_sync/features/authentication/bloc/authentication_bloc.dart'
    as _i16;
import 'package:bunny_sync/features/breeder_details/cubit/breeder_details_cubit.dart'
    as _i18;
import 'package:bunny_sync/features/breeder_details/repo/breeder_details_repo.dart'
    as _i4;
import 'package:bunny_sync/features/breeders/cubit/breeders_cubit.dart' as _i20;
import 'package:bunny_sync/features/breeders/models/breeder_entry_model/breeder_entry_model.dart'
    as _i19;
import 'package:bunny_sync/features/breeders/repo/breeders_repo.dart' as _i5;
import 'package:bunny_sync/features/dashboard/cubit/dashboard_cubit.dart'
    as _i6;
import 'package:bunny_sync/features/main_navigation/cubit/main_navigation_cubit.dart'
    as _i11;
import 'package:bunny_sync/features/sign_in/cubit/sign_in_cubit.dart' as _i22;
import 'package:bunny_sync/features/sign_in/repo/sign_in_repo.dart' as _i13;
import 'package:bunny_sync/global/blocs/delete_breeder_cubit/delete_breeder_cubit.dart'
    as _i21;
import 'package:bunny_sync/global/blocs/permissions_cubit/permissions_cubit.dart'
    as _i12;
import 'package:bunny_sync/global/di/modules/app_module.dart' as _i23;
import 'package:bunny_sync/global/dio/dio_client.dart' as _i8;
import 'package:bunny_sync/global/localization/cubit/localization_cubit.dart'
    as _i10;
import 'package:bunny_sync/global/localization/language_changer.dart' as _i9;
import 'package:bunny_sync/global/repos/delete_breeder_repo/delete_breeder_repo.dart'
    as _i7;
import 'package:bunny_sync/global/repos/repos.dart' as _i17;
import 'package:bunny_sync/global/repos/user_repo.dart' as _i14;
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
    gh.factory<_i7.DeleteBreederRepo>(() => _i7.HttpDeleteBreederRepo());
    gh.singleton<_i8.DioClient>(() => _i8.DioClient());
    await gh.singletonAsync<_i9.LanguageChanger>(
      () {
        final i = _i9.LanguageChanger();
        return i.init().then((_) => i);
      },
      preResolve: true,
    );
    gh.factory<_i10.LocalizationCubit>(() => _i10.LocalizationCubit());
    gh.factory<_i11.MainNavigationCubit>(() => _i11.MainNavigationCubit());
    gh.factory<_i12.PermissionsCubit>(() => _i12.PermissionsCubit());
    gh.factory<_i13.SignInRepo>(() => _i13.HttpSignInRepo());
    await gh.singletonAsync<_i14.UserRepo>(
      () {
        final i = _i14.UserRepo();
        return i.init().then((_) => i);
      },
      preResolve: true,
    );
    gh.singletonAsync<bool>(() => appModule.disablePrintOnRelease());
    gh.singleton<double>(() => appModule.translations());
    gh.factory<_i15.AddBreederCubit>(
        () => _i15.AddBreederCubit(gh<_i3.AddBreederRepo>()));
    gh.singleton<_i16.AuthenticationBloc>(
        () => _i16.AuthenticationBloc(gh<_i17.UserRepo>()));
    gh.factoryParam<_i18.BreederDetailsCubit, _i19.BreederEntryModel, dynamic>((
      breeder,
      _,
    ) =>
        _i18.BreederDetailsCubit(
          gh<_i4.BreederDetailsRepo>(),
          breeder,
        ));
    gh.factory<_i20.BreedersCubit>(
        () => _i20.BreedersCubit(gh<_i5.BreedersRepo>()));
    gh.factory<_i21.DeleteBreederCubit>(
        () => _i21.DeleteBreederCubit(gh<_i7.DeleteBreederRepo>()));
    gh.factory<_i22.SignInCubit>(() => _i22.SignInCubit(
          gh<_i13.SignInRepo>(),
          gh<_i16.AuthenticationBloc>(),
        ));
    return this;
  }
}

class _$AppModule extends _i23.AppModule {}
