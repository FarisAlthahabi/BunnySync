part of '../home_cubit.dart';


@immutable
abstract class HomeState extends GeneralHomeState {}

class HomeInitial extends HomeState {}

class HomeFetch extends HomeState {
  HomeFetch(this.dashboardModel);

  final DashboardModel dashboardModel ;
}

class HomeLoading extends HomeFetch {
  HomeLoading(
    super.dashboardModel,
  );
}

class HomeSuccess extends HomeFetch {
  HomeSuccess(
    super.dashboardModel,
  );
}

class HomeFail extends HomeState {
  HomeFail(this.message);

  final String message;
}
