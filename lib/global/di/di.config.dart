// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:bunny_sync/features/add_breeder/cubit/add_breeder_cubit.dart'
    as _i22;
import 'package:bunny_sync/features/add_breeder/repo/add_breeder_repo.dart'
    as _i3;
import 'package:bunny_sync/features/add_category/cubit/add_category_cubit.dart'
    as _i23;
import 'package:bunny_sync/features/add_category/repo/add_category_repo.dart'
    as _i4;
import 'package:bunny_sync/features/add_litter/cubit/add_litter_cubit.dart'
    as _i24;
import 'package:bunny_sync/features/add_litter/repo/add_litter_repo.dart'
    as _i5;
import 'package:bunny_sync/features/add_note/cubit/add_note_cubit.dart' as _i25;
import 'package:bunny_sync/features/add_note/repo/add_note_repo.dart' as _i6;
import 'package:bunny_sync/features/authentication/bloc/authentication_bloc.dart'
    as _i26;
import 'package:bunny_sync/features/breeder_details/cubit/breeder_details_cubit.dart'
    as _i28;
import 'package:bunny_sync/features/breeder_details/repo/breeder_details_repo.dart'
    as _i7;
import 'package:bunny_sync/features/breeders/cubit/breeders_cubit.dart' as _i30;
import 'package:bunny_sync/features/breeders/models/breeder_entry_model/breeder_entry_model.dart'
    as _i29;
import 'package:bunny_sync/features/breeders/repo/breeders_repo.dart' as _i8;
import 'package:bunny_sync/features/categories/cubit/categories_cubit.dart'
    as _i31;
import 'package:bunny_sync/features/categories/repo/categories_repo.dart'
    as _i9;
import 'package:bunny_sync/features/dashboard/cubit/dashboard_cubit.dart'
    as _i10;
import 'package:bunny_sync/features/litter_details/cubit/litter_details_cubit.dart'
    as _i33;
import 'package:bunny_sync/features/litter_details/repo/litter_details_repo.dart'
    as _i14;
import 'package:bunny_sync/features/litters/cubit/litters_cubit.dart' as _i34;
import 'package:bunny_sync/features/litters/repo/litters_repo.dart' as _i15;
import 'package:bunny_sync/features/main_navigation/cubit/main_navigation_cubit.dart'
    as _i17;
import 'package:bunny_sync/features/profile/cubit/profile_cubit.dart' as _i35;
import 'package:bunny_sync/features/profile/repo/profile_repo.dart' as _i19;
import 'package:bunny_sync/features/sign_in/cubit/sign_in_cubit.dart' as _i36;
import 'package:bunny_sync/features/sign_in/repo/sign_in_repo.dart' as _i20;
import 'package:bunny_sync/global/blocs/delete_breeder_cubit/delete_breeder_cubit.dart'
    as _i32;
import 'package:bunny_sync/global/blocs/permissions_cubit/permissions_cubit.dart'
    as _i18;
import 'package:bunny_sync/global/di/modules/app_module.dart' as _i37;
import 'package:bunny_sync/global/dio/dio_client.dart' as _i12;
import 'package:bunny_sync/global/localization/cubit/localization_cubit.dart'
    as _i16;
import 'package:bunny_sync/global/localization/language_changer.dart' as _i13;
import 'package:bunny_sync/global/repos/delete_breeder_repo/delete_breeder_repo.dart'
    as _i11;
