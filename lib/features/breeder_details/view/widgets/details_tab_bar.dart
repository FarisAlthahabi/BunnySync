import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class DetailsTabBar extends StatelessWidget implements PreferredSizeWidget {
  const DetailsTabBar({
    super.key,
    required this.tabs,
    this.margin = AppConstants.paddingV12,
    this.tabController,
  });

  final List<TabModel> tabs;
  final EdgeInsetsGeometry margin;
  final TabController? tabController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: 36,
      child: Skeleton.shade(
        child: TabBar(
          controller: tabController,
          padding: AppConstants.paddingH24,
          tabAlignment: TabAlignment.start,
          isScrollable: true,
          splashBorderRadius: AppConstants.circularBorderRadius,
          indicator: BoxDecoration(
            color: context.cs.primary,
            borderRadius: AppConstants.circularBorderRadius,
          ),
          labelStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w400,
              ),
          unselectedLabelStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w400,
              ),
          labelColor: context.cs.surface,
          unselectedLabelColor: context.cs.primary,
          tabs: tabs
              .map(
                (tab) => Padding(
                  padding:
                      tabs.length <= 4 ? AppConstants.paddingH8 : EdgeInsets.zero,
                  child: Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (tab.title == 'profile'.i18n)
                          const Padding(
                            padding: EdgeInsetsDirectional.only(end: 8.0),
                            child: Icon(Icons.bookmark_outline_rounded),
                          ),
                        Text(
                          tab.title,
                        ),
                      ],
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(36);
}
