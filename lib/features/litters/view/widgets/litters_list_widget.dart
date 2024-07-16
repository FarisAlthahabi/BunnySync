import 'package:bunny_sync/features/litters/models/litter_entry_model/litter_entry_model.dart';
import 'package:bunny_sync/features/litters/view/widgets/litter_tile.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/animation/indexed_list_slide_fade_animated_tile.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class LittersListWidget extends StatelessWidget {
  const LittersListWidget({
    super.key,
    required this.onLitterTap,
    this.padding = AppConstants.padding16,
    required this.litters,
    this.controller,
    this.onRefresh,
  });

  final ScrollController? controller;
  final ValueSetter<LitterEntryModel> onLitterTap;
  final List<LitterEntryModel> litters;
  final EdgeInsetsGeometry padding;
  final AsyncCallback? onRefresh;

  @override
  Widget build(BuildContext context) {
    if (litters.isNotEmpty) {
      final onRefresh = this.onRefresh;
      Widget child = ListView.separated(
        controller: controller,
        shrinkWrap: true,
        padding: padding,
        itemCount: litters.length,
        itemBuilder: (context, index) {
          return IndexedListSlideFadeAnimatedTile(
            index: index,
            child: LitterTile(
              litter: litters[index],
              onTap: onLitterTap,
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 16),
      );
      if (onRefresh != null) {
        child = RefreshIndicator(
          onRefresh: onRefresh,
          child: child,
        );
      }
      return AnimationLimiter(child: child);
    }
    else{
      return Scaffold(
        body: Center(
          child: Text(
            'litters_empty'.i18n,
            textAlign: TextAlign.center,
          ),
        ),
      );
    }
  }
}
