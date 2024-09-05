import 'package:auto_route/auto_route.dart';
import 'package:bunny_sync/features/breeder_details/view/widgets/breeder_note_details_tile.dart';
import 'package:bunny_sync/global/blocs/note_cubit/cubit/notes_cubit.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/models/note_model/note_model.dart';
import 'package:bunny_sync/global/router/router.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/bottom_sheet_widget.dart';
import 'package:bunny_sync/global/widgets/buttons/main_add_floating_button.dart';
import 'package:bunny_sync/global/widgets/list_suffix_empty_space_widget.dart';
import 'package:bunny_sync/global/widgets/main_error_widget.dart';
import 'package:bunny_sync/global/widgets/main_show_bottom_sheet.dart';
import 'package:bunny_sync/global/widgets/main_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:skeletonizer/skeletonizer.dart';

abstract class NotesTabCallbacks {
  void onTryAgainTap();

  void onAddTap();

  void onNoteTap(NoteModel noteModel);

  void onDeleteTap(NoteModel noteModel);
}

class NotesTab extends StatefulWidget {
  const NotesTab({
    super.key,
    this.breederId,
    this.controller,
    this.litterId,
  });

  final int? breederId;
  final int? litterId;
  final ScrollController? controller;

  @override
  State<NotesTab> createState() => _NotesTabState();
}

class _NotesTabState extends State<NotesTab> implements NotesTabCallbacks {
  late final NotesCubit notesCubit = context.read();

  @override
  void initState() {
    super.initState();
    notesCubit.getNotes(
      breederId: widget.breederId,
      litterId: widget.litterId,
    );
  }

  @override
  void onAddTap() {
    context.router.push(
      AddNoteRoute(
        breederId: widget.breederId,
        litterId: widget.litterId,
        notesCubit: notesCubit,
      ),
    );
  }

  @override
  void onTryAgainTap() {
    notesCubit.getNotes(
      breederId: widget.breederId,
      litterId: widget.litterId,
    );
  }

  @override
  void onDeleteTap(NoteModel noteModel) {
    context.router.popForced();
    mainShowBottomSheet(
      context,
      widget: BottomSheetWidget(
        title: 'are_you_sure_to_delete_note'.i18n,
        model: noteModel,
        onConfirm: (noteModel) {
          context.router.popForced();
          notesCubit.deleteNote(
            breederId: widget.breederId != null ? noteModel.id : null,
            litterId: widget.litterId != null ? noteModel.id : null,
          );
        },
      ),
    );
  }

  @override
  void onNoteTap(NoteModel noteModel) {
    mainShowBottomSheet(
      context,
      widget: BottomSheetWidget(
        title: "note_options".i18n,
        model: noteModel,
        onDelete: onDeleteTap,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<NotesCubit, GeneralNotesState>(
        listener: (context, state) {
          if (state is DeleteNoteSuccess) {
            MainSnackBar.showSuccessMessageBar(
              context,
              "note_deleted".i18n,
            );
            context.loaderOverlay.hide();
          } else if (state is DeleteNoteFail) {
            MainSnackBar.showErrorMessageBar(
              context,
              "note_delete_fail".i18n,
            );
            context.loaderOverlay.hide();
          } else if (state is DeleteNoteLoading) {
            context.loaderOverlay.show();
          }
        },
        buildWhen: (prev, curr) => curr is NotesState,
        builder: (context, state) {
          if (state is NotesFetch) {
            return Skeletonizer(
              enabled: state is NotesLoading,
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
                          itemCount: state.notes.length,
                          itemBuilder: (context, index) {
                            Color tileColor;
                            if (index.isEven) {
                              tileColor = context.cs.surface;
                            } else {
                              tileColor = context.cs.onInverseSurface;
                            }
                            return BreederNoteDetailsTile(
                              noteModel: state.notes[index],
                              tileColor: tileColor,
                              onTap: () => onNoteTap(state.notes[index]),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const Skeleton.shade(
                              child: Divider(thickness: 1),
                            );
                          },
                        ),
                      ),
                      ListSuffixEmptySpaceWidget(
                        length: state.notes.length,
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else if (state is NotesEmpty) {
            return Center(
              child: Text(
                state.message,
                style: context.tt.bodyLarge,
              ),
            );
          } else if (state is NotesFail) {
            return MainErrorWidget(
              error: state.message,
              onTap: onTryAgainTap,
            );
          }
          return const SizedBox.shrink();
        },
      ),
      floatingActionButton: MainAddFloatingButton(
        onAddTap: onAddTap,
      ),
    );
  }
}
