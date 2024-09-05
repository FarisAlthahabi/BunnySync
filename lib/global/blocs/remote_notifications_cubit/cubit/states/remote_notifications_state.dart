part of '../remote_notifications_cubit.dart';

abstract class RemoteNotificationsState extends Equatable {
  const RemoteNotificationsState();

  @override
  List<Object> get props => [];
}

class SystemNotificationsInitial extends RemoteNotificationsState {}
