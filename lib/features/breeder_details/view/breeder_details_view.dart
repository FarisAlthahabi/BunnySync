import 'package:bunny_sync/features/breeder_details/view/widgets/breeder_details_tile.dart';
import 'package:bunny_sync/features/breeder_details/view/widgets/breeder_info_tile.dart';
import 'package:bunny_sync/features/breeder_details/view/widgets/breeder_profile_info.dart';
import 'package:bunny_sync/features/breeder_details/view/widgets/details_tab_bar.dart';
import 'package:bunny_sync/features/breeders/models/breeder_model.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/models/rabbit_property_model.dart';
import 'package:bunny_sync/global/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    // Todo from bloc
    final List<TabModel> tabs = [
      TabModel(title: 'profile'.i18n),
      TabModel(title: 'litters'.i18n),
      TabModel(title: 'pedigree'.i18n),
      TabModel(title: 'notes'.i18n),
      TabModel(title: 'tasks'.i18n),
    ];
    final List<RabbitPropertyModel> rabbitProperties = List.generate(
      7,
      (index) => RabbitPropertyModel(title: 'Status', value: 'Active'),
    );
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        body: SafeArea(
          child: CustomScrollView(
            physics: const NeverScrollableScrollPhysics(),
            slivers: [
              SliverAppBar(
                expandedHeight: 250,
                centerTitle: true,
                title: Text(
                  'breeders'.i18n,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                actions: const [
                  Padding(
                    padding: EdgeInsets.only(right: 16),
                    child: Icon(Icons.more_horiz_outlined),
                  ),
                ],
                flexibleSpace: FlexibleSpaceBar(
                  background: BreederProfileInfo(
                    breeder: breeder,
                  ),
                ),
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(48),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: DetailsTabBar(
                      tabs: tabs,
                    ),
                  ),
                ),
              ),
              SliverFillRemaining(
                child: TabBarView(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 120,
                          child: Row(
                            children: [
                              const Expanded(
                                flex: 10,
                                child: SizedBox(),
                              ),
                              BreederInfoTile(
                                title: breeder.properties[0].title,
                                value: breeder.properties[0].value,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              BreederInfoTile(
                                title: breeder.properties[1].title,
                                value: breeder.properties[1].value,
                              ),
                              const Expanded(
                                flex: 10,
                                child: SizedBox(),
                              ),
                            ],
                          ),
                        ),
                        // list of breeder Details
                        Container(
                          width: 280,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color.fromRGBO(243, 244, 246, 1),
                            ),
                          ),
                          child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: rabbitProperties.length,
                            itemBuilder: (context, index) {
                              Color tileColor;
                              if (index.isEven) {
                                tileColor = Colors.white;
                              } else {
                                tileColor =
                                    const Color.fromRGBO(250, 250, 251, 1);
                              }
                              return BreederDetailsTile(
                                rabbitProperty: rabbitProperties[index],
                                tileColor: tileColor,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    Container(
                      color: Colors.blue,
                    ),
                    Container(
                      color: Colors.green,
                    ),
                    Container(
                      color: Colors.blue,
                    ),
                    Container(
                      color: Colors.red,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
