// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:bunny_sync/features/add_ailment/cubit/add_ailment_cubit.dart'
    as _i41;
import 'package:bunny_sync/features/add_ailment/repo/add_ailment_repo.dart'
    as _i3;
import 'package:bunny_sync/features/add_attachment/cubit/add_attachment_cubit.dart'
    as _i42;
import 'package:bunny_sync/features/add_attachment/repo/add_attachment_repo.dart'
    as _i4;
import 'package:bunny_sync/features/add_breeder/cubit/add_breeder_cubit.dart'
    as _i43;
import 'package:bunny_sync/features/add_breeder/repo/add_breeder_repo.dart'
    as _i5;
import 'package:bunny_sync/features/add_cage/cubit/add_cage_cubit.dart' as _i44;
import 'package:bunny_sync/features/add_cage/repo/add_cage_repo.dart' as _i6;
import 'package:bunny_sync/features/add_category/cubit/add_category_cubit.dart'
    as _i45;
import 'package:bunny_sync/features/add_category/repo/add_category_repo.dart'
    as _i7;
import 'package:bunny_sync/features/add_customer/cubit/add_customer_cubit.dart'
    as _i46;
import 'package:bunny_sync/features/add_customer/repo/add_customer_repo.dart'
    as _i8;
import 'package:bunny_sync/features/add_ledger/cubit/add_ledger_cubit.dart'
    as _i47;
import 'package:bunny_sync/features/add_ledger/repo/add_ledger_repo.dart'
    as _i9;
import 'package:bunny_sync/features/add_litter/cubit/add_litter_cubit.dart'
    as _i48;
import 'package:bunny_sync/features/add_litter/repo/add_litter_repo.dart'
    as _i10;
import 'package:bunny_sync/features/add_note/cubit/add_note_cubit.dart' as _i49;
import 'package:bunny_sync/features/add_note/repo/add_note_repo.dart' as _i11;
import 'package:bunny_sync/features/add_task/cubit/add_task_cubit.dart' as _i50;
import 'package:bunny_sync/features/add_task/repo/add_task_repo.dart' as _i12;
import 'package:bunny_sync/features/add_treatment/cubit/add_treatment_cubit.dart'
    as _i51;
import 'package:bunny_sync/features/add_treatment/repo/add_treatment_repo.dart'
    as _i13;
import 'package:bunny_sync/features/authentication/bloc/authentication_bloc.dart'
    as _i52;
import 'package:bunny_sync/features/breeder_details/cubit/breeder_details_cubit.dart'
    as _i54;
import 'package:bunny_sync/features/breeder_details/repo/breeder_details_repo.dart'
    as _i14;
import 'package:bunny_sync/features/breeders/cubit/breeders_cubit.dart' as _i56;
import 'package:bunny_sync/features/breeders/models/breeder_entry_model/breeder_entry_model.dart'
    as _i55;
import 'package:bunny_sync/features/breeders/repo/breeders_repo.dart' as _i15;
import 'package:bunny_sync/features/cage_cards/cubit/cage_cards_cubit.dart'
    as _i57;
import 'package:bunny_sync/features/cage_cards/repo/cage_cards_repo.dart'
    as _i16;
import 'package:bunny_sync/features/categories/cubit/categories_cubit.dart'
    as _i58;
import 'package:bunny_sync/features/categories/repo/categories_repo.dart'
    as _i17;
import 'package:bunny_sync/features/customers/cubit/customers_cubit.dart'
    as _i59;
import 'package:bunny_sync/features/customers/repo/customers_repo.dart' as _i18;
import 'package:bunny_sync/features/dashboard/cubit/dashboard_cubit.dart'
    as _i19;
import 'package:bunny_sync/features/health/cubit/health_cubit.dart' as _i61;
import 'package:bunny_sync/features/health/repo/health_repo.dart' as _i22;
import 'package:bunny_sync/features/home/cubit/home_cubit.dart' as _i62;
import 'package:bunny_sync/features/home/repo/repo/home_repo.dart' as _i23;
import 'package:bunny_sync/features/ledger/cubit/ledgers_cubit.dart' as _i63;
import 'package:bunny_sync/features/ledger/repo/ledgers_repo.dart' as _i25;
import 'package:bunny_sync/features/litter_details/cubit/litter_details_cubit.dart'
    as _i65;
import 'package:bunny_sync/features/litter_details/repo/litter_details_repo.dart'
    as _i27;
import 'package:bunny_sync/features/litters/cubit/litters_cubit.dart' as _i67;
import 'package:bunny_sync/features/litters/models/litter_entry_model/litter_entry_model.dart'
    as _i66;
import 'package:bunny_sync/features/litters/repo/litters_repo.dart' as _i28;
import 'package:bunny_sync/features/main_navigation/cubit/main_navigation_cubit.dart'
    as _i30;
