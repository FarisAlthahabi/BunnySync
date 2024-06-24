import 'package:auto_route/auto_route.dart';
import 'package:bunny_sync/features/breeder_details/view/widgets/details_tab_bar.dart';
import 'package:bunny_sync/features/litter_details/view/widgets/litter_details_tile.dart';
import 'package:bunny_sync/features/litter_details/view/widgets/litter_profile_info_widget.dart';
import 'package:bunny_sync/features/litters/models/litter_model.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/models/rabbit_property_model.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/custom_app_bar.dart';
import 'package:bunny_sync/global/widgets/info_properties_widget.dart';
import 'package:flutter/material.dart';

@RoutePage()
class LitterDetailsView extends StatelessWidget {
  const LitterDetailsView({
    super.key,
    required this.litter,
  });

  final LitterModel litter;

  @override
  Widget build(BuildContext context) {
    return LitterDetailsPage(
      litter: litter,
    );
  }
}

class LitterDetailsPage extends StatelessWidget {
  const LitterDetailsPage({
    super.key,
    required this.litter,
  });

  final LitterModel litter;

  List<TabModel> get tabs => [
        TabModel(title: 'kits'.i18n),
        TabModel(title: 'notes'.i18n),
        TabModel(title: 'timeline'.i18n),
        TabModel(title: 'ledger'.i18n),
        TabModel(title: 'status'.i18n),
      ];

  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        body: SafeArea(child: 
        CustomScrollView(
            physics: const NeverScrollableScrollPhysics(),
            slivers: [
              SliverAppBar(
                expandedHeight: 250,
                centerTitle: true,
                title: Text(
                  'litter'.i18n,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                actions: const [
                  Padding(
                    padding: EdgeInsets.only(right: 16),
                    child: Icon(Icons.more_horiz_outlined),
                  ),
                ],
                flexibleSpace: FlexibleSpaceBar(
                  background: LitterProfileInfoWidget(
                    paddingTop: 70,
                    litter: litter,
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
                                  properties: litter.properties,
                                  propertyStructures: List.generate(
                                    litter.properties.length,
                                    (index) {
                                      return PropertyStructure(
                                        mainAxisCellCount: 2.2,
                                        crossAxisCellCount: 2,
                                      );
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(height: 24),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: context.cs.surface,
                                  ),
                                ),
                                child: ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: litter.kids.length,
                                  itemBuilder: (context, index) {
                                    Color tileColor;
                                    if (index.isEven) {
                                      tileColor = context.cs.surface;
                                    } else {
                                      tileColor = AppColors.greyShade8;
                                    }
                                    return LitterDetailsTile(
                                      subTitle: litter.kids[index].subTitle,
                                      rabbitProperty: RabbitPropertyModel(
                                        title: litter.kids[index].image,
                                        value: litter.kids[index].id,
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
      ),);
  }
}
