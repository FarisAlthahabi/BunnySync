// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:bunny_sync/features/add_breeder/cubit/add_breeder_cubit.dart'
    as _i21;
import 'package:bunny_sync/features/add_breeder/repo/add_breeder_repo.dart'
    as _i3;
import 'package:bunny_sync/features/add_litter/cubit/add_litter_cubit.dart'
    as _i22;
import 'package:bunny_sync/features/add_litter/repo/add_litter_repo.dart'
    as _i4;
import 'package:bunny_sync/features/add_note/cubit/add_note_cubit.dart' as _i23;
import 'package:bunny_sync/features/add_note/repo/add_note_repo.dart' as _i5;
import 'package:bunny_sync/features/add_task/cubit/add_task_cubit.dart' as _i24;
import 'package:bunny_sync/features/add_task/repo/add_task_repo.dart' as _i6;
import 'package:bunny_sync/features/authentication/bloc/authentication_bloc.dart'
    as _i25;
import 'package:bunny_sync/features/breeder_details/cubit/breeder_details_cubit.dart'
    as _i27;
import 'package:bunny_sync/features/breeder_details/repo/breeder_details_repo.dart'
    as _i7;
import 'package:bunny_sync/features/breeders/cubit/breeders_cubit.dart' as _i29;
import 'package:bunny_sync/features/breeders/models/breeder_entry_model/breeder_entry_model.dart'
    as _i28;
import 'package:bunny_sync/features/breeders/repo/breeders_repo.dart' as _i8;
import 'package:bunny_sync/features/dashboard/cubit/dashboard_cubit.dart'
    as _i9;
import 'package:bunny_sync/features/litter_details/cubit/litter_details_cubit.dart'
    as _i31;
import 'package:bunny_sync/features/litter_details/repo/litter_details_repo.dart'
    as _i13;
import 'package:bunny_sync/features/litters/cubit/litters_cubit.dart' as _i32;
import 'package:bunny_sync/features/litters/repo/litters_repo.dart' as _i14;
import 'package:bunny_sync/features/main_navigation/cubit/main_navigation_cubit.dart'
    as _i16;
import 'package:bunny_sync/features/sign_in/cubit/sign_in_cubit.dart' as _i33;
import 'package:bunny_sync/features/sign_in/repo/sign_in_repo.dart' as _i18;
import 'package:bunny_sync/features/tasks/cubit/tasks_cubit.dart' as _i34;
import 'package:bunny_sync/features/tasks/repo/tasks_repo.dart' as _i19;
import 'package:bunny_sync/global/blocs/delete_breeder_cubit/delete_breeder_cubit.dart'
    as _i30;
import 'package:bunny_sync/global/blocs/permissions_cubit/permissions_cubit.dart'
    as _i17;
import 'package:bunny_sync/global/di/modules/app_module.dart' as _i35;
import 'package:bunny_sync/global/dio/dio_client.dart' as _i11;
import 'package:bunny_sync/global/localization/cubit/localization_cubit.dart'
    as _i15;
import 'package:bunny_sync/global/localization/language_changer.dart' as _i12;
import 'package:bunny_sync/global/repos/delete_breeder_repo/delete_breeder_repo.dart'
    as _i10;
import 'package:bunny_sync/global/repos/repos.dart' as _i26;
import 'package:bunny_sync/global/repos/user_repo.dart' as _i20;
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
    gh.factory<_i6.AddTaskRepo>(() => _i6.HttpAddTaskRepo());
    gh.factory<_i7.BreederDetailsRepo>(() => _i7.HttpBreederDetailsRepo());
    gh.factory<_i8.BreedersRepo>(() => _i8.HttpBreedersRepo());
    gh.factory<_i9.DashboardCubit>(() => _i9.DashboardCubit());
    gh.factory<_i10.DeleteBreederRepo>(() => _i10.HttpDeleteBreederRepo());
    gh.singleton<_i11.DioClient>(() => _i11.DioClient());
    await gh.singletonAsync<_i12.LanguageChanger>(
      () {
        final i = _i12.LanguageChanger();
        return i.init().then((_) => i);
      },
      preResolve: true,
    );
    gh.factory<_i13.LitterDetailsRepo>(() => _i13.HttpLitterDetailsRepo());
    gh.factory<_i14.LittersRepo>(() => _i14.HttpLittersRepo());
    gh.factory<_i15.LocalizationCubit>(() => _i15.LocalizationCubit());
    gh.factory<_i16.MainNavigationCubit>(() => _i16.MainNavigationCubit());
    gh.factory<_i17.PermissionsCubit>(() => _i17.PermissionsCubit());
    gh.factory<_i18.SignInRepo>(() => _i18.HttpSignInRepo());
    gh.factory<_i19.TasksRepo>(() => _i19.HttpTasksRepo());
    await gh.singletonAsync<_i20.UserRepo>(
      () {
        final i = _i20.UserRepo();
        return i.init().then((_) => i);
      },
      preResolve: true,
    );
    gh.singletonAsync<bool>(() => appModule.disablePrintOnRelease());
    gh.singleton<double>(() => appModule.translations());
    gh.factory<_i21.AddBreederCubit>(
        () => _i21.AddBreederCubit(gh<_i3.AddBreederRepo>()));
    gh.factory<_i22.AddLitterCubit>(
        () => _i22.AddLitterCubit(gh<_i4.AddLitterRepo>()));
    gh.factory<_i23.AddNoteCubit>(
        () => _i23.AddNoteCubit(gh<_i5.AddNoteRepo>()));
    gh.factory<_i24.AddTaskCubit>(
        () => _i24.AddTaskCubit(gh<_i6.AddTaskRepo>()));
    gh.singleton<_i25.AuthenticationBloc>(
        () => _i25.AuthenticationBloc(gh<_i26.UserRepo>()));
    gh.factoryParam<_i27.BreederDetailsCubit, _i28.BreederEntryModel, dynamic>((
      breeder,
      _,
    ) =>
        _i27.BreederDetailsCubit(
          gh<_i7.BreederDetailsRepo>(),
          breeder,
        ));
    gh.factory<_i29.BreedersCubit>(
        () => _i29.BreedersCubit(gh<_i8.BreedersRepo>()));
    gh.factory<_i30.DeleteBreederCubit>(
        () => _i30.DeleteBreederCubit(gh<_i10.DeleteBreederRepo>()));
    gh.factory<_i31.LitterDetailsCubit>(
        () => _i31.LitterDetailsCubit(gh<_i13.LitterDetailsRepo>()));
    gh.factory<_i32.LittersCubit>(
        () => _i32.LittersCubit(gh<_i14.LittersRepo>()));
    gh.factory<_i33.SignInCubit>(() => _i33.SignInCubit(
          gh<_i18.SignInRepo>(),
          gh<_i25.AuthenticationBloc>(),
        ));
    gh.factory<_i34.TasksCubit>(() => _i34.TasksCubit(gh<_i19.TasksRepo>()));
    return this;
  }
}

class _$AppModule extends _i35.AppModule {}
