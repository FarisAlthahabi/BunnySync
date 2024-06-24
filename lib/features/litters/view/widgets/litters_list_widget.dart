import 'package:bunny_sync/features/breeders/models/breeder_model.dart';
import 'package:bunny_sync/features/litters/models/litter_model.dart';
import 'package:bunny_sync/features/litters/view/widgets/litter_tile.dart';
import 'package:bunny_sync/global/gen/assets.gen.dart';
import 'package:bunny_sync/global/models/rabbit_property_model.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/animation/indexed_list_slide_fade_animated_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class LittersListWidget extends StatelessWidget {
  const LittersListWidget({
    super.key,
    required this.onLitterTap,
    this.padding = AppConstants.padding16,
  });

  final ValueSetter<LitterModel> onLitterTap;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    //TODO: From bloc
    final litters = [
      LitterModel(
        parents: [
          BreederModel (
            name: 'Bunny Name',
            image: 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5b/Oryctolagus_cuniculus_Tasmania_2_%28cropped%29.jpg/440px-Oryctolagus_cuniculus_Tasmania_2_%28cropped%29.jpg',
            id: '3343',
            prefix: 'qws',
            buckOrDoe: true,
            properties: [],
          ),
          BreederModel (
            name: 'Bunny Name',
            image: 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5b/Oryctolagus_cuniculus_Tasmania_2_%28cropped%29.jpg/440px-Oryctolagus_cuniculus_Tasmania_2_%28cropped%29.jpg',
            id: '3343',
            prefix: 'qws',
            buckOrDoe: false,
            properties: [],
          ),
        ],
        buckOrDoe: true,
        properties: [
          RabbitPropertyModel(
            title: 'Total',
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
            title: 'Average',
            value: '1.2',
          ),
          RabbitPropertyModel(
            title: 'Born',
            value: '10/10/2024',
          ),
          RabbitPropertyModel(
            title: 'Died',
            value: '10',
          ),
        ],
        kids: [
          KidModel(
            image: Assets.icons.logo.path,
            id: '50657',
          ),
          KidModel(
            image: Assets.icons.logo.path,
            id: '56754',
          ),
          KidModel(
            image: Assets.icons.logo.path,
            id: '50857',
            subTitle: 'Some important text if we want',
          ),
          KidModel(
            image: Assets.icons.logo.path,
            id: '50936',
          ),
          KidModel(
            image: Assets.icons.logo.path,
            id: '53965',
          ),
          KidModel(
            image: Assets.icons.logo.path,
            id: '59580',
          ),
        ],
      ),
      LitterModel(
        parents: [
          BreederModel (
            name: 'Bunny Name',
            image: 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5b/Oryctolagus_cuniculus_Tasmania_2_%28cropped%29.jpg/440px-Oryctolagus_cuniculus_Tasmania_2_%28cropped%29.jpg',
            id: '3343',
            prefix: 'qws',
            buckOrDoe: true,
            properties: [],
          ),
          BreederModel (
            name: 'Bunny Name',
            image: 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5b/Oryctolagus_cuniculus_Tasmania_2_%28cropped%29.jpg/440px-Oryctolagus_cuniculus_Tasmania_2_%28cropped%29.jpg',
            id: '3343',
            prefix: 'qws',
            buckOrDoe: false,
            properties: [],
          ),
        ],
        buckOrDoe: false,
        properties: [
          RabbitPropertyModel(
            title: 'Total',
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
            title: 'Average',
            value: '1.2',
          ),
          RabbitPropertyModel(
            title: 'Born',
            value: '10/10/2024',
          ),
          RabbitPropertyModel(
            title: 'Died',
            value: '10',
          ),
        ],
        kids: [
          KidModel(image: Assets.icons.logo.path, id: '50657'),
          KidModel(image: Assets.icons.logo.path, id: '56754'),
          KidModel(image: Assets.icons.logo.path, id: '50857'),
          KidModel(image: Assets.icons.logo.path, id: '50936'),
          KidModel(image: Assets.icons.logo.path, id: '53965'),
          KidModel(image: Assets.icons.logo.path, id: '59580'),
        ],
      ),
    ];

    return AnimationLimiter(
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
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
      ),
    );
  }
}
