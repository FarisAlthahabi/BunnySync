import 'package:bunny_sync/global/gen/assets.gen.dart';
import 'package:bunny_sync/global/localization/translations.i18n.dart';
import 'package:bunny_sync/global/theme/theme_x.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({
    super.key,
    this.width,
  });

  final double? width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 30),
          SvgPicture.asset(Assets.icons.intro.path),
          const SizedBox(height: 30),
          Text(
            'on_boarding'.i18n,
            style: context.tt.headlineMedium,
          ),
          const SizedBox(height: 30),
          Text(
            'lorem'.i18n,
            style: context.tt.bodyLarge?.copyWith(
              color: context.cs.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}
