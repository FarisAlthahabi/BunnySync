import 'package:bunny_sync/features/breeders/models/breeder_entry_model/breeder_entry_model.dart';
import 'package:bunny_sync/features/litters/models/litter_model.dart';
import 'package:bunny_sync/features/litters/view/widgets/litter_tile.dart';
import 'package:bunny_sync/global/gen/assets.gen.dart';
import 'package:bunny_sync/global/models/rabbit_property_model.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/utils/enums/gender_types_enum.dart';
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
          BreederEntryModel(
            age: '10',
            dtRowIndex: 1,
            kits: '',
            litters: '',
            photo: '',
            status: 'Active',
            weight: '10.2',
            categoryBreederId: 1,
            gender: GenderTypes.male,
            name: 'Bunny Name',
            id: 3344,
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
          BreederEntryModel(
            age: '10',
            dtRowIndex: 1,
            kits: '',
            litters: '',
            photo: '',
            status: 'Active',
            weight: '10.2',
            categoryBreederId: 1,
            gender: GenderTypes.female,
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
          BreederEntryModel(
            age: '10',
            dtRowIndex: 1,
            kits: '',
            litters: '',
            photo: '',
            status: 'Active',
            weight: '10.2',
            categoryBreederId: 1,
            gender: GenderTypes.male,
            name: 'Bunny Name',
            id: 3344,
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
          BreederEntryModel(
            age: '10',
            dtRowIndex: 1,
            kits: '',
            litters: '',
            photo: '',
            status: 'Active',
            weight: '10.2',
            categoryBreederId: 1,
            gender: GenderTypes.female,
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
