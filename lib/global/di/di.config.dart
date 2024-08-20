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
import 'package:bunny_sync/features/add_attachment/cubit/add_attachment_cubit.dart'
    as _i34;
import 'package:bunny_sync/features/add_attachment/repo/add_attachment_repo.dart'
    as _i4;
import 'package:bunny_sync/features/add_breeder/cubit/add_breeder_cubit.dart'
    as _i35;
import 'package:bunny_sync/features/add_breeder/repo/add_breeder_repo.dart'
    as _i5;
import 'package:bunny_sync/features/add_cage/cubit/add_cage_cubit.dart' as _i36;
import 'package:bunny_sync/features/add_cage/repo/add_cage_repo.dart' as _i6;
import 'package:bunny_sync/features/add_category/cubit/add_category_cubit.dart'
    as _i37;
import 'package:bunny_sync/features/add_category/repo/add_category_repo.dart'
    as _i7;
import 'package:bunny_sync/features/add_customer/cubit/add_customer_cubit.dart'
    as _i38;
import 'package:bunny_sync/features/add_customer/repo/add_customer_repo.dart'
    as _i8;
import 'package:bunny_sync/features/add_litter/cubit/add_litter_cubit.dart'
    as _i39;
import 'package:bunny_sync/features/add_litter/repo/add_litter_repo.dart'
    as _i9;
import 'package:bunny_sync/features/add_note/cubit/add_note_cubit.dart' as _i40;
import 'package:bunny_sync/features/add_note/repo/add_note_repo.dart' as _i10;
import 'package:bunny_sync/features/add_task/cubit/add_task_cubit.dart' as _i41;
import 'package:bunny_sync/features/add_task/repo/add_task_repo.dart' as _i11;
import 'package:bunny_sync/features/add_treatment/cubit/add_treatment_cubit.dart'
    as _i42;
import 'package:bunny_sync/features/add_treatment/repo/add_treatment_repo.dart'
    as _i12;
import 'package:bunny_sync/features/authentication/bloc/authentication_bloc.dart'
    as _i43;
import 'package:bunny_sync/features/breeder_details/cubit/breeder_details_cubit.dart'
    as _i45;
import 'package:bunny_sync/features/breeder_details/repo/breeder_details_repo.dart'
    as _i13;
import 'package:bunny_sync/features/breeders/cubit/breeders_cubit.dart' as _i47;
import 'package:bunny_sync/features/breeders/models/breeder_entry_model/breeder_entry_model.dart'
    as _i46;
import 'package:bunny_sync/features/breeders/repo/breeders_repo.dart' as _i14;
import 'package:bunny_sync/features/cage_cards/cubit/cage_cards_cubit.dart'
    as _i48;
import 'package:bunny_sync/features/cage_cards/repo/cage_cards_repo.dart'
    as _i15;
import 'package:bunny_sync/features/categories/cubit/categories_cubit.dart'
    as _i49;
import 'package:bunny_sync/features/categories/repo/categories_repo.dart'
    as _i16;
import 'package:bunny_sync/features/customers/cubit/customers_cubit.dart'
    as _i50;
import 'package:bunny_sync/features/customers/repo/customers_repo.dart' as _i17;
import 'package:bunny_sync/features/dashboard/cubit/dashboard_cubit.dart'
    as _i18;
import 'package:bunny_sync/features/health/cubit/health_cubit.dart' as _i52;
import 'package:bunny_sync/features/health/repo/health_repo.dart' as _i21;
import 'package:bunny_sync/features/home/cubit/home_cubit.dart' as _i53;
import 'package:bunny_sync/features/home/repo/repo/home_repo.dart' as _i22;
import 'package:bunny_sync/features/litter_details/cubit/litter_details_cubit.dart'
    as _i54;
import 'package:bunny_sync/features/litter_details/repo/litter_details_repo.dart'
    as _i24;
