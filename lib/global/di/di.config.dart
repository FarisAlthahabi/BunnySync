// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:bunny_sync/features/add_ailment/cubit/add_ailment_cubit.dart'
    as _i24;
import 'package:bunny_sync/features/add_ailment/repo/add_ailment_repo.dart'
    as _i3;
import 'package:bunny_sync/features/add_breeder/cubit/add_breeder_cubit.dart'
    as _i25;
import 'package:bunny_sync/features/add_breeder/repo/add_breeder_repo.dart'
    as _i4;
import 'package:bunny_sync/features/add_category/cubit/add_category_cubit.dart'
    as _i26;
import 'package:bunny_sync/features/add_category/repo/add_category_repo.dart'
    as _i5;
import 'package:bunny_sync/features/add_litter/cubit/add_litter_cubit.dart'
    as _i27;
import 'package:bunny_sync/features/add_litter/repo/add_litter_repo.dart'
    as _i6;
import 'package:bunny_sync/features/add_note/cubit/add_note_cubit.dart' as _i28;
import 'package:bunny_sync/features/add_note/repo/add_note_repo.dart' as _i7;
import 'package:bunny_sync/features/add_treatment/cubit/add_treatment_cubit.dart'
    as _i29;
import 'package:bunny_sync/features/add_treatment/repo/add_treatment_repo.dart'
    as _i8;
import 'package:bunny_sync/features/authentication/bloc/authentication_bloc.dart'
    as _i30;
import 'package:bunny_sync/features/breeder_details/cubit/breeder_details_cubit.dart'
    as _i32;
import 'package:bunny_sync/features/breeder_details/repo/breeder_details_repo.dart'
    as _i9;
import 'package:bunny_sync/features/breeders/cubit/breeders_cubit.dart' as _i34;
import 'package:bunny_sync/features/breeders/models/breeder_entry_model/breeder_entry_model.dart'
    as _i33;
import 'package:bunny_sync/features/breeders/repo/breeders_repo.dart' as _i10;
import 'package:bunny_sync/features/categories/cubit/categories_cubit.dart'
    as _i35;
import 'package:bunny_sync/features/categories/repo/categories_repo.dart'
    as _i11;
import 'package:bunny_sync/features/dashboard/cubit/dashboard_cubit.dart'
    as _i12;
import 'package:bunny_sync/features/health/cubit/health_cubit.dart' as _i37;
import 'package:bunny_sync/features/health/repo/health_repo.dart' as _i15;
import 'package:bunny_sync/features/litter_details/cubit/litter_details_cubit.dart'
    as _i38;
import 'package:bunny_sync/features/litter_details/repo/litter_details_repo.dart'
    as _i17;
import 'package:bunny_sync/features/litters/cubit/litters_cubit.dart' as _i39;
import 'package:bunny_sync/features/litters/repo/litters_repo.dart' as _i18;
import 'package:bunny_sync/features/main_navigation/cubit/main_navigation_cubit.dart'
    as _i20;
import 'package:bunny_sync/features/sign_in/cubit/sign_in_cubit.dart' as _i40;
import 'package:bunny_sync/features/sign_in/repo/sign_in_repo.dart' as _i22;
import 'package:bunny_sync/global/blocs/delete_breeder_cubit/delete_breeder_cubit.dart'
    as _i36;
import 'package:bunny_sync/global/blocs/permissions_cubit/permissions_cubit.dart'
    as _i21;
import 'package:bunny_sync/global/di/modules/app_module.dart' as _i41;
import 'package:bunny_sync/global/dio/dio_client.dart' as _i14;
import 'package:bunny_sync/global/localization/cubit/localization_cubit.dart'
    as _i19;
import 'package:bunny_sync/global/localization/language_changer.dart' as _i16;
import 'package:bunny_sync/global/repos/delete_breeder_repo/delete_breeder_repo.dart'
    as _i13;
