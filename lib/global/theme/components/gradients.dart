import 'package:bunny_sync/global/theme/theme.dart';
import 'package:flutter/cupertino.dart';

abstract class AppGradients {
  static LinearGradient getGradient(BuildContext context) {
    return LinearGradient(
      colors: [
        context.cs.primaryContainer,
        context.cs.primary,
      ],
      begin: AlignmentDirectional.centerStart,
      end: AlignmentDirectional.centerEnd,
    );
  }
}
