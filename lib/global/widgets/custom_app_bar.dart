import 'package:bunny_sync/features/breeders/view/widgets/tab_header.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class TabModel {
  TabModel({
    required this.title,
    this.indicatorValue,
  });

  final String title;
  final String? indicatorValue;
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.onSearchChanged,
    required this.title,
    required this.tabs,
    this.searchController,
    this.onDeleteSearch,
  });
  final TextEditingController? searchController;
  final ValueChanged<String> onSearchChanged;
  final VoidCallback? onDeleteSearch;
  final String title;
  final List<TabModel> tabs;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 180,
      automaticallyImplyLeading: false,
      elevation: 0,
      scrolledUnderElevation: 0,
      pinned: true,
      floating: true,
      snap: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: AppConstants.padding16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).padding.top,
              ),
              SearchTextField(
                controller: searchController,
                hintText: 'search'.i18n,
                onChanged: onSearchChanged,
                onDeleteText: onDeleteSearch,
              ),
              const SizedBox(height: 12),
              Text(
                title,
                style: context.tt.displayLarge,
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(48),
        child: Container(
          color: context.cs.surface,
          padding: AppConstants.paddingH16,
          child: Skeleton.shade(
            child: TabBar(
              tabs: tabs
                  .map(
                    (tab) => TabHeader(
                      text: tab.title,
                      indicatorValue: tab.indicatorValue,
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
