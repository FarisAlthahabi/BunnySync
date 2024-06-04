import 'package:bunny_sync/features/sign_in/cubit/sign_in_cubit.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'sign_up_exception.g.dart';

@CopyWith(skipFields: true)
class SignUpException implements Exception {
  const SignUpException({
    required this.errors,
  });

  final Map<TextFieldType, List<String>> errors;
}
