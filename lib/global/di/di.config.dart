// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:bunny_sync/features/add_ailment/cubit/add_ailment_cubit.dart'
    as _i33;
import 'package:bunny_sync/features/add_ailment/repo/add_ailment_repo.dart'
    as _i3;
import 'package:bunny_sync/features/add_breeder/cubit/add_breeder_cubit.dart'
    as _i34;
import 'package:bunny_sync/features/add_breeder/repo/add_breeder_repo.dart'
    as _i4;
import 'package:bunny_sync/features/add_category/cubit/add_category_cubit.dart'
    as _i35;
import 'package:bunny_sync/features/add_category/repo/add_category_repo.dart'
    as _i5;
import 'package:bunny_sync/features/add_customer/cubit/add_customer_cubit.dart'
    as _i36;
import 'package:bunny_sync/features/add_customer/repo/add_customer_repo.dart'
    as _i6;
import 'package:bunny_sync/features/add_ledger/cubit/add_ledger_cubit.dart'
    as _i37;
import 'package:bunny_sync/features/add_ledger/repo/add_ledger_repo.dart'
    as _i7;
import 'package:bunny_sync/features/add_litter/cubit/add_litter_cubit.dart'
    as _i38;
import 'package:bunny_sync/features/add_litter/repo/add_litter_repo.dart'
    as _i8;
import 'package:bunny_sync/features/add_note/cubit/add_note_cubit.dart' as _i39;
import 'package:bunny_sync/features/add_note/repo/add_note_repo.dart' as _i9;
import 'package:bunny_sync/features/add_task/cubit/add_task_cubit.dart' as _i40;
import 'package:bunny_sync/features/add_task/repo/add_task_repo.dart' as _i10;
import 'package:bunny_sync/features/add_treatment/cubit/add_treatment_cubit.dart'
    as _i41;
import 'package:bunny_sync/features/add_treatment/repo/add_treatment_repo.dart'
    as _i11;
import 'package:bunny_sync/features/authentication/bloc/authentication_bloc.dart'
    as _i42;
import 'package:bunny_sync/features/breeder_details/cubit/breeder_details_cubit.dart'
    as _i44;
import 'package:bunny_sync/features/breeder_details/repo/breeder_details_repo.dart'
    as _i12;
import 'package:bunny_sync/features/breeders/cubit/breeders_cubit.dart' as _i46;
import 'package:bunny_sync/features/breeders/models/breeder_entry_model/breeder_entry_model.dart'
    as _i45;
import 'package:bunny_sync/features/breeders/repo/breeders_repo.dart' as _i13;
import 'package:bunny_sync/features/categories/cubit/categories_cubit.dart'
    as _i47;
import 'package:bunny_sync/features/categories/repo/categories_repo.dart'
    as _i14;
import 'package:bunny_sync/features/customers/cubit/customers_cubit.dart'
    as _i48;
import 'package:bunny_sync/features/customers/repo/customers_repo.dart' as _i15;
import 'package:bunny_sync/features/dashboard/cubit/dashboard_cubit.dart'
    as _i16;
import 'package:bunny_sync/features/health/cubit/health_cubit.dart' as _i50;
import 'package:bunny_sync/features/health/repo/health_repo.dart' as _i19;
import 'package:bunny_sync/features/home/cubit/home_cubit.dart' as _i51;
import 'package:bunny_sync/features/home/repo/repo/home_repo.dart' as _i20;
import 'package:bunny_sync/features/ledger/cubit/ledgers_cubit.dart' as _i52;
import 'package:bunny_sync/features/ledger/repo/ledgers_repo.dart' as _i22;
import 'package:bunny_sync/features/litter_details/cubit/litter_details_cubit.dart'
    as _i53;
import 'package:bunny_sync/features/litter_details/repo/litter_details_repo.dart'
    as _i23;
import 'package:bunny_sync/features/litters/cubit/litters_cubit.dart' as _i54;
import 'package:bunny_sync/features/litters/repo/litters_repo.dart' as _i24;
import 'package:bunny_sync/features/main_navigation/cubit/main_navigation_cubit.dart'
    as _i26;
