// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:bunny_sync/features/add_breeder/cubit/add_breeder_cubit.dart'
    as _i18;
import 'package:bunny_sync/features/add_breeder/repo/add_breeder_repo.dart'
    as _i3;
import 'package:bunny_sync/features/add_litter/cubit/add_litter_cubit.dart'
    as _i19;
import 'package:bunny_sync/features/add_litter/repo/add_litter_repo.dart'
    as _i4;
import 'package:bunny_sync/features/authentication/bloc/authentication_bloc.dart'
    as _i20;
import 'package:bunny_sync/features/breeder_details/cubit/breeder_details_cubit.dart'
    as _i22;
import 'package:bunny_sync/features/breeder_details/repo/breeder_details_repo.dart'
    as _i5;
import 'package:bunny_sync/features/breeders/cubit/breeders_cubit.dart' as _i24;
import 'package:bunny_sync/features/breeders/models/breeder_entry_model/breeder_entry_model.dart'
    as _i23;
import 'package:bunny_sync/features/breeders/repo/breeders_repo.dart' as _i6;
import 'package:bunny_sync/features/dashboard/cubit/dashboard_cubit.dart'
    as _i7;
import 'package:bunny_sync/features/litter_details/repo/litter_details_repo.dart'
    as _i11;
import 'package:bunny_sync/features/litters/cubit/litters_cubit.dart' as _i26;
import 'package:bunny_sync/features/litters/repo/litters_repo.dart' as _i12;
import 'package:bunny_sync/features/main_navigation/cubit/main_navigation_cubit.dart'
    as _i14;
import 'package:bunny_sync/features/sign_in/cubit/sign_in_cubit.dart' as _i27;
import 'package:bunny_sync/features/sign_in/repo/sign_in_repo.dart' as _i16;
import 'package:bunny_sync/global/blocs/delete_breeder_cubit/delete_breeder_cubit.dart'
    as _i25;
import 'package:bunny_sync/global/blocs/permissions_cubit/permissions_cubit.dart'
    as _i15;
import 'package:bunny_sync/global/di/modules/app_module.dart' as _i28;
import 'package:bunny_sync/global/dio/dio_client.dart' as _i9;
import 'package:bunny_sync/global/localization/cubit/localization_cubit.dart'
    as _i13;
import 'package:bunny_sync/global/localization/language_changer.dart' as _i10;
import 'package:bunny_sync/global/repos/delete_breeder_repo/delete_breeder_repo.dart'
    as _i8;
import 'package:bunny_sync/global/repos/repos.dart' as _i21;
import 'package:bunny_sync/global/repos/user_repo.dart' as _i17;
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
    gh.factory<_i4.AddLitterRepo>(() => _i4.HttpAddLitterRepo());
    gh.factory<_i5.BreederDetailsRepo>(() => _i5.HttpBreederDetailsRepo());
    gh.factory<_i6.BreedersRepo>(() => _i6.HttpBreedersRepo());
    gh.factory<_i7.DashboardCubit>(() => _i7.DashboardCubit());
    gh.factory<_i8.DeleteBreederRepo>(() => _i8.HttpDeleteBreederRepo());
    gh.singleton<_i9.DioClient>(() => _i9.DioClient());
    await gh.singletonAsync<_i10.LanguageChanger>(
      () {
        final i = _i10.LanguageChanger();
        return i.init().then((_) => i);
      },
      preResolve: true,
    );
    gh.factory<_i11.LitterDetailsRepo>(() => _i11.HttpLitterDetailsRepo());
    gh.factory<_i12.LittersRepo>(() => _i12.HttpLittersRepo());
    gh.factory<_i13.LocalizationCubit>(() => _i13.LocalizationCubit());
    gh.factory<_i14.MainNavigationCubit>(() => _i14.MainNavigationCubit());
    gh.factory<_i15.PermissionsCubit>(() => _i15.PermissionsCubit());
    gh.factory<_i16.SignInRepo>(() => _i16.HttpSignInRepo());
    await gh.singletonAsync<_i17.UserRepo>(
      () {
        final i = _i17.UserRepo();
        return i.init().then((_) => i);
      },
      preResolve: true,
    );
    gh.singletonAsync<bool>(() => appModule.disablePrintOnRelease());
    gh.singleton<double>(() => appModule.translations());
    gh.factory<_i18.AddBreederCubit>(
        () => _i18.AddBreederCubit(gh<_i3.AddBreederRepo>()));
    gh.factory<_i19.AddLitterCubit>(
        () => _i19.AddLitterCubit(gh<_i4.AddLitterRepo>()));
    gh.singleton<_i20.AuthenticationBloc>(
        () => _i20.AuthenticationBloc(gh<_i21.UserRepo>()));
    gh.factoryParam<_i22.BreederDetailsCubit, _i23.BreederEntryModel, dynamic>((
      breeder,
      _,
    ) =>
        _i22.BreederDetailsCubit(
          gh<_i5.BreederDetailsRepo>(),
          breeder,
        ));
    gh.factory<_i24.BreedersCubit>(
        () => _i24.BreedersCubit(gh<_i6.BreedersRepo>()));
    gh.factory<_i25.DeleteBreederCubit>(
        () => _i25.DeleteBreederCubit(gh<_i8.DeleteBreederRepo>()));
    gh.factory<_i26.LittersCubit>(
        () => _i26.LittersCubit(gh<_i12.LittersRepo>()));
    gh.factory<_i27.SignInCubit>(() => _i27.SignInCubit(
          gh<_i16.SignInRepo>(),
          gh<_i20.AuthenticationBloc>(),
        ));
    return this;
  }
}

class _$AppModule extends _i28.AppModule {}
