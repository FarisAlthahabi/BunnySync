import 'package:bunny_sync/features/breeders/models/breeder_entry_model/breeder_entry_model.dart';
import 'package:bunny_sync/features/breeders/view/widgets/breeder_tile.dart';
import 'package:bunny_sync/global/localization/translations.i18n.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/animation/indexed_list_slide_fade_animated_tile.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class BreedersListWidget extends StatelessWidget {
  const BreedersListWidget({
    super.key,
    required this.onBreederTap,
    required this.breeders,
    this.padding = AppConstants.padding16,
    this.onRefresh,
    this.controller,
    required this.onMoreOptionsTap,
  });

  final List<BreederEntryModel> breeders;
  final ValueSetter<BreederEntryModel> onBreederTap;
  final ValueSetter<BreederEntryModel> onMoreOptionsTap;
  final EdgeInsetsGeometry padding;
  final AsyncCallback? onRefresh;
  final ScrollController? controller;//

  @override
  Widget build(BuildContext context) {
    if (breeders.isNotEmpty) {
      final onRefresh = this.onRefresh;
      Widget child = ListView.separated(
        controller: controller,
        shrinkWrap: true,
        padding: padding,
        itemCount: breeders.length,
        itemBuilder: (context, index) {
          return IndexedListSlideFadeAnimatedTile(
            index: index,
            child: BreederTile(
              onMoreOptionsTap: onMoreOptionsTap,
                  breeder: breeders[index],
              onTap: onBreederTap,
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
    } else {
      return Scaffold(
        body: Center(
          child: Text(
            'no_breeders'.i18n,
            textAlign: TextAlign.center,
          ),
        ),
      );
    }
  }
}
