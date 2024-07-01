part of 'sign_in_repo.dart';

@Injectable(as: SignInRepo)
class HttpSignInRepo implements SignInRepo {
  final DioClient _dioClient = DioClient();

  final UserRepo userRepo = UserRepo();

  @override
  Future<ResponseModel<SignInModel>> signIn(
    String email,
    String password,
  ) async {
    final response = await _dioClient.post(
      '/login',
      data: {
        'email': email,
        'password': password,
      },
    );

    final body = response.data as Map<String, dynamic>;

    return ResponseModel<SignInModel>.fromJson(
      body,
      (json) {
        final data = json as Map<String, dynamic>?;
        if (data == null) throw 'Data is null';
        return SignInModel.fromJson(data);
      },
    );
  }

  @override
  Future<ResponseModel<SignInModel>> signUp(
    PostSignUpModel postSignUpModel,
  ) async {
    try {
      final response = await _dioClient.post(
        '/register',
        data: postSignUpModel.toJson(),
      );

      final body = response.data as Map<String, dynamic>;

      return ResponseModel<SignInModel>.fromJson(
        body,
        (json) {
          final data = json as Map<String, dynamic>?;
          if (data == null) throw 'Data is null';
          return SignInModel.fromJson(data);
        },
      );
    } catch (e) {
      if (e is BadRequestException) {
        SignUpException signUpException = const SignUpException(errors: {});

        final body = e.response?.data as Map<String, dynamic>;

        final emailErrors = ((body['errors'] as Map<String, dynamic>)['inputs']
            as Map<String, dynamic>)['email'] as List<dynamic>?;
        if (emailErrors != null && emailErrors.isNotEmpty) {
          signUpException = signUpException.copyWith(
            errors: {
              ...signUpException.errors,
              TextFieldType.email:
                  emailErrors.map((e) => e.toString()).toList(),
            },
          );
        }

        throw signUpException;
      }
      rethrow;
    }
  }

  @override
  Future<ResponseModel<LogOutModel>> logout() async {
    final response = await _dioClient.post(
      '/logout',
    );

    final body = response.data as Map<String, dynamic>;

    return ResponseModel<LogOutModel>.fromJson(
      body,
      (json) {
        final data = json as Map<String, dynamic>?;
        if (data == null) throw 'Data is null';
        return LogOutModel.fromJson(data);
      },
    );
  }
}
