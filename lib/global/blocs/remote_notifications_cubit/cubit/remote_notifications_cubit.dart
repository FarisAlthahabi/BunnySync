import 'package:bloc/bloc.dart';
import 'package:bunny_sync/global/repos/user_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

part 'states/remote_notifications_state.dart';

class RemoteNotificationsCubit extends Cubit<RemoteNotificationsState> {
  RemoteNotificationsCubit(this.userRepo)
      : super(SystemNotificationsInitial()) {
    _activateFirebaseCloudMessaging();
  }

  final UserRepo userRepo;

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  String? fcmToken;

  List<ActOnMessage> listeners = [];

  void _activateFirebaseCloudMessaging() {
    _firebaseMessaging.getToken().then(
      (firebaseToken) {
        fcmToken = firebaseToken;
      },
    );

    _firebaseMessaging.onTokenRefresh.listen(
      (firebaseToken) {
        fcmToken = firebaseToken;
      },
    );

    //Called when the app is in the foreground.
    FirebaseMessaging.onMessage.listen(
      (message) {
        for (final listener in listeners) {
          listener(message, AppState.foreground);
        }
      },
    );

    //Called when the app is in the background and a notification is clicked.
    FirebaseMessaging.onMessageOpenedApp.listen(
      (message) {
        for (final listener in listeners) {
          listener(message, AppState.background);
        }
      },
    );

    //Called when the app is terminated and a notification is clicked.
    _firebaseMessaging.getInitialMessage().then(
      (message) async {
        for (final listener in listeners) {
          listener(message, AppState.terminated);
        }
      },
    );
  }

  Future<String?> getToken() async {
    return _firebaseMessaging.getToken();
  }

  void registerListener(ActOnMessage listener) {
    listeners.add(listener);
  }
}

///This has nothing to do with Bloc or Cubit states.
enum AppState { foreground, background, terminated }

///The data always comes from Firebase in Map<String, String> even though its type
///here in the message (RemoteMessage) is Map<String, dynamic>.

typedef ActOnMessage = void Function(
  RemoteMessage? message,
  AppState state,
);
