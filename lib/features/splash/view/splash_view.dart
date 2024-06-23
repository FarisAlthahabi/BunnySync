import 'package:auto_route/auto_route.dart';
import 'package:bunny_sync/global/gen/assets.gen.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/mixins/mixins.dart';
import 'package:bunny_sync/global/router/router.dart';
import 'package:bunny_sync/global/theme/theme_x.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SplashPage();
  }
}

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with PostFrameMixin {
  late final logoSize = Size(
    170.w,
    170.h,
  );

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    precacheImage(
      Assets.icons.logo.provider(),
      context,
      size: logoSize,
    );
  }

  @override
  Future<void> onPostFrame() async {
    await Future.delayed(const Duration(seconds: 3));
    if (mounted) {
      context.router.replace(const AuthenticationRoute());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              children: [
                Text(
                  'app_name'.i18n,
                  style: TextStyle(
                    height: 1.7,
                    color: context.cs.onSurface,
                    fontSize: 21,
                  ),
                ),
                const SizedBox(height: 15),
                Assets.icons.logo.image(
                  width: logoSize.width,
                  height: logoSize.height,
                ),
                SizedBox(height: 35.h),
                Text(
                  'slogan'.i18n,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    height: 1.7,
                    color: context.cs.onSurface,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
