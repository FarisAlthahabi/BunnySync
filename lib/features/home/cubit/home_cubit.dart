import 'package:bloc/bloc.dart';
import 'package:bunny_sync/features/home/model/dashboard_model/dashboard_fake_model.dart';
import 'package:bunny_sync/features/home/model/dashboard_model/dashboard_model.dart';
import 'package:bunny_sync/features/home/repo/repo/home_repo.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'states/home_state.dart';

part 'states/general_home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._homeRepo) : super(HomeInitial());

  final HomeRepo _homeRepo;

  Future<void> getDashboardInfo() async {
    emit(HomeLoading(dashboardFakeModel));

    try {
      final response = await _homeRepo.getDashboardInfo();
      emit(HomeSuccess(response));
    } catch (e, s) {
      addError(e, s);
      emit(HomeFail(e.toString()));
    }
  }
}
