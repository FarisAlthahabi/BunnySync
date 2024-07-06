import 'package:auto_route/annotations.dart';
import 'package:bunny_sync/features/breeder_details/cubit/breeder_details_cubit.dart';
import 'package:bunny_sync/features/breeder_details/view/widgets/breeder_details_tile.dart';
import 'package:bunny_sync/features/breeder_details/view/widgets/breeder_profile_info_widget.dart';
import 'package:bunny_sync/features/breeder_details/view/widgets/details_tab_bar.dart';
import 'package:bunny_sync/features/breeders/models/breeder_entry_model/breeder_entry_model.dart';
import 'package:bunny_sync/global/di/di.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/models/rabbit_property_model.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/custom_app_bar.dart';
import 'package:bunny_sync/global/widgets/info_properties_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

abstract class BreederDetailsViewCallbacks {
  void onTryAgainTap();

  void onMoreOptionsTap();
}

@RoutePage()
class BreederDetailsView extends StatelessWidget {
  const BreederDetailsView({super.key, required this.breederId});

  final int breederId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => get<BreederDetailsCubit>(),
      child: BreederDetailsPage(
        breederId: breederId,
      ),
    );
  }
}

class BreederDetailsPage extends StatefulWidget {
  const BreederDetailsPage({
    super.key,
    required this.breederId,
  });

  final int breederId;

  @override
  State<BreederDetailsPage> createState() => _BreederDetailsPageState();
}

class _BreederDetailsPageState extends State<BreederDetailsPage>
    implements BreederDetailsViewCallbacks {
  late final BreederDetailsCubit breederDetailsCubit = context.read();

  List<TabModel> get tabs => [
        TabModel(title: 'profile'.i18n),
        TabModel(title: 'litters'.i18n),
        TabModel(title: 'pedigree'.i18n),
        TabModel(title: 'notes'.i18n),
        TabModel(title: 'tasks'.i18n),
      ];

  @override
  void onTryAgainTap() {
    breederDetailsCubit.getBreederDetails(widget.breederId);
  }

  @override
  void onMoreOptionsTap() {}

  @override
  void initState() {
    breederDetailsCubit.getBreederDetails(widget.breederId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
      ),
      child: BlocBuilder<BreederDetailsCubit, GeneralBreederDetailsState>(
        builder: (context, state) {
          if (state is BreederDetailsFetch) {
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
            final breeder = state.breederDetailsResponseModel.breeder;
            //TODO: Moving this to another place.
            final BreederEntryModel breederEntryModel = BreederEntryModel(
              id: breeder.id,
              userId: breeder.userId,
              uuid: breeder.uuid,
              name: breeder.name,
              updatedAt: breeder.updatedAt,
              createdAt: breeder.createdAt,
              weight: state.breederDetailsResponseModel.weight,
              litters: state.breederDetailsResponseModel.littersCount.toString(),
              kits: state.breederDetailsResponseModel.kitsCount.toString(),
              age: state.breederDetailsResponseModel.age,
              status: breeder.status.status,
              prefix: breeder.prefix,
              photo: '',
              dtRowIndex: 1,
            );
            return Skeletonizer(
              enabled: state is BreederDetailsLoading,
              child: DefaultTabController(
                length: tabs.length,
                child: Scaffold(
                  body: SafeArea(
                    child: CustomScrollView(
                      physics: const NeverScrollableScrollPhysics(),
                      slivers: [
                        SliverAppBar(
                          expandedHeight: 250,
                          centerTitle: true,
                          title: Text(
                            'breeder'.i18n,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          actions: [
                            Padding(
                              padding: const EdgeInsets.only(right: 16),
                              child: IconButton(
                                onPressed: onMoreOptionsTap,
                                icon: const Icon(Icons.more_horiz_outlined),
                              ),
                            ),
                          ],
                          flexibleSpace: Skeleton.shade(
                            child: FlexibleSpaceBar(
                              background: BreederProfileInfoWidget(
                                breeder: breederEntryModel,
                              ),
                            ),
                          ),
                          bottom: PreferredSize(
                            preferredSize: const Size.fromHeight(0),
                            child: Skeleton.shade(
                              child: DetailsTabBar(tabs: tabs),
                            ),
                          ),
                        ),
                        SliverFillRemaining(
                          child: TabBarView(
                            children: List.generate(
                              tabs.length,
                              (i) {
                                return SingleChildScrollView(
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
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            itemCount: 7,
                                            itemBuilder: (context, index) {
                                              final item = state
                                                  .breederDetailsResponseModel
                                                  .breeder;
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
                                                  value: state
                                                      .breederDetailsResponseModel
                                                      .weight,
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
                                                  value: item.detail.acquired ??
                                                      '15',
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
                                                tileColor =
                                                    context.cs.onInverseSurface;
                                              }
                                              return BreederDetailsTile(
                                                rabbitProperty:
                                                    rabbitDeatilsProperties[
                                                        index],
                                                tileColor: tileColor,
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
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
      ),
    );
  }
}
