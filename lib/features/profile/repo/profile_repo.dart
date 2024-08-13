import 'package:bunny_sync/features/profile/model/user_model/user_model.dart';
import 'package:bunny_sync/features/profile/model/user_post_model/user_post_model.dart';
import 'package:bunny_sync/global/dio/dio_client.dart';
import 'package:bunny_sync/global/dio/exceptions.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:injectable/injectable.dart';

part 'http_profile_repo.dart';

abstract class ProfileRepo {
  Future<UserModel> getUserInfo();

  Future<UserModel> updateUserInfo(UserPostModel userPostModel);
}