import 'package:bunny_sync/global/repos/repos.dart' as _i27;
import 'package:bunny_sync/global/repos/user_repo.dart' as _i21;
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
    gh.factory<_i4.AddCategoryRepo>(() => _i4.HttpAddCategoryRepo());
    gh.factory<_i5.AddLitterRepo>(() => _i5.HttpAddLitterRepo());
    gh.factory<_i6.AddNoteRepo>(() => _i6.HttpAddNoteRepo());
    gh.factory<_i7.BreederDetailsRepo>(() => _i7.HttpBreederDetailsRepo());
    gh.factory<_i8.BreedersRepo>(() => _i8.HttpBreedersRepo());
    gh.factory<_i9.CategoriesRepo>(() => _i9.HttpCategoriesRepo());
    gh.factory<_i10.DashboardCubit>(() => _i10.DashboardCubit());
    gh.factory<_i11.DeleteBreederRepo>(() => _i11.HttpDeleteBreederRepo());
    gh.singleton<_i12.DioClient>(() => _i12.DioClient());
    await gh.singletonAsync<_i13.LanguageChanger>(
      () {
        final i = _i13.LanguageChanger();
        return i.init().then((_) => i);
      },
      preResolve: true,
    );
    gh.factory<_i14.LitterDetailsRepo>(() => _i14.HttpLitterDetailsRepo());
    gh.factory<_i15.LittersRepo>(() => _i15.HttpLittersRepo());
    gh.factory<_i16.LocalizationCubit>(() => _i16.LocalizationCubit());
    gh.factory<_i17.MainNavigationCubit>(() => _i17.MainNavigationCubit());
    gh.factory<_i18.PermissionsCubit>(() => _i18.PermissionsCubit());
    gh.factory<_i19.ProfileRepo>(() => _i19.HttpProfileRepo());
    gh.factory<_i20.SignInRepo>(() => _i20.HttpSignInRepo());
    await gh.singletonAsync<_i21.UserRepo>(
      () {
        final i = _i21.UserRepo();
        return i.init().then((_) => i);
      },
      preResolve: true,
    );
    gh.singletonAsync<bool>(() => appModule.disablePrintOnRelease());
    gh.singleton<double>(() => appModule.translations());
    gh.factory<_i22.AddBreederCubit>(
        () => _i22.AddBreederCubit(gh<_i3.AddBreederRepo>()));
    gh.factory<_i23.AddCategoryCubit>(
        () => _i23.AddCategoryCubit(gh<_i4.AddCategoryRepo>()));
    gh.factory<_i24.AddLitterCubit>(
        () => _i24.AddLitterCubit(gh<_i5.AddLitterRepo>()));
    gh.factory<_i25.AddNoteCubit>(
        () => _i25.AddNoteCubit(gh<_i6.AddNoteRepo>()));
    gh.singleton<_i26.AuthenticationBloc>(
        () => _i26.AuthenticationBloc(gh<_i27.UserRepo>()));
    gh.factoryParam<_i28.BreederDetailsCubit, _i29.BreederEntryModel, dynamic>((
      breeder,
      _,
    ) =>
        _i28.BreederDetailsCubit(
          gh<_i7.BreederDetailsRepo>(),
          breeder,
        ));
    gh.factory<_i30.BreedersCubit>(
        () => _i30.BreedersCubit(gh<_i8.BreedersRepo>()));
    gh.factory<_i31.CategoriesCubit>(
        () => _i31.CategoriesCubit(gh<_i9.CategoriesRepo>()));
    gh.factory<_i32.DeleteBreederCubit>(
        () => _i32.DeleteBreederCubit(gh<_i11.DeleteBreederRepo>()));
    gh.factory<_i33.LitterDetailsCubit>(
        () => _i33.LitterDetailsCubit(gh<_i14.LitterDetailsRepo>()));
    gh.factory<_i34.LittersCubit>(
        () => _i34.LittersCubit(gh<_i15.LittersRepo>()));
    gh.factory<_i35.ProfileCubit>(
        () => _i35.ProfileCubit(gh<_i19.ProfileRepo>()));
    gh.factory<_i36.SignInCubit>(() => _i36.SignInCubit(
          gh<_i20.SignInRepo>(),
          gh<_i26.AuthenticationBloc>(),
        ));
    return this;
  }
}

class _$AppModule extends _i37.AppModule {}
