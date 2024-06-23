import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class DetailsTabBar extends StatelessWidget implements PreferredSizeWidget {
  const DetailsTabBar({
    super.key,
    required this.tabs,
  });

  final List<TabModel> tabs;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      child: TabBar(
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
              (tab) => Tab(
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
            )
            .toList(),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(36);
}
