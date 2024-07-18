import 'package:auto_route/auto_route.dart';
import 'package:bunny_sync/features/breeder_details/view/widgets/details_tab_bar.dart';
import 'package:bunny_sync/features/litter_details/cubit/litter_details_cubit.dart';
import 'package:bunny_sync/features/litter_details/view/widgets/litter_details_tile.dart';
import 'package:bunny_sync/features/litter_details/view/widgets/litter_profile_info_widget.dart';
import 'package:bunny_sync/features/litters/models/litter_entry_model/litter_entry_model.dart';
import 'package:bunny_sync/features/litters/models/litter_model_local.dart';
import 'package:bunny_sync/global/di/di.dart';
import 'package:bunny_sync/global/gen/assets.gen.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/models/rabbit_property_model.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/custom_app_bar.dart';
import 'package:bunny_sync/global/widgets/info_properties_widget.dart';
import 'package:bunny_sync/global/widgets/main_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

abstract class LitterDetailsViewCallbacks {
  void onMoreOptionsTap();

  void onTryAgainTap();
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => get<LitterDetailsCubit>(),
        ),
      ],
      child: LitterDetailsPage(
        litter: litter,
      ),
    );
  }
}

class LitterDetailsPage extends StatefulWidget {
  const LitterDetailsPage({
    super.key,
    required this.litter,
  });

  final LitterEntryModel litter;

  @override
  State<LitterDetailsPage> createState() => _LitterDetailsPageState();
}

class _LitterDetailsPageState extends State<LitterDetailsPage>
    implements LitterDetailsViewCallbacks {
  late final LitterDetailsCubit litterDetailsCubit = context.read();

  @override
  void initState() {
    super.initState();
    litterDetailsCubit.getLitterDetails(widget.litter.id);
  }

  @override
  void onMoreOptionsTap() {}

  @override
  void onTryAgainTap() {
    litterDetailsCubit.getLitterDetails(widget.litter.id);
  }

  List<TabModel> get tabs => [
        TabModel(title: 'kits'.i18n),
        TabModel(title: 'notes'.i18n),
        TabModel(title: 'timeline'.i18n),
        TabModel(title: 'ledger'.i18n),
        TabModel(title: 'stats'.i18n),
      ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LitterDetailsCubit, GeneralLitterDetailsState>(
      builder: (context, state) {
        if (state is LitterDetailsFetch) {
          final properties = [
            RabbitPropertyModel(
              title: "total_weight".i18n,
              value: state.litterDetailsResponseModel.totalWeight.toString(),
            ),
            RabbitPropertyModel(
              title: "average_weight".i18n,
              value: state.litterDetailsResponseModel.averegeWeight == null
                  ? "unknown".i18n
                  : state.litterDetailsResponseModel.averegeWeight.toString(),
            ),
            RabbitPropertyModel(
              title: "age".i18n,
              value: state.litterDetailsResponseModel.age,
            ),
            RabbitPropertyModel(
              title: "active".i18n,
              value: state.litterDetailsResponseModel.activeLittersCount
                  .toString(),
            ),
            RabbitPropertyModel(
              title: "died".i18n,
              value:
                  state.litterDetailsResponseModel.diedLittersCount.toString(),
            ),
            RabbitPropertyModel(
              title: "survival_rate".i18n,
              value: state.litterDetailsResponseModel.survivalRate.toString(),
            ),
          ];

          final List<KidModel> kits = List.generate(
            state.litterDetailsResponseModel.litter.kits.length,
            (index) => KidModel(
              image: Assets.icons.logo.path,
              subTitle: index == 2 ? 'Some important text if we want' : null,
              id: state.litterDetailsResponseModel.litter.kits[index].id
                  .toString(),
            ),
          );

          return Skeletonizer(
            enabled: state is LitterDetailsLoading,
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
                            litter: widget.litter,
                          ),
                        ),
                        bottom: PreferredSize(
                          preferredSize: const Size.fromHeight(0),
                          child:
                              Skeleton.shade(child: DetailsTabBar(tabs: tabs)),
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
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          itemCount: kits.length,
                                          itemBuilder: (context, index) {
                                            Color tileColor;
                                            if (index.isEven) {
                                              tileColor = context.cs.surface;
                                            } else {
                                              tileColor = AppColors.greyShade8;
                                            }
                                            return LitterDetailsTile(
                                              subTitle: kits[index].subTitle,
                                              rabbitProperty:
                                                  RabbitPropertyModel(
                                                title: kits[index].image,
                                                value: kits[index].id,
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
            ),
          );
        } else if (state is LitterDetailsFail) {
          return Scaffold(
            body: MainErrorWidget(
              error: state.message,
              onTap: onTryAgainTap,
            ),
          );
        } else {
          return const Scaffold(
            body: SizedBox.shrink(),
          );
        }
      },
    );
  }
}
