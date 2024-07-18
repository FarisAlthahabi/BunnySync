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

abstract class PedigreeTabCallbacks {
  void onTryAgainTap();
}

class PedigreeTab extends StatefulWidget {
  const PedigreeTab({
    super.key,
    required this.breederId,
    this.controller,
  });

  final int breederId;
  final ScrollController? controller;

  @override
  State<PedigreeTab> createState() => _PedigreeTabState();
}

class _PedigreeTabState extends State<PedigreeTab>
    implements PedigreeTabCallbacks {
  late final BreederDetailsCubit breederDetailsCubit = context.read();

  @override
  void initState() {
    breederDetailsCubit.getBreederPedigree(widget.breederId);
    super.initState();
  }

  @override
  void onTryAgainTap() {
    breederDetailsCubit.getBreederPedigree(widget.breederId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BreederDetailsCubit, GeneralBreederDetailsState>(
      buildWhen: (prev, curr) => curr is BreederPedigreeState,
      builder: (context, state) {
        if (state is BreederPedigreeFetch) {
          final rabbitProperties = [
            RabbitPropertyModel(
              title: 'cage'.i18n,
              value: state.pedigreeModel.cage,
            ),
            RabbitPropertyModel(
              title: 'color'.i18n,
              value: state.pedigreeModel.color,
            ),
          ];
          final item = state.pedigreeModel;
          final rabbitDetailsProperties = [
            RabbitPropertyModel(
              title: 'status'.i18n,
              value: item.status.status,
            ),
            RabbitPropertyModel(
              title: 'cage'.i18n,
              value: item.cage,
            ),
            RabbitPropertyModel(
              title: 'Breed'.i18n,
              value: item.breed ?? 'breed',
            ),
            RabbitPropertyModel(
              title: 'Color'.i18n,
              value: item.color,
            ),
          ];
          return Skeletonizer(
            enabled: state is BreederPedigreeLoading,
            child: SingleChildScrollView(
              controller: widget.controller,
              physics: const AlwaysScrollableScrollPhysics(),
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
                        itemCount: rabbitDetailsProperties.length,
                        itemBuilder: (context, index) {
                          Color tileColor;
                          if (index.isEven) {
                            tileColor = context.cs.surface;
                          } else {
                            tileColor = context.cs.onInverseSurface;
                          }
                          return BreederDetailsTile(
                            rabbitProperty: rabbitDetailsProperties[index],
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
        } else if (state is BreederPedigreeFail) {
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
