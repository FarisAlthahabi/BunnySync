import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'states/extend_body_state.dart';

part 'states/general_dashboard_state.dart';

@injectable
class DashboardCubit extends Cubit<GeneralDashboardState> {
  DashboardCubit() : super(GeneralDashboardInitial());

  void setExtendBody({required bool extend}) {
    emit(ExtendBodyState(extend));
  }
}
