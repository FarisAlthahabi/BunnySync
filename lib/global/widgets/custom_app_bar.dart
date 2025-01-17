import 'package:bunny_sync/features/breeders/view/widgets/single_selector_dropdown_widget.dart';
import 'package:bunny_sync/features/breeders/view/widgets/tab_header.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/radio_selector_widget.dart';
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

class CustomAppBar<T extends RadioSelectorItemModel> extends StatefulWidget {
  const CustomAppBar({
    super.key,
    required this.onSearchChanged,
    required this.title,
    required this.tabs,
    this.searchController,
    this.searchFocusNode,
    this.onDeleteSearch,
    this.onScanTap,
    this.hint,
    this.onFilterSelect,
    this.selectableItems,
    this.selected,
  });

  final VoidCallback? onScanTap;
  final ValueChanged<String> onSearchChanged;
  final String title;
  final List<TabModel> tabs;
  final TextEditingController? searchController;
  final FocusNode? searchFocusNode;
  final VoidCallback? onDeleteSearch;
  final String? hint;
  final List<T>? selectableItems;
  final ValueChanged<T?>? onFilterSelect;
  final T? selected;

  @override
  State<CustomAppBar<T>> createState() => _CustomAppBarState<T>();
}

class _CustomAppBarState<T extends RadioSelectorItemModel>
    extends State<CustomAppBar<T>> {
  @override
  Widget build(BuildContext context) {
    final hint = widget.hint;
    final selectableItems = widget.selectableItems;
    final onFilterSelect = widget.onFilterSelect;

    return SliverAppBar(
      expandedHeight: widget.tabs.isNotEmpty ? 180 : 155,
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
              Row(
                children: [
                  Expanded(
                    child: SearchTextField(
                      controller: widget.searchController,
                      focusNode: widget.searchFocusNode,
                      hintText: 'search'.i18n,
                      onChanged: widget.onSearchChanged,
                      onDeleteText: widget.onDeleteSearch,
                    ),
                  ),
                  IconButton(
                    onPressed: widget.onScanTap,
                    icon: const Icon(Icons.qr_code_scanner),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.title,
                    style: context.tt.displayLarge,
                  ),
                  if (hint != null &&
                      selectableItems != null &&
                      onFilterSelect != null)
                    SingleSelectorDropdownWidget<T>(
                      hint: hint,
                      selected: widget.selected,
                      items: selectableItems,
                      onSelect: onFilterSelect,
                    ),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
      bottom: widget.tabs.isNotEmpty
          ? PreferredSize(
              preferredSize: const Size.fromHeight(48),
              child: Container(
                color: context.cs.surface,
                padding: AppConstants.paddingH16,
                child: Skeleton.shade(
                  child: TabBar(
                    tabs: widget.tabs
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
            )
          : null,
    );
  }
}
