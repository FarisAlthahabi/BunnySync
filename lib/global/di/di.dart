import 'package:bunny_sync/global/di/di.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final get = GetIt.instance;

@injectableInit
Future<void> configureDependencies() async => get.init();