import 'package:bunny_sync/features/profile/cubit/profile_cubit.dart' as _i55;
import 'package:bunny_sync/features/profile/repo/profile_repo.dart' as _i28;
import 'package:bunny_sync/features/sign_in/cubit/sign_in_cubit.dart' as _i56;
import 'package:bunny_sync/features/sign_in/repo/sign_in_repo.dart' as _i29;
import 'package:bunny_sync/features/tasks/cubit/tasks_cubit.dart' as _i57;
import 'package:bunny_sync/features/tasks/repo/tasks_repo.dart' as _i30;
import 'package:bunny_sync/global/blocs/delete_breeder_cubit/delete_breeder_cubit.dart'
    as _i49;
import 'package:bunny_sync/global/blocs/permissions_cubit/permissions_cubit.dart'
    as _i27;
import 'package:bunny_sync/global/blocs/upload_file_cubit/upload_file_cubit.dart'
    as _i31;
import 'package:bunny_sync/global/di/modules/app_module.dart' as _i58;
import 'package:bunny_sync/global/dio/dio_client.dart' as _i18;
import 'package:bunny_sync/global/localization/cubit/localization_cubit.dart'
    as _i25;
import 'package:bunny_sync/global/localization/language_changer.dart' as _i21;
import 'package:bunny_sync/global/repos/delete_breeder_repo/delete_breeder_repo.dart'
    as _i17;
