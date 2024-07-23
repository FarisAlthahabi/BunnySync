// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:bunny_sync/features/add_breeder/cubit/add_breeder_cubit.dart'
    as _i19;
import 'package:bunny_sync/features/add_breeder/repo/add_breeder_repo.dart'
    as _i3;
import 'package:bunny_sync/features/add_litter/cubit/add_litter_cubit.dart'
    as _i20;
import 'package:bunny_sync/features/add_litter/repo/add_litter_repo.dart'
    as _i4;
import 'package:bunny_sync/features/add_note/cubit/add_note_cubit.dart' as _i21;
import 'package:bunny_sync/features/add_note/repo/add_note_repo.dart' as _i5;
import 'package:bunny_sync/features/authentication/bloc/authentication_bloc.dart'
    as _i22;
import 'package:bunny_sync/features/breeder_details/cubit/breeder_details_cubit.dart'
    as _i24;
import 'package:bunny_sync/features/breeder_details/repo/breeder_details_repo.dart'
    as _i6;
import 'package:bunny_sync/features/breeders/cubit/breeders_cubit.dart' as _i26;
import 'package:bunny_sync/features/breeders/models/breeder_entry_model/breeder_entry_model.dart'
    as _i25;
import 'package:bunny_sync/features/breeders/repo/breeders_repo.dart' as _i7;
import 'package:bunny_sync/features/dashboard/cubit/dashboard_cubit.dart'
    as _i8;
import 'package:bunny_sync/features/litter_details/cubit/litter_details_cubit.dart'
    as _i28;
import 'package:bunny_sync/features/litter_details/repo/litter_details_repo.dart'
    as _i12;
import 'package:bunny_sync/features/litters/cubit/litters_cubit.dart' as _i29;
import 'package:bunny_sync/features/litters/repo/litters_repo.dart' as _i13;
import 'package:bunny_sync/features/main_navigation/cubit/main_navigation_cubit.dart'
    as _i15;
import 'package:bunny_sync/features/sign_in/cubit/sign_in_cubit.dart' as _i30;
import 'package:bunny_sync/features/sign_in/repo/sign_in_repo.dart' as _i17;
import 'package:bunny_sync/global/blocs/delete_breeder_cubit/delete_breeder_cubit.dart'
    as _i27;
import 'package:bunny_sync/global/blocs/permissions_cubit/permissions_cubit.dart'
    as _i16;
import 'package:bunny_sync/global/di/modules/app_module.dart' as _i31;
import 'package:bunny_sync/global/dio/dio_client.dart' as _i10;
import 'package:bunny_sync/global/localization/cubit/localization_cubit.dart'
    as _i14;
import 'package:bunny_sync/global/localization/language_changer.dart' as _i11;
import 'package:bunny_sync/global/repos/delete_breeder_repo/delete_breeder_repo.dart'
    as _i9;
import 'package:bunny_sync/global/repos/repos.dart' as _i23;
import 'package:bunny_sync/global/repos/user_repo.dart' as _i18;
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
    gh.factory<_i5.AddNoteRepo>(() => _i5.HttpAddNoteRepo());
    gh.factory<_i6.BreederDetailsRepo>(() => _i6.HttpBreederDetailsRepo());
    gh.factory<_i7.BreedersRepo>(() => _i7.HttpBreedersRepo());
    gh.factory<_i8.DashboardCubit>(() => _i8.DashboardCubit());
    gh.factory<_i9.DeleteBreederRepo>(() => _i9.HttpDeleteBreederRepo());
    gh.singleton<_i10.DioClient>(() => _i10.DioClient());
    await gh.singletonAsync<_i11.LanguageChanger>(
      () {
        final i = _i11.LanguageChanger();
        return i.init().then((_) => i);
      },
      preResolve: true,
    );
    gh.factory<_i12.LitterDetailsRepo>(() => _i12.HttpLitterDetailsRepo());
    gh.factory<_i13.LittersRepo>(() => _i13.HttpLittersRepo());
    gh.factory<_i14.LocalizationCubit>(() => _i14.LocalizationCubit());
    gh.factory<_i15.MainNavigationCubit>(() => _i15.MainNavigationCubit());
    gh.factory<_i16.PermissionsCubit>(() => _i16.PermissionsCubit());
    gh.factory<_i17.SignInRepo>(() => _i17.HttpSignInRepo());
    await gh.singletonAsync<_i18.UserRepo>(
      () {
        final i = _i18.UserRepo();
        return i.init().then((_) => i);
      },
      preResolve: true,
    );
    gh.singletonAsync<bool>(() => appModule.disablePrintOnRelease());
    gh.singleton<double>(() => appModule.translations());
    gh.factory<_i19.AddBreederCubit>(
        () => _i19.AddBreederCubit(gh<_i3.AddBreederRepo>()));
    gh.factory<_i20.AddLitterCubit>(
        () => _i20.AddLitterCubit(gh<_i4.AddLitterRepo>()));
    gh.factory<_i21.AddNoteCubit>(
        () => _i21.AddNoteCubit(gh<_i5.AddNoteRepo>()));
    gh.singleton<_i22.AuthenticationBloc>(
        () => _i22.AuthenticationBloc(gh<_i23.UserRepo>()));
    gh.factoryParam<_i24.BreederDetailsCubit, _i25.BreederEntryModel, dynamic>((
      breeder,
      _,
    ) =>
        _i24.BreederDetailsCubit(
          gh<_i6.BreederDetailsRepo>(),
          breeder,
        ));
    gh.factory<_i26.BreedersCubit>(
        () => _i26.BreedersCubit(gh<_i7.BreedersRepo>()));
    gh.factory<_i27.DeleteBreederCubit>(
        () => _i27.DeleteBreederCubit(gh<_i9.DeleteBreederRepo>()));
    gh.factory<_i28.LitterDetailsCubit>(
        () => _i28.LitterDetailsCubit(gh<_i12.LitterDetailsRepo>()));
    gh.factory<_i29.LittersCubit>(
        () => _i29.LittersCubit(gh<_i13.LittersRepo>()));
    gh.factory<_i30.SignInCubit>(() => _i30.SignInCubit(
          gh<_i17.SignInRepo>(),
          gh<_i22.AuthenticationBloc>(),
        ));
    return this;
  }
}

class _$AppModule extends _i31.AppModule {}
