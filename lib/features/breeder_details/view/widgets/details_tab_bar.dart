import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class DetailsTabBar extends StatelessWidget {
  const DetailsTabBar({
    super.key,
    required this.tabs,
  });

  final List<TabModel> tabs;

  @override
  Widget build(BuildContext context) {
    final TabController tabController = DefaultTabController.of(context);
    return TabBar(
      tabAlignment:TabAlignment.start ,
      controller: tabController,
      indicator: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.transparent, // Remove the bottom indicator
            width: 0,
          ),
        ),
      ),
      isScrollable: true,
      labelStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
      unselectedLabelStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
            color: const Color.fromRGBO(115, 103, 240, 1),
            fontWeight: FontWeight.w400,
          ),
      labelColor: Colors.white,
      unselectedLabelColor: const Color.fromRGBO(109, 49, 237, 1),
      tabs: tabs
          .asMap()
          .map(
            (index, tab) => MapEntry(
              index,
              Tab(
                child: AnimatedBuilder(
                  animation: tabController,
                  builder: (context, child) {
                    final isSelected = tabController.index == index;
                    return Container(
                      constraints: const BoxConstraints(
                        maxHeight: 35,
                        minWidth: 90,
                      ),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: isSelected
                            ? const Color.fromRGBO(115, 103, 240, 1)
                            : Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (tab.title == 'profile'.i18n)
                            Icon(
                              Icons.bookmark_outline,
                              color: isSelected
                                  ? Colors.white
                                  : const Color.fromRGBO(115, 103, 240, 1),
                            ),
                          Text(
                            tab.title,
                            style: TextStyle(
                              color: isSelected
                                  ? Colors.white
                                  : const Color.fromRGBO(115, 103, 240, 1),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          )
          .values
          .toList(),
    );
  }
}