import 'package:bunny_sync/global/repos/repos.dart' as _i43;
import 'package:bunny_sync/global/repos/user_repo.dart' as _i32;
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
    gh.factory<_i6.AddCustomerRepo>(() => _i6.HttpAddCustomerRepo());
    gh.factory<_i7.AddLedgerRepo>(() => _i7.HttpAddLedgerRepo());
    gh.factory<_i8.AddLitterRepo>(() => _i8.HttpAddLitterRepo());
    gh.factory<_i9.AddNoteRepo>(() => _i9.HttpAddNoteRepo());
    gh.factory<_i10.AddTaskRepo>(() => _i10.HttpAddTaskRepo());
    gh.factory<_i11.AddTreatmentRepo>(() => _i11.HttpAddTreatmentRepo());
    gh.factory<_i12.BreederDetailsRepo>(() => _i12.HttpBreederDetailsRepo());
    gh.factory<_i13.BreedersRepo>(() => _i13.HttpBreedersRepo());
    gh.factory<_i14.CategoriesRepo>(() => _i14.HttpCategoriesRepo());
    gh.factory<_i15.CustomersRepo>(() => _i15.HttpCustomersRepo());
    gh.factory<_i16.DashboardCubit>(() => _i16.DashboardCubit());
    gh.factory<_i17.DeleteBreederRepo>(() => _i17.HttpDeleteBreederRepo());
    gh.singleton<_i18.DioClient>(() => _i18.DioClient());
    gh.factory<_i19.HealthRepo>(() => _i19.HttpHealthRepo());
    gh.factory<_i20.HomeRepo>(() => _i20.HttpHomeRepo());
    await gh.singletonAsync<_i21.LanguageChanger>(
      () {
        final i = _i21.LanguageChanger();
        return i.init().then((_) => i);
      },
      preResolve: true,
    );
    gh.factory<_i22.LedgersRepo>(() => _i22.HttpLedgersRepo());
    gh.factory<_i23.LitterDetailsRepo>(() => _i23.HttpLitterDetailsRepo());
    gh.factory<_i24.LittersRepo>(() => _i24.HttpLittersRepo());
    gh.factory<_i25.LocalizationCubit>(() => _i25.LocalizationCubit());
    gh.factory<_i26.MainNavigationCubit>(() => _i26.MainNavigationCubit());
    gh.factory<_i27.PermissionsCubit>(() => _i27.PermissionsCubit());
    gh.factory<_i28.ProfileRepo>(() => _i28.HttpProfileRepo());
    gh.factory<_i29.SignInRepo>(() => _i29.HttpSignInRepo());
    gh.factory<_i30.TasksRepo>(() => _i30.HttpTasksRepo());
    gh.factory<_i31.UploadFileCubit>(() => _i31.UploadFileCubit());
    await gh.singletonAsync<_i32.UserRepo>(
      () {
        final i = _i32.UserRepo();
        return i.init().then((_) => i);
      },
      preResolve: true,
    );
    gh.singletonAsync<bool>(() => appModule.disablePrintOnRelease());
    gh.singleton<double>(() => appModule.translations());
    gh.factory<_i33.AddAilmentCubit>(
        () => _i33.AddAilmentCubit(gh<_i3.AddAilmentRepo>()));
    gh.factory<_i34.AddBreederCubit>(
        () => _i34.AddBreederCubit(gh<_i4.AddBreederRepo>()));
    gh.factory<_i35.AddCategoryCubit>(
        () => _i35.AddCategoryCubit(gh<_i5.AddCategoryRepo>()));
    gh.factory<_i36.AddCustomerCubit>(
        () => _i36.AddCustomerCubit(gh<_i6.AddCustomerRepo>()));
    gh.factory<_i37.AddLedgerCubit>(
        () => _i37.AddLedgerCubit(gh<_i7.AddLedgerRepo>()));
    gh.factory<_i38.AddLitterCubit>(
        () => _i38.AddLitterCubit(gh<_i8.AddLitterRepo>()));
    gh.factory<_i39.AddNoteCubit>(
        () => _i39.AddNoteCubit(gh<_i9.AddNoteRepo>()));
    gh.factory<_i40.AddTaskCubit>(
        () => _i40.AddTaskCubit(gh<_i10.AddTaskRepo>()));
    gh.factory<_i41.AddTreatmentCubit>(
        () => _i41.AddTreatmentCubit(gh<_i11.AddTreatmentRepo>()));
    gh.singleton<_i42.AuthenticationBloc>(
        () => _i42.AuthenticationBloc(gh<_i43.UserRepo>()));
    gh.factoryParam<_i44.BreederDetailsCubit, _i45.BreederEntryModel, dynamic>((
      breeder,
      _,
    ) =>
        _i44.BreederDetailsCubit(
          gh<_i12.BreederDetailsRepo>(),
          breeder,
        ));
    gh.factory<_i46.BreedersCubit>(
        () => _i46.BreedersCubit(gh<_i13.BreedersRepo>()));
    gh.factory<_i47.CategoriesCubit>(
        () => _i47.CategoriesCubit(gh<_i14.CategoriesRepo>()));
    gh.factory<_i48.CustomersCubit>(
        () => _i48.CustomersCubit(gh<_i15.CustomersRepo>()));
    gh.factory<_i49.DeleteBreederCubit>(
        () => _i49.DeleteBreederCubit(gh<_i17.DeleteBreederRepo>()));
    gh.factory<_i50.HealthCubit>(() => _i50.HealthCubit(gh<_i19.HealthRepo>()));
    gh.factory<_i51.HomeCubit>(() => _i51.HomeCubit(gh<_i20.HomeRepo>()));
    gh.factory<_i52.LedgersCubit>(
        () => _i52.LedgersCubit(gh<_i22.LedgersRepo>()));
    gh.factory<_i53.LitterDetailsCubit>(
        () => _i53.LitterDetailsCubit(gh<_i23.LitterDetailsRepo>()));
    gh.factory<_i54.LittersCubit>(
        () => _i54.LittersCubit(gh<_i24.LittersRepo>()));
    gh.factory<_i55.ProfileCubit>(
        () => _i55.ProfileCubit(gh<_i28.ProfileRepo>()));
    gh.factory<_i56.SignInCubit>(() => _i56.SignInCubit(
          gh<_i29.SignInRepo>(),
          gh<_i42.AuthenticationBloc>(),
        ));
    gh.factory<_i57.TasksCubit>(() => _i57.TasksCubit(gh<_i30.TasksRepo>()));
    return this;
  }
}

class _$AppModule extends _i58.AppModule {}
