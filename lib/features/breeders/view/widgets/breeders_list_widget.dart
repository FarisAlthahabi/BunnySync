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
    required this.breedersModel,
    required this.onRefresh,
    this.padding = AppConstants.padding16,
    this.controller,
  });

  final List<BreederEntryModel> breedersModel;
  final ValueSetter<int> onBreederTap;
  final AsyncCallback onRefresh;
  final EdgeInsetsGeometry padding;
  final ScrollController? controller;

  @override
  Widget build(BuildContext context) {
    if (breedersModel.isNotEmpty) {
      return AnimationLimiter(
        child: RefreshIndicator(
          onRefresh: onRefresh,
          child: ListView.separated(
            controller: controller,
            shrinkWrap: true,
            padding: padding,
            itemCount: breedersModel.length,
            itemBuilder: (context, index) {
              return IndexedListSlideFadeAnimatedTile(
                index: index,
                child: BreederTile(
                  breeder: breedersModel[index],
                  onTap: onBreederTap,
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 16),
          ),
        ),
      );
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