import 'package:bunny_sync/features/profile/cubit/profile_cubit.dart' as _i68;
import 'package:bunny_sync/features/profile/repo/profile_repo.dart' as _i34;
import 'package:bunny_sync/features/sign_in/cubit/sign_in_cubit.dart' as _i70;
import 'package:bunny_sync/features/sign_in/repo/sign_in_repo.dart' as _i36;
import 'package:bunny_sync/features/tasks/cubit/tasks_cubit.dart' as _i71;
import 'package:bunny_sync/features/tasks/repo/tasks_repo.dart' as _i37;
import 'package:bunny_sync/global/blocs/delete_breeder_cubit/delete_breeder_cubit.dart'
    as _i60;
import 'package:bunny_sync/global/blocs/litter_concerns_cubit/cubit/litter_concerns_cubit.dart'
    as _i64;
import 'package:bunny_sync/global/blocs/note_cubit/cubit/notes_cubit.dart'
    as _i32;
import 'package:bunny_sync/global/blocs/permissions_cubit/permissions_cubit.dart'
    as _i33;
import 'package:bunny_sync/global/blocs/rabbit_concerns_cubit/rabbit_concerns_cubit.dart'
    as _i69;
import 'package:bunny_sync/global/blocs/upload_file_cubit/upload_file_cubit.dart'
    as _i38;
import 'package:bunny_sync/global/blocs/weight_cubit/cubit/weight_cubit.dart'
    as _i72;
import 'package:bunny_sync/global/di/modules/app_module.dart' as _i73;
import 'package:bunny_sync/global/dio/dio_client.dart' as _i21;
import 'package:bunny_sync/global/localization/cubit/localization_cubit.dart'
    as _i29;
import 'package:bunny_sync/global/localization/language_changer.dart' as _i24;
import 'package:bunny_sync/global/repos/delete_breeder_repo/delete_breeder_repo.dart'
    as _i20;
import 'package:bunny_sync/global/repos/litter_concers_repo/litter_concerns_repo.dart'
    as _i26;
import 'package:bunny_sync/global/repos/note_repo/note_repo.dart' as _i31;
import 'package:bunny_sync/global/repos/rabbit_concerns_repo/rabbit_concerns_repo.dart'
    as _i35;
