import 'package:animated_size_and_fade/animated_size_and_fade.dart';
import 'package:auto_route/auto_route.dart';
import 'package:bunny_sync/features/intro/view/pages/info_screen.dart';
import 'package:bunny_sync/features/intro/view/pages/select_goal_screen.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/router/router.dart';
import 'package:bunny_sync/global/theme/theme_x.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/buttons/main_action_button.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

abstract class IntroViewCallBacks {
  void onNextTap();

  void onSkipTap();
}

@RoutePage()
class IntroView extends StatelessWidget {
  const IntroView({super.key});

  @override
  Widget build(BuildContext context) {
    return const IntroPage();
  }
}

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> implements IntroViewCallBacks {
  int selectedPage = 0;

  final pageController = PageController();

  @override
  void initState() {
    super.initState();

    pageController.addListener(() {
      setState(() {
        final page = pageController.page;
        if (page != null) selectedPage = page.round();
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  void onNextTap() {
    if (selectedPage == 1) {
      onSkipTap();
      return;
    }
    pageController.nextPage(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  void onSkipTap() {
    context.router.push(
      const SelectSubscriptionPlanRoute(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      const InfoScreen(),
      const SelectGoalScreen(),
    ];

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: pageController,
                children: pages,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SmoothPageIndicator(
              effect: const WormEffect(
                activeDotColor: Color.fromRGBO(115, 103, 240, 1),
                dotHeight: 12,
                dotWidth: 12,
                type: WormType.thinUnderground,
              ),
              controller: pageController,
              count: pages.length,
            ),
            const SizedBox(height: 30),
            Padding(
              padding: AppConstants.paddingHorizontal16,
              child: Column(
                children: [
                  SizedBox(
                    width: double.maxFinite,
                    child: MainActionButton(
                      onTap: onNextTap,
                      text: selectedPage == 0 ? 'next'.i18n : 'continue'.i18n,
                    ),
                  ),
                  AnimatedHeightAndFade.showHide(
                    show: selectedPage == 0,
                    child: TextButton(
                      onPressed: onSkipTap,
                      child: Text(
                        'skip'.i18n,
                        style: context.tt.bodyLarge,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
