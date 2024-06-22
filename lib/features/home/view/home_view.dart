import 'package:auto_route/annotations.dart';
import 'package:bunny_sync/features/home/view/widgets/home_tile.dart';
import 'package:bunny_sync/global/extensions/date_time_x.dart';
import 'package:bunny_sync/global/gen/assets.gen.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/animation/indexed_grid_scale_fade_animated_tile.dart';
import 'package:bunny_sync/global/widgets/bunny_logo.dart';
import 'package:bunny_sync/global/widgets/images/app_image_widget.dart';
import 'package:bunny_sync/global/widgets/main_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

@RoutePage()
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomePage();
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        leadingWith: 70,
        leading: const Center(
          child: BunnyLogo(
            size: 40,
            borderRadius: AppConstants.borderRadius12,
          ),
        ),
        actions: [
          AppImageWidget(
            url: 'https://picsum.photos/200/300',
            width: 40,
            height: 40,
            fit: BoxFit.cover,
            borderRadius: BorderRadius.circular(25),
          ),
        ],
      ),
      body: SafeArea(
        top: false,
        child: Padding(
          padding: AppConstants.padding16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateTime.now().formatMMDoYYYY,
              ),
              Text(
                'dashboard'.i18n,
                style: Theme.of(context).textTheme.displayLarge,
              ),
              AnimationLimiter(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(top: 16),
                  children: [
                    IndexedGridScaleFadeAnimatedTile(
                      index: 0,
                      columnCount: 2,
                      child: HomeTile(
                        icon: Assets.icons.gendersThin.path,
                        title: 'active_breeders'.i18n,
                        subtitle: 'total'.i18n,
                        secondSubtitle: '11 ${'does'.i18n} 5 ${'bucks'.i18n}',
                      ),
                    ),
                    IndexedGridScaleFadeAnimatedTile(
                      index: 1,
                      columnCount: 2,
                      child: HomeTile(
                        icon: Assets.icons.apps.path,
                        title: 'active_litters'.i18n,
                        subtitle: 'total'.i18n,
                        secondSubtitle: '12 ${'kits'.i18n}',
                      ),
                    ),
                    IndexedGridScaleFadeAnimatedTile(
                      index: 2,
                      columnCount: 2,
                      child: HomeTile(
                        icon: Assets.icons.cake.path,
                        title: 'kits_born'.i18n,
                        subtitle: 'sold'.i18n,
                        secondSubtitle:
                            '11 ${'butchered'.i18n} 5 ${'died'.i18n}',
                      ),
                    ),
                    IndexedGridScaleFadeAnimatedTile(
                      index: 3,
                      columnCount: 2,
                      child: HomeTile(
                        icon: Assets.icons.roundDollar.path,
                        title: 'monthly_finances'.i18n,
                        subtitle: 'income'.i18n,
                        secondSubtitle: '90\$ ${'expenses'.i18n}',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
