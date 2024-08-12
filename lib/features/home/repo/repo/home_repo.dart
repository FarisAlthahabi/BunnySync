import 'package:bunny_sync/features/home/model/dashboard_model/dashboard_model.dart';
import 'package:bunny_sync/global/dio/dio_client.dart';
import 'package:bunny_sync/global/dio/exceptions.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:injectable/injectable.dart';

part 'http_home_repo.dart';

abstract class HomeRepo {
  Future<DashboardModel> getDashboardInfo();
}
