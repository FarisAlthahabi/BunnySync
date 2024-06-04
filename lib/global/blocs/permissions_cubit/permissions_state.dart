part of 'permissions_cubit.dart';

@immutable
abstract class PermissionsState {}

class PermissionsInitial extends PermissionsState {}

class PermissionsGranted extends PermissionsState {
  PermissionsGranted(this.permission);

  final Permission permission;
}

class PermissionsDenied extends PermissionsState {
  PermissionsDenied(this.permission, {this.isPermanent = false});

  final Permission permission;
  final bool isPermanent;
}
