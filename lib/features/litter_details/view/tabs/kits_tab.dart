import 'package:auto_route/auto_route.dart';
import 'package:bunny_sync/features/litter_details/cubit/litter_details_cubit.dart';
import 'package:bunny_sync/features/litter_details/model/kit_model/kit_model.dart';
import 'package:bunny_sync/features/litter_details/view/widgets/litter_details_tile.dart';
import 'package:bunny_sync/global/blocs/kits_cubit/kits_cubit.dart';
import 'package:bunny_sync/global/gen/assets.gen.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/models/rabbit_property_model.dart';
import 'package:bunny_sync/global/router/router.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/bottom_sheet_widget.dart';
import 'package:bunny_sync/global/widgets/buttons/main_add_floating_button.dart';
import 'package:bunny_sync/global/widgets/info_properties_widget.dart';
import 'package:bunny_sync/global/widgets/list_suffix_empty_space_widget.dart';
import 'package:bunny_sync/global/widgets/main_error_widget.dart';
import 'package:bunny_sync/global/widgets/main_show_bottom_sheet.dart';
import 'package:bunny_sync/global/widgets/main_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

abstract class KitsTabCallbacks {
  void onAddKitTap();

  void onEditKitTap(KitModel kit);

  void onDeleteKitTap(KitModel kit);

  void onTryAgainTap();

  void onKitMoreMenuTap(KitModel kit);

  void onKitLongPress(KitModel kit);
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
  void onAddKitTap() {
    context.router.push(
      AddKitRoute(
        litterId: widget.litterId,
      ),
    );
  }

  @override
  void onEditKitTap(KitModel kit) {
    context.router.popForced();
    context.router.push(
      AddKitRoute(
        litterId: widget.litterId,
        kitModel: kit,
      ),
    );
  }

  @override
  void onDeleteKitTap(KitModel kit) {
    context.router.popForced();
    mainShowBottomSheet(
      context,
      widget: BottomSheetWidget(
        title: 'are_you_sure_to_delete_kit'.i18n,
        model: kit,
        onConfirm: (kit) {
          context.router.popForced();
          litterDetailsCubit.deleteKit(
            litterId: widget.litterId,
            kitId: kit.id,
          );
        },
      ),
    );
  }

  @override
  void onTryAgainTap() {
    litterDetailsCubit.getLitterDetails(widget.litterId);
  }

  @override
  void onKitMoreMenuTap(KitModel kit) {
    mainShowBottomSheet(
      context,
      widget: BottomSheetWidget(
        title: 'kits_options'.i18n,
        onEdit: onEditKitTap,
        onDelete: onDeleteKitTap,
        model: kit,
      ),
    );
  }

  @override
  void onKitLongPress(KitModel kit) {
    onKitMoreMenuTap(kit);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocListener(
        listeners: [
          BlocListener<KitsCubit, GeneralKitsState>(
            listener: (context, state) {
              if (state is AddKitState) {
                litterDetailsCubit.addKit(state.kit);
              } else if (state is UpdateKitState) {
                litterDetailsCubit.updateKit(state.kit);
              }
            },
          ),
          BlocListener<LitterDetailsCubit, GeneralLitterDetailsState>(
            listener: (context, state) {
              if (state is DeleteKitState) {
                MainSnackBar.showSuccessMessageBar(
                  context,
                  'kit_deleted'.i18n,
                );
              }
            },
          ),
        ],
        child: BlocBuilder<LitterDetailsCubit, GeneralLitterDetailsState>(
          builder: (context, state) {
            if (state is LitterDetailsFetch) {
              final properties = [
                RabbitPropertyModel(
                  title: "total_weight".i18n,
                  value:
                      state.litterDetailsResponseModel.totalWeight.toString(),
                ),
                RabbitPropertyModel(
                  title: "average_weight".i18n,
                  value: state.litterDetailsResponseModel.averegeWeight == null
                      ? "unknown".i18n
                      : state.litterDetailsResponseModel.averegeWeight
                          .toString(),
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
                  value: state.litterDetailsResponseModel.diedLittersCount
                      .toString(),
                ),
                RabbitPropertyModel(
                  title: "survival_rate".i18n,
                  value:
                      state.litterDetailsResponseModel.survivalRate.toString(),
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
                            itemCount: state
                                .litterDetailsResponseModel.litter.kits.length,
                            itemBuilder: (context, index) {
                              final item = state.litterDetailsResponseModel
                                  .litter.kits[index];
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
                                onMoreMenu: () {
                                  onKitMoreMenuTap(item);
                                },
                                onLongPress: () {
                                  onKitLongPress(item);
                                },
                              );
                            },
                          ),
                        ),
                        ListSuffixEmptySpaceWidget(
                          length: state
                              .litterDetailsResponseModel.litter.kits.length,
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
        ),
      ),
      floatingActionButton: MainAddFloatingButton(
        onAddTap: onAddKitTap,
      ),
    );
  }
}
