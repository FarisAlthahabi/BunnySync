import 'package:bunny_sync/global/blocs/remote_notifications_cubit/cubit/remote_notifications_cubit.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

mixin RemoteNotificationsMixin<T extends StatefulWidget> on State<T> {
  late final RemoteNotificationsCubit remoteNotificationsCubit = context.read();

  @override
  void initState() {
    super.initState();

    remoteNotificationsCubit.registerListener(remoteNotificationsListener);
  }

  void remoteNotificationsListener(
    RemoteMessage? message,
    AppState state,
  );
}