import 'package:bunny_sync/global/repos/repos.dart' as _i31;
import 'package:bunny_sync/global/repos/user_repo.dart' as _i23;
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
    gh.factory<_i3.AddAilmentRepo>(() => _i3.HttpAddAilmentRepo());
    gh.factory<_i4.AddBreederRepo>(() => _i4.HttpAddBreederRepo());
    gh.factory<_i5.AddCategoryRepo>(() => _i5.HttpAddCategoryRepo());
    gh.factory<_i6.AddLitterRepo>(() => _i6.HttpAddLitterRepo());
    gh.factory<_i7.AddNoteRepo>(() => _i7.HttpAddNoteRepo());
    gh.factory<_i8.AddTreatmentRepo>(() => _i8.HttpAddTreatmentRepo());
    gh.factory<_i9.BreederDetailsRepo>(() => _i9.HttpBreederDetailsRepo());
    gh.factory<_i10.BreedersRepo>(() => _i10.HttpBreedersRepo());
    gh.factory<_i11.CategoriesRepo>(() => _i11.HttpCategoriesRepo());
    gh.factory<_i12.DashboardCubit>(() => _i12.DashboardCubit());
    gh.factory<_i13.DeleteBreederRepo>(() => _i13.HttpDeleteBreederRepo());
    gh.singleton<_i14.DioClient>(() => _i14.DioClient());
    gh.factory<_i15.HealthRepo>(() => _i15.HttpHealthRepo());
    await gh.singletonAsync<_i16.LanguageChanger>(
      () {
        final i = _i16.LanguageChanger();
        return i.init().then((_) => i);
      },
      preResolve: true,
    );
    gh.factory<_i17.LitterDetailsRepo>(() => _i17.HttpLitterDetailsRepo());
    gh.factory<_i18.LittersRepo>(() => _i18.HttpLittersRepo());
    gh.factory<_i19.LocalizationCubit>(() => _i19.LocalizationCubit());
    gh.factory<_i20.MainNavigationCubit>(() => _i20.MainNavigationCubit());
    gh.factory<_i21.PermissionsCubit>(() => _i21.PermissionsCubit());
    gh.factory<_i22.SignInRepo>(() => _i22.HttpSignInRepo());
    await gh.singletonAsync<_i23.UserRepo>(
      () {
        final i = _i23.UserRepo();
        return i.init().then((_) => i);
      },
      preResolve: true,
    );
    gh.singletonAsync<bool>(() => appModule.disablePrintOnRelease());
    gh.singleton<double>(() => appModule.translations());
    gh.factory<_i24.AddAilmentCubit>(
        () => _i24.AddAilmentCubit(gh<_i3.AddAilmentRepo>()));
    gh.factory<_i25.AddBreederCubit>(
        () => _i25.AddBreederCubit(gh<_i4.AddBreederRepo>()));
    gh.factory<_i26.AddCategoryCubit>(
        () => _i26.AddCategoryCubit(gh<_i5.AddCategoryRepo>()));
    gh.factory<_i27.AddLitterCubit>(
        () => _i27.AddLitterCubit(gh<_i6.AddLitterRepo>()));
    gh.factory<_i28.AddNoteCubit>(
        () => _i28.AddNoteCubit(gh<_i7.AddNoteRepo>()));
    gh.factory<_i29.AddTreatmentCubit>(
        () => _i29.AddTreatmentCubit(gh<_i8.AddTreatmentRepo>()));
    gh.singleton<_i30.AuthenticationBloc>(
        () => _i30.AuthenticationBloc(gh<_i31.UserRepo>()));
    gh.factoryParam<_i32.BreederDetailsCubit, _i33.BreederEntryModel, dynamic>((
      breeder,
      _,
    ) =>
        _i32.BreederDetailsCubit(
          gh<_i9.BreederDetailsRepo>(),
          breeder,
        ));
    gh.factory<_i34.BreedersCubit>(
        () => _i34.BreedersCubit(gh<_i10.BreedersRepo>()));
    gh.factory<_i35.CategoriesCubit>(
        () => _i35.CategoriesCubit(gh<_i11.CategoriesRepo>()));
    gh.factory<_i36.DeleteBreederCubit>(
        () => _i36.DeleteBreederCubit(gh<_i13.DeleteBreederRepo>()));
    gh.factory<_i37.HealthCubit>(() => _i37.HealthCubit(gh<_i15.HealthRepo>()));
    gh.factory<_i38.LitterDetailsCubit>(
        () => _i38.LitterDetailsCubit(gh<_i17.LitterDetailsRepo>()));
    gh.factory<_i39.LittersCubit>(
        () => _i39.LittersCubit(gh<_i18.LittersRepo>()));
    gh.factory<_i40.SignInCubit>(() => _i40.SignInCubit(
          gh<_i22.SignInRepo>(),
          gh<_i30.AuthenticationBloc>(),
        ));
    return this;
  }
}

class _$AppModule extends _i41.AppModule {}
