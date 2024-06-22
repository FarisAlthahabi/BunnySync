import 'package:bunny_sync/features/breeders/models/breeder_model.dart';
import 'package:bunny_sync/features/breeders/view/widgets/breeder_tile.dart';
import 'package:bunny_sync/global/models/rabbit_property_model.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/animation/indexed_list_slide_fade_animated_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class BreedersListWidget extends StatelessWidget {
  const BreedersListWidget({
    super.key,
    this.padding = AppConstants.padding16,
  });

  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    //TODO: From bloc
    final breeders = [
      BreederModel(
        name: 'Bunny Name',
        image:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5b/Oryctolagus_cuniculus_Tasmania_2_%28cropped%29.jpg/440px-Oryctolagus_cuniculus_Tasmania_2_%28cropped%29.jpg',
        id: '3343',
        prefix: 'qws',
        properties: [
          RabbitPropertyModel(
            title: 'Litters',
            value: '10',
          ),
          RabbitPropertyModel(
            title: 'Kits',
            value: '12',
          ),
          RabbitPropertyModel(
            title: 'Age',
            value: '2.5',
          ),
          RabbitPropertyModel(
            title: 'Weight',
            value: '1.2',
          ),
        ],
      ),
      BreederModel(
        name: 'Bunny Name',
        image:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5b/Oryctolagus_cuniculus_Tasmania_2_%28cropped%29.jpg/440px-Oryctolagus_cuniculus_Tasmania_2_%28cropped%29.jpg',
        id: '3343',
        prefix: 'qws',
        properties: [
          RabbitPropertyModel(
            title: 'Litters',
            value: '10',
          ),
          RabbitPropertyModel(
            title: 'Kits',
            value: '12',
          ),
          RabbitPropertyModel(
            title: 'Age',
            value: '2.5',
          ),
          RabbitPropertyModel(
            title: 'Weight',
            value: '1.2',
          ),
        ],
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
            child: BreederTile(breeder: breeders[index]),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 16),
      ),
    );
  }
}
