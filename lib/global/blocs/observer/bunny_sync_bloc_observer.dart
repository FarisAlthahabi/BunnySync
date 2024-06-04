import 'package:bunny_sync/global/utils/logger.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BunnySyncBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc<dynamic, dynamic> bloc, Object? event) {
    super.onEvent(bloc, event);
    logger.f(
      '${bloc.runtimeType}:\n$event',
    );
  }

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    logger.i(
      '${bloc.runtimeType}:\n${change.currentState}\n${change.nextState}',
    );
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    logger.e('$error\n$stackTrace');
  }
}
