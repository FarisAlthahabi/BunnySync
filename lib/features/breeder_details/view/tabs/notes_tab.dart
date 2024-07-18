import 'package:bunny_sync/features/breeder_details/cubit/breeder_details_cubit.dart';
import 'package:bunny_sync/features/breeder_details/view/widgets/breeder_details_tile.dart';
import 'package:bunny_sync/global/models/rabbit_property_model.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/main_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

abstract class NotesTabCallbacks {
  void onTryAgainTap();

  void onAddTap();
}

class NotesTab extends StatefulWidget {
  const NotesTab({
    super.key,
    required this.breederId,
    this.controller,
  });

  final int breederId;
  final ScrollController? controller;

  @override
  State<NotesTab> createState() => _NotesTabState();
}

class _NotesTabState extends State<NotesTab> implements NotesTabCallbacks {
  late final BreederDetailsCubit breederDetailsCubit = context.read();

  @override
  void initState() {
    super.initState();

    breederDetailsCubit.getBreederNotes(widget.breederId);
  }

  @override
  void onAddTap() {
    // TODO: implement onAddTap
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
          return Scaffold(
            body: Skeletonizer(
              enabled: state is BreederNotesLoading,
              child: SingleChildScrollView(
                controller: widget.controller,
                child: Padding(
                  padding: AppConstants.padding24,
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: context.cs.onInverseSurface,
                          ),
                        ),
                        child: ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: state.breederNotes.length * 2,
                          itemBuilder: (context, index) {
                           // final item = state.breederNotes[0];
                            final noteTitles = List.generate(
                              state.breederNotes.length,
                              (ind) => RabbitPropertyModel(
                                title: 'Title',
                                value: state.breederNotes[ind].title,
                              ),
                            );
                            final noteValues = List.generate(
                              state.breederNotes.length,
                              (ind) => RabbitPropertyModel(
                                title: 'Note',
                                value: state.breederNotes[ind].note,
                              ),
                            );
                            final List<RabbitPropertyModel> notes = [];
                            for (int i = 0;
                                i < state.breederNotes.length;
                                i++) {
                              notes.add(noteTitles[i]);
                              notes.add(noteValues[i]);
                            }
                            // final rabbitDetailsProperties = [
                            //   RabbitPropertyModel(
                            //     title: 'Title',
                            //     value: item.title,
                            //   ),
                            //   RabbitPropertyModel(
                            //     title: 'Note',
                            //     value: item.note,
                            //   ),
                            // ];
                            Color tileColor;
                            if (index.isEven) {
                              tileColor = context.cs.surface;
                            } else {
                              tileColor = context.cs.onInverseSurface;
                            }
                            return BreederDetailsTile(
                              rabbitProperty: notes[index],
                              tileColor: tileColor,
                            );
                          },
                          separatorBuilder: (context, index) {
                            if (index.isOdd) {
                              return const SizedBox(height: 20);
                            } else {
                              return const SizedBox();
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            floatingActionButton: Padding(
              padding: AppConstants.padding16,
              child: FloatingActionButton(
                onPressed: onAddTap,
                shape: RoundedRectangleBorder(
                  borderRadius: AppConstants.circularBorderRadius,
                ),
                backgroundColor: context.cs.secondaryContainer,
                child: const Icon(Icons.add),
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
          return MainErrorWidget(
            error: state.message,
            onTap: onTryAgainTap,
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
