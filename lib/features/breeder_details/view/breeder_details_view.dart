import 'package:auto_route/annotations.dart';
import 'package:bunny_sync/features/breeder_details/view/widgets/breeder_details_tile.dart';
import 'package:bunny_sync/features/breeder_details/view/widgets/breeder_profile_info_widget.dart';
import 'package:bunny_sync/features/breeder_details/view/widgets/details_tab_bar.dart';
import 'package:bunny_sync/features/breeders/models/breeder_model.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/models/rabbit_property_model.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/custom_app_bar.dart';
import 'package:bunny_sync/global/widgets/info_properties_widget.dart';
import 'package:flutter/material.dart';

@RoutePage()
class BreederDetailsView extends StatelessWidget {
  const BreederDetailsView({super.key, required this.breeder});

  final BreederModel breeder;

  @override
  Widget build(BuildContext context) {
    return BreederDetailsPage(
      breeder: breeder,
    );
  }
}

class BreederDetailsPage extends StatelessWidget {
  const BreederDetailsPage({super.key, required this.breeder});

  final BreederModel breeder;

  List<TabModel> get tabs => [
        TabModel(title: 'profile'.i18n),
        TabModel(title: 'litters'.i18n),
        TabModel(title: 'pedigree'.i18n),
        TabModel(title: 'notes'.i18n),
        TabModel(title: 'tasks'.i18n),
      ];

  @override
  Widget build(BuildContext context) {
    final rabbitProperties = [
      RabbitPropertyModel(title: 'breed'.i18n, value: breeder.breed ?? 'breed'),
      RabbitPropertyModel(title: 'color'.i18n, value: breeder.color ?? 'color'),
    ];

    return DefaultTabController(
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
                actions: const [
                  Padding(
                    padding: EdgeInsets.only(right: 16),
                    child: Icon(Icons.more_horiz_outlined),
                  ),
                ],
                flexibleSpace: FlexibleSpaceBar(
                  background: BreederProfileInfoWidget(
                    breeder: breeder,
                  ),
                ),
                bottom: DetailsTabBar(tabs: tabs),
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
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: 7,
                                  itemBuilder: (context, index) {
                                    Color tileColor;
                                    if (index.isEven) {
                                      tileColor = context.cs.surface;
                                    } else {
                                      tileColor = context.cs.onInverseSurface;
                                    }
                                    return BreederDetailsTile(
                                      rabbitProperty: RabbitPropertyModel(
                                        title: 'Status',
                                        value: 'Active',
                                      ),
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
    );
  }
}
