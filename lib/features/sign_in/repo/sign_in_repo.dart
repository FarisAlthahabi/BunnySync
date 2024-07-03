import 'package:bunny_sync/features/sign_in/cubit/sign_in_cubit.dart';
import 'package:bunny_sync/features/sign_in/models/post_sign_up_model/post_sign_up_model.dart';
import 'package:bunny_sync/features/sign_in/models/sign_in_model/sign_in_model.dart';
import 'package:bunny_sync/features/sign_in/models/sign_up_exception/sign_up_exception.dart';
import 'package:bunny_sync/global/dio/dio.dart';
import 'package:bunny_sync/global/models/response_model/response_model.dart';
import 'package:bunny_sync/global/repos/repos.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

part 'http_sign_in_repo.dart';

abstract class SignInRepo {
  Future<ResponseModel<SignInModel>> signIn(String email, String password);

  Future<ResponseModel<SignInModel>> signUp(PostSignUpModel postSignUpModel);

  Future<void> logout();
}
