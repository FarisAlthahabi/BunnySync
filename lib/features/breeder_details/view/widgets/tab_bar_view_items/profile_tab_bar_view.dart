import 'package:bunny_sync/features/breeder_details/cubit/breeder_details_cubit.dart';
import 'package:bunny_sync/features/breeder_details/view/widgets/breeder_details_tile.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/models/rabbit_property_model.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/info_properties_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

abstract class ProfileTabBarViewCallbacks {
  void onTryAgainTap();
}

class ProfileTabBarView extends StatefulWidget {
  const ProfileTabBarView({
    super.key,
    required this.breederId,
  });

  final int breederId;

  @override
  State<ProfileTabBarView> createState() => _ProfileTabBarViewState();
}

class _ProfileTabBarViewState extends State<ProfileTabBarView>
    implements ProfileTabBarViewCallbacks {
  late final BreederDetailsCubit breederDetailsCubit = context.read();

  @override
  void initState() {
    breederDetailsCubit.getBreederDetails(widget.breederId);
    super.initState();
  }

   @override
  void onTryAgainTap() {
    breederDetailsCubit.getBreederDetails(widget.breederId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BreederDetailsCubit, GeneralBreederDetailsState>(
      builder: (context, state) {
        if (state is BreederDetailsFetch) {
          //TODO: Moving this to another place.
          final rabbitProperties = [
            RabbitPropertyModel(
              title: 'litters'.i18n,
              value: state.breederDetailsResponseModel.littersCount.toString(),
            ),
            RabbitPropertyModel(
              title: 'kits'.i18n,
              value: state.breederDetailsResponseModel.kitsCount.toString(),
            ),
          ];
          return Skeletonizer(
            enabled: state is BreederDetailsLoading,
            child: SingleChildScrollView(
              child: Padding(
                padding: AppConstants.padding24,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      child: InfoPropertiesWidget(
                        properties: rabbitProperties,
                        propertyStructures: List.generate(
                          rabbitProperties.length,
                          (index) {
                            return PropertyStructure(
                              mainAxisCellCount: 1.6,
                              crossAxisCellCount: 3,
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: context.cs.onInverseSurface,
                        ),
                      ),
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 7,
                        itemBuilder: (context, index) {
                          final item =
                              state.breederDetailsResponseModel.breeder;
                          final rabbitDeatilsProperties = [
                            RabbitPropertyModel(
                              title: 'Status',
                              value: item.status.status,
                            ),
                            RabbitPropertyModel(
                              title: 'Cage',
                              value: item.cage,
                            ),
                            RabbitPropertyModel(
                              title: 'Weight',
                              value: state.breederDetailsResponseModel.weight,
                            ),
                            RabbitPropertyModel(
                              title: 'Breed',
                              value: item.breed,
                            ),
                            RabbitPropertyModel(
                              title: 'Color',
                              value: item.color,
                            ),
                            RabbitPropertyModel(
                              title: 'Acquired',
                              value: item.detail.acquired ?? '15',
                            ),
                            RabbitPropertyModel(
                              title: 'Born',
                              value: item.detail.born ?? '20',
                            ),
                          ];
                          Color tileColor;
                          if (index.isEven) {
                            tileColor = context.cs.surface;
                          } else {
                            tileColor = context.cs.onInverseSurface;
                          }
                          return BreederDetailsTile(
                            rabbitProperty: rabbitDeatilsProperties[index],
                            tileColor: tileColor,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else if (state is BreederDetailsFail) {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    state.message,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextButton(
                    onPressed: onTryAgainTap,
                    child: Text("try_again".i18n),
                  ),
                ],
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
