import 'package:bunny_sync/features/litter_details/cubit/litter_details_cubit.dart';
import 'package:bunny_sync/features/litter_details/view/widgets/litter_details_tile.dart';
import 'package:bunny_sync/global/gen/assets.gen.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/models/rabbit_property_model.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/info_properties_widget.dart';
import 'package:bunny_sync/global/widgets/main_error_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

abstract class KitsTabCallbacks {
  void onTryAgainTap();
}

class KitsTab extends StatefulWidget {
  const KitsTab({
    super.key,
    required this.litterId,
    this.scrollController,
  });

  final int litterId;
  final ScrollController? scrollController;

  @override
  State<KitsTab> createState() => _KitsTabState();
}

class _KitsTabState extends State<KitsTab> implements KitsTabCallbacks {
  late final LitterDetailsCubit litterDetailsCubit = context.read();

  @override
  void initState() {
    super.initState();
    litterDetailsCubit.getLitterDetails(widget.litterId);
  }

  @override
  void onTryAgainTap() {
    litterDetailsCubit.getLitterDetails(widget.litterId);
  }

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
          return Skeletonizer(
            enabled: state is LitterDetailsLoading,
            child: SingleChildScrollView(
              controller: widget.scrollController,
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
                        itemCount:
                            state.litterDetailsResponseModel.litter.kits.length,
                        itemBuilder: (context, index) {
                          final item = state
                              .litterDetailsResponseModel.litter.kits[index];
                          Color tileColor;
                          if (index.isEven) {
                            tileColor = context.cs.surface;
                          } else {
                            tileColor = AppColors.greyShade8;
                          }
                          return LitterDetailsTile(
                            subTitle: item.note,
                            rabbitProperty: RabbitPropertyModel(
                              title: Assets.icons.logo.path,
                              value: item.code,
                            ),
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
        } else if (state is LitterDetailsFail) {
          return MainErrorWidget(
            error: state.message,
            onTap: onTryAgainTap,
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
