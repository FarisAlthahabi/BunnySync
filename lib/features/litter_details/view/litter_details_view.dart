import 'package:auto_route/auto_route.dart';
import 'package:bunny_sync/features/breeder_details/view/widgets/details_tab_bar.dart';
import 'package:bunny_sync/features/litter_details/view/widgets/litter_details_tile.dart';
import 'package:bunny_sync/features/litter_details/view/widgets/litter_profile_info_widget.dart';
import 'package:bunny_sync/features/litters/models/litter_entry_model/litter_entry_model.dart';
import 'package:bunny_sync/features/litters/models/litter_model_local.dart';
import 'package:bunny_sync/global/gen/assets.gen.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/models/rabbit_property_model.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/custom_app_bar.dart';
import 'package:bunny_sync/global/widgets/info_properties_widget.dart';
import 'package:flutter/material.dart';

abstract class LitterDetailsViewCallbacks {
  void onMoreOptionsTap();
}

@RoutePage()
class LitterDetailsView extends StatelessWidget {
  const LitterDetailsView({
    super.key,
    required this.litter,
  });

  final LitterEntryModel litter;

  @override
  Widget build(BuildContext context) {
    return LitterDetailsPage(
      litter: litter,
    );
  }
}

class LitterDetailsPage extends StatelessWidget
    implements LitterDetailsViewCallbacks {
  const LitterDetailsPage({
    super.key,
    required this.litter,
  });

  @override
  void onMoreOptionsTap() {}

  final LitterEntryModel litter;

  List<TabModel> get tabs => [
        TabModel(title: 'kits'.i18n),
        TabModel(title: 'notes'.i18n),
        TabModel(title: 'timeline'.i18n),
        TabModel(title: 'ledger'.i18n),
        TabModel(title: 'status'.i18n),
      ];

  @override
  Widget build(BuildContext context) {
    final properties = [
      RabbitPropertyModel(
        title: 'Total',
        value: '10',
      ),
      RabbitPropertyModel(
        title: 'Kits',
        value: litter.kits.toString(),
      ),
      RabbitPropertyModel(
        title: 'Age',
        value: litter.age,
      ),
      RabbitPropertyModel(
        title: 'Average',
        value: 'average',
      ),
      RabbitPropertyModel(
        title: 'Born',
        value: litter.born,
      ),
      RabbitPropertyModel(
        title: 'Died',
        value: litter.dead.toString(),
      ),
    ];
    final kids = [
      KidModel(image: Assets.icons.logo.path, id: '1'),
      KidModel(image: Assets.icons.logo.path, id: '1'),
      KidModel(
        image: Assets.icons.logo.path,
        id: '1',
        subTitle: 'Some important text if we want',
      ),
      KidModel(image: Assets.icons.logo.path, id: '1'),
      KidModel(image: Assets.icons.logo.path, id: '1'),
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
                  'litter'.i18n,
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
                                  properties: properties,
                                  propertyStructures: List.generate(
                                    properties.length,
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
                                  itemCount: kids.length,
                                  itemBuilder: (context, index) {
                                    Color tileColor;
                                    if (index.isEven) {
                                      tileColor = context.cs.surface;
                                    } else {
                                      tileColor = AppColors.greyShade8;
                                    }
                                    return LitterDetailsTile(
                                      subTitle: kids[index].subTitle,
                                      rabbitProperty: RabbitPropertyModel(
                                        title: kids[index].image,
                                        value: kids[index].id,
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