import 'package:bunny_sync/features/litters/cubit/litters_cubit.dart' as _i55;
import 'package:bunny_sync/features/litters/repo/litters_repo.dart' as _i25;
import 'package:bunny_sync/features/main_navigation/cubit/main_navigation_cubit.dart'
    as _i27;
import 'package:bunny_sync/features/profile/cubit/profile_cubit.dart' as _i56;
import 'package:bunny_sync/features/profile/repo/profile_repo.dart' as _i29;
import 'package:bunny_sync/features/sign_in/cubit/sign_in_cubit.dart' as _i57;
import 'package:bunny_sync/features/sign_in/repo/sign_in_repo.dart' as _i30;
import 'package:bunny_sync/features/tasks/cubit/tasks_cubit.dart' as _i58;
import 'package:bunny_sync/features/tasks/repo/tasks_repo.dart' as _i31;
import 'package:bunny_sync/global/blocs/delete_breeder_cubit/delete_breeder_cubit.dart'
    as _i51;
import 'package:bunny_sync/global/blocs/permissions_cubit/permissions_cubit.dart'
    as _i28;
import 'package:bunny_sync/global/di/modules/app_module.dart' as _i59;
import 'package:bunny_sync/global/dio/dio_client.dart' as _i20;
import 'package:bunny_sync/global/localization/cubit/localization_cubit.dart'
    as _i26;
import 'package:bunny_sync/global/localization/language_changer.dart' as _i23;
import 'package:bunny_sync/global/repos/delete_breeder_repo/delete_breeder_repo.dart'
    as _i19;
