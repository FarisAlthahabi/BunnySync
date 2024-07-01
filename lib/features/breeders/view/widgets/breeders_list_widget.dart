import 'package:bunny_sync/features/breeders/models/breeder_model.dart';
import 'package:bunny_sync/features/breeders/view/widgets/breeder_tile.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/animation/indexed_list_slide_fade_animated_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class BreedersListWidget extends StatelessWidget {
  const BreedersListWidget({
    super.key,
    required this.onBreederTap,
    this.padding = AppConstants.padding16,
  });

  final ValueSetter<BreederModel> onBreederTap;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    //TODO: From bloc
    final breeders = [
      BreederModel(
        name: 'Bunny Name',
        id: 3343,
        prefix: 'qws',
        userId: 1,
        uuid: 'qws-3343',
        updatedAt: DateTime.now(),
        createdAt: DateTime.now(),
        cage: 'Cage 1',
        breed: 'Breed 1',
        color: 'Color 1',
        tatto: 'Tatto 1',
      ),
      BreederModel(
        name: 'Bunny Name 2',
        id: 3344,
        prefix: 'qws',
        userId: 1,
        uuid: 'qws-3344',
        updatedAt: DateTime.now(),
        createdAt: DateTime.now(),
        cage: 'Cage 2',
        breed: 'Breed 2',
        color: 'Color 2',
        tatto: 'Tatto 2',
      ),
    ];

    return AnimationLimiter(
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: padding,
        itemCount: breeders.length,
        itemBuilder: (context, index) {
          return IndexedListSlideFadeAnimatedTile(
            index: index,
            child: BreederTile(
              breeder: breeders[index],
              onTap: onBreederTap,
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 16),
      ),
    );
  }
}
