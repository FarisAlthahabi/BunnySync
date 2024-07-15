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

abstract class NotesTabCallbacks {
  void onTryAgainTap();
}

class NotesTab extends StatefulWidget {
  const NotesTab({
    super.key,
    required this.breederId,
  });

  final int breederId;

  @override
  State<NotesTab> createState() => _NotesTabState();
}

class _NotesTabState extends State<NotesTab>
    implements NotesTabCallbacks {
  late final BreederDetailsCubit breederDetailsCubit = context.read();

  @override
  void initState() {
    super.initState();

    breederDetailsCubit.getBreederNotes(widget.breederId);
  }

  @override
  void onTryAgainTap() {
    breederDetailsCubit.getBreederNotes(widget.breederId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BreederDetailsCubit, GeneralBreederDetailsState>(
      buildWhen: (prev, curr) => curr is BreederNotesState,
      builder: (context, state) {
        if (state is BreederNotesFetch) {
          final rabbitProperties = [
            RabbitPropertyModel(
              title: 'title'.i18n,
              value: state.breederNotes[0].title,
            ),
            RabbitPropertyModel(
              title: 'note'.i18n,
              value: state.breederNotes[0].note,
            ),
          ];
          return Skeletonizer(
            enabled: state is BreederNotesLoading,
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
                        itemCount: 2,
                        itemBuilder: (context, index) {
                          final item = state.breederNotes[0];
                          final rabbitDetailsProperties = [
                            RabbitPropertyModel(
                              title: 'Title',
                              value: item.title,
                            ),
                            RabbitPropertyModel(
                              title: 'Note',
                              value: item.note,
                            ),
                          ];
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
        } else if (state is BreederNotesEmpty) {
          return Center(
            child: Text(
              state.message,
              style: context.tt.bodyLarge,
            ),
          );
        } else if (state is BreederNotesFail) {
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