import 'package:bunny_sync/global/repos/repos.dart' as _i44;
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
    gh.factory<_i4.AddAttachmentRepo>(() => _i4.HttpAddAttachmentRepo());
    gh.factory<_i5.AddBreederRepo>(() => _i5.HttpAddBreederRepo());
    gh.factory<_i6.AddCageRepo>(() => _i6.HttpAddCageRepo());
    gh.factory<_i7.AddCategoryRepo>(() => _i7.HttpAddCategoryRepo());
    gh.factory<_i8.AddCustomerRepo>(() => _i8.HttpAddCustomerRepo());
    gh.factory<_i9.AddLitterRepo>(() => _i9.HttpAddLitterRepo());
    gh.factory<_i10.AddNoteRepo>(() => _i10.HttpAddNoteRepo());
    gh.factory<_i11.AddTaskRepo>(() => _i11.HttpAddTaskRepo());
    gh.factory<_i12.AddTreatmentRepo>(() => _i12.HttpAddTreatmentRepo());
    gh.factory<_i13.BreederDetailsRepo>(() => _i13.HttpBreederDetailsRepo());
    gh.factory<_i14.BreedersRepo>(() => _i14.HttpBreedersRepo());
    gh.factory<_i15.CageCardsRepo>(() => _i15.HttpCageCardsRepo());
    gh.factory<_i16.CategoriesRepo>(() => _i16.HttpCategoriesRepo());
    gh.factory<_i17.CustomersRepo>(() => _i17.HttpCustomersRepo());
    gh.factory<_i18.DashboardCubit>(() => _i18.DashboardCubit());
    gh.factory<_i19.DeleteBreederRepo>(() => _i19.HttpDeleteBreederRepo());
    gh.singleton<_i20.DioClient>(() => _i20.DioClient());
    gh.factory<_i21.HealthRepo>(() => _i21.HttpHealthRepo());
    gh.factory<_i22.HomeRepo>(() => _i22.HttpHomeRepo());
    await gh.singletonAsync<_i23.LanguageChanger>(
      () {
        final i = _i23.LanguageChanger();
        return i.init().then((_) => i);
      },
      preResolve: true,
    );
    gh.factory<_i24.LitterDetailsRepo>(() => _i24.HttpLitterDetailsRepo());
    gh.factory<_i25.LittersRepo>(() => _i25.HttpLittersRepo());
    gh.factory<_i26.LocalizationCubit>(() => _i26.LocalizationCubit());
    gh.factory<_i27.MainNavigationCubit>(() => _i27.MainNavigationCubit());
    gh.factory<_i28.PermissionsCubit>(() => _i28.PermissionsCubit());
    gh.factory<_i29.ProfileRepo>(() => _i29.HttpProfileRepo());
    gh.factory<_i30.SignInRepo>(() => _i30.HttpSignInRepo());
    gh.factory<_i31.TasksRepo>(() => _i31.HttpTasksRepo());
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
    gh.factory<_i34.AddAttachmentCubit>(
        () => _i34.AddAttachmentCubit(gh<_i4.AddAttachmentRepo>()));
    gh.factory<_i35.AddBreederCubit>(
        () => _i35.AddBreederCubit(gh<_i5.AddBreederRepo>()));
    gh.factory<_i36.AddCageCubit>(
        () => _i36.AddCageCubit(gh<_i6.AddCageRepo>()));
    gh.factory<_i37.AddCategoryCubit>(
        () => _i37.AddCategoryCubit(gh<_i7.AddCategoryRepo>()));
    gh.factory<_i38.AddCustomerCubit>(
        () => _i38.AddCustomerCubit(gh<_i8.AddCustomerRepo>()));
    gh.factory<_i39.AddLitterCubit>(
        () => _i39.AddLitterCubit(gh<_i9.AddLitterRepo>()));
    gh.factory<_i40.AddNoteCubit>(
        () => _i40.AddNoteCubit(gh<_i10.AddNoteRepo>()));
    gh.factory<_i41.AddTaskCubit>(
        () => _i41.AddTaskCubit(gh<_i11.AddTaskRepo>()));
    gh.factory<_i42.AddTreatmentCubit>(
        () => _i42.AddTreatmentCubit(gh<_i12.AddTreatmentRepo>()));
    gh.singleton<_i43.AuthenticationBloc>(
        () => _i43.AuthenticationBloc(gh<_i44.UserRepo>()));
    gh.factoryParam<_i45.BreederDetailsCubit, _i46.BreederEntryModel, dynamic>((
      breeder,
      _,
    ) =>
        _i45.BreederDetailsCubit(
          gh<_i13.BreederDetailsRepo>(),
          breeder,
        ));
    gh.factory<_i47.BreedersCubit>(
        () => _i47.BreedersCubit(gh<_i14.BreedersRepo>()));
    gh.factory<_i48.CageCardsCubit>(
        () => _i48.CageCardsCubit(gh<_i15.CageCardsRepo>()));
    gh.factory<_i49.CategoriesCubit>(
        () => _i49.CategoriesCubit(gh<_i16.CategoriesRepo>()));
    gh.factory<_i50.CustomersCubit>(
        () => _i50.CustomersCubit(gh<_i17.CustomersRepo>()));
    gh.factory<_i51.DeleteBreederCubit>(
        () => _i51.DeleteBreederCubit(gh<_i19.DeleteBreederRepo>()));
    gh.factory<_i52.HealthCubit>(() => _i52.HealthCubit(gh<_i21.HealthRepo>()));
    gh.factory<_i53.HomeCubit>(() => _i53.HomeCubit(gh<_i22.HomeRepo>()));
    gh.factory<_i54.LitterDetailsCubit>(
        () => _i54.LitterDetailsCubit(gh<_i24.LitterDetailsRepo>()));
    gh.factory<_i55.LittersCubit>(
        () => _i55.LittersCubit(gh<_i25.LittersRepo>()));
    gh.factory<_i56.ProfileCubit>(
        () => _i56.ProfileCubit(gh<_i29.ProfileRepo>()));
    gh.factory<_i57.SignInCubit>(() => _i57.SignInCubit(
          gh<_i30.SignInRepo>(),
          gh<_i43.AuthenticationBloc>(),
        ));
    gh.factory<_i58.TasksCubit>(() => _i58.TasksCubit(gh<_i31.TasksRepo>()));
    return this;
  }
}

class _$AppModule extends _i59.AppModule {}