import 'package:bunny_sync/global/repos/repos.dart' as _i53;
import 'package:bunny_sync/global/repos/user_repo.dart' as _i39;
import 'package:bunny_sync/global/repos/weight_repo/weight_repo.dart' as _i40;
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
    gh.factory<_i9.AddLedgerRepo>(() => _i9.HttpAddLedgerRepo());
    gh.factory<_i10.AddLitterRepo>(() => _i10.HttpAddLitterRepo());
    gh.factory<_i11.AddNoteRepo>(() => _i11.HttpAddNoteRepo());
    gh.factory<_i12.AddTaskRepo>(() => _i12.HttpAddTaskRepo());
    gh.factory<_i13.AddTreatmentRepo>(() => _i13.HttpAddTreatmentRepo());
    gh.factory<_i14.BreederDetailsRepo>(() => _i14.HttpBreederDetailsRepo());
    gh.factory<_i15.BreedersRepo>(() => _i15.HttpBreedersRepo());
    gh.factory<_i16.CageCardsRepo>(() => _i16.HttpCageCardsRepo());
    gh.factory<_i17.CategoriesRepo>(() => _i17.HttpCategoriesRepo());
    gh.factory<_i18.CustomersRepo>(() => _i18.HttpCustomersRepo());
    gh.factory<_i19.DashboardCubit>(() => _i19.DashboardCubit());
    gh.factory<_i20.DeleteBreederRepo>(() => _i20.HttpDeleteBreederRepo());
    gh.singleton<_i21.DioClient>(() => _i21.DioClient());
    gh.factory<_i22.HealthRepo>(() => _i22.HttpHealthRepo());
    gh.factory<_i23.HomeRepo>(() => _i23.HttpHomeRepo());
    await gh.singletonAsync<_i24.LanguageChanger>(
      () {
        final i = _i24.LanguageChanger();
        return i.init().then((_) => i);
      },
      preResolve: true,
    );
    gh.factory<_i25.LedgersRepo>(() => _i25.HttpLedgersRepo());
    gh.factory<_i26.LitterConcernsRepo>(() => _i26.HttpLitterConcernsRepo());
    gh.factory<_i27.LitterDetailsRepo>(() => _i27.HttpLitterDetailsRepo());
    gh.factory<_i28.LittersRepo>(() => _i28.HttpLittersRepo());
    gh.factory<_i29.LocalizationCubit>(() => _i29.LocalizationCubit());
    gh.factory<_i30.MainNavigationCubit>(() => _i30.MainNavigationCubit());
    gh.factory<_i31.NoteRepo>(() => _i31.HttpNoteRepo());
    gh.factory<_i32.NotesCubit>(() => _i32.NotesCubit(gh<_i31.NoteRepo>()));
    gh.factory<_i33.PermissionsCubit>(() => _i33.PermissionsCubit());
    gh.factory<_i34.ProfileRepo>(() => _i34.HttpProfileRepo());
    gh.factory<_i35.RabbitConcernsRepo>(() => _i35.HttpRabbitConcernsRepo());
    gh.factory<_i36.SignInRepo>(() => _i36.HttpSignInRepo());
    gh.factory<_i37.TasksRepo>(() => _i37.HttpTasksRepo());
    gh.factory<_i38.UploadFileCubit>(() => _i38.UploadFileCubit());
    await gh.singletonAsync<_i39.UserRepo>(
      () {
        final i = _i39.UserRepo();
        return i.init().then((_) => i);
      },
      preResolve: true,
    );
    gh.factory<_i40.WeightRepo>(() => _i40.HttpWeightRepo());
    gh.singletonAsync<bool>(() => appModule.disablePrintOnRelease());
    gh.singleton<double>(() => appModule.translations());
    gh.factory<_i41.AddAilmentCubit>(
        () => _i41.AddAilmentCubit(gh<_i3.AddAilmentRepo>()));
    gh.factory<_i42.AddAttachmentCubit>(
        () => _i42.AddAttachmentCubit(gh<_i4.AddAttachmentRepo>()));
    gh.factory<_i43.AddBreederCubit>(
        () => _i43.AddBreederCubit(gh<_i5.AddBreederRepo>()));
    gh.factory<_i44.AddCageCubit>(
        () => _i44.AddCageCubit(gh<_i6.AddCageRepo>()));
    gh.factory<_i45.AddCategoryCubit>(
        () => _i45.AddCategoryCubit(gh<_i7.AddCategoryRepo>()));
    gh.factory<_i46.AddCustomerCubit>(
        () => _i46.AddCustomerCubit(gh<_i8.AddCustomerRepo>()));
    gh.factory<_i47.AddLedgerCubit>(
        () => _i47.AddLedgerCubit(gh<_i9.AddLedgerRepo>()));
    gh.factory<_i48.AddLitterCubit>(
        () => _i48.AddLitterCubit(gh<_i10.AddLitterRepo>()));
    gh.factory<_i49.AddNoteCubit>(
        () => _i49.AddNoteCubit(gh<_i11.AddNoteRepo>()));
    gh.factory<_i50.AddTaskCubit>(
        () => _i50.AddTaskCubit(gh<_i12.AddTaskRepo>()));
    gh.factory<_i51.AddTreatmentCubit>(
        () => _i51.AddTreatmentCubit(gh<_i13.AddTreatmentRepo>()));
    gh.singleton<_i52.AuthenticationBloc>(
        () => _i52.AuthenticationBloc(gh<_i53.UserRepo>()));
    gh.factoryParam<_i54.BreederDetailsCubit, _i55.BreederEntryModel, dynamic>((
      breeder,
      _,
    ) =>
        _i54.BreederDetailsCubit(
          gh<_i14.BreederDetailsRepo>(),
          breeder,
        ));
    gh.factory<_i56.BreedersCubit>(
        () => _i56.BreedersCubit(gh<_i15.BreedersRepo>()));
    gh.factory<_i57.CageCardsCubit>(
        () => _i57.CageCardsCubit(gh<_i16.CageCardsRepo>()));
    gh.factory<_i58.CategoriesCubit>(
        () => _i58.CategoriesCubit(gh<_i17.CategoriesRepo>()));
    gh.factory<_i59.CustomersCubit>(
        () => _i59.CustomersCubit(gh<_i18.CustomersRepo>()));
    gh.factory<_i60.DeleteBreederCubit>(
        () => _i60.DeleteBreederCubit(gh<_i20.DeleteBreederRepo>()));
    gh.factory<_i61.HealthCubit>(() => _i61.HealthCubit(gh<_i22.HealthRepo>()));
    gh.factory<_i62.HomeCubit>(() => _i62.HomeCubit(gh<_i23.HomeRepo>()));
    gh.factory<_i63.LedgersCubit>(
        () => _i63.LedgersCubit(gh<_i25.LedgersRepo>()));
    gh.factory<_i64.LitterConcernsCubit>(
        () => _i64.LitterConcernsCubit(gh<_i26.LitterConcernsRepo>()));
    gh.factoryParam<_i65.LitterDetailsCubit, _i66.LitterEntryModel, dynamic>((
      litter,
      _,
    ) =>
        _i65.LitterDetailsCubit(
          gh<_i27.LitterDetailsRepo>(),
          litter,
        ));
    gh.factory<_i67.LittersCubit>(
        () => _i67.LittersCubit(gh<_i28.LittersRepo>()));
    gh.factory<_i68.ProfileCubit>(
        () => _i68.ProfileCubit(gh<_i34.ProfileRepo>()));
    gh.factory<_i69.RabbitConcernsCubit>(
        () => _i69.RabbitConcernsCubit(gh<_i35.RabbitConcernsRepo>()));
    gh.factory<_i70.SignInCubit>(() => _i70.SignInCubit(
          gh<_i36.SignInRepo>(),
          gh<_i52.AuthenticationBloc>(),
        ));
    gh.factory<_i71.TasksCubit>(() => _i71.TasksCubit(gh<_i37.TasksRepo>()));
    gh.factory<_i72.WeightCubit>(() => _i72.WeightCubit(gh<_i40.WeightRepo>()));
    return this;
  }
}

class _$AppModule extends _i73.AppModule {}
