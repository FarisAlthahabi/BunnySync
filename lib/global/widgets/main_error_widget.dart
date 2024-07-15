import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:flutter/material.dart';

class MainErrorWidget extends StatelessWidget {
  const MainErrorWidget({
    super.key,
    required this.error,
    this.onTap,
  });

  final String error;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            error,
            textAlign: TextAlign.center,
            style: context.tt.bodyLarge,
          ),
          const SizedBox(
            height: 5,
          ),
          if(onTap != null)
            TextButton(
              onPressed: onTap,
              child: Text(
                "try_again".i18n,
                style: context.tt.bodyLarge?.copyWith(
                  color: AppColors.mainColorShade2,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
