import 'package:auto_route/auto_route.dart';
import 'package:bunny_sync/features/breeder_details/cubit/breeder_details_cubit.dart';
import 'package:bunny_sync/features/breeder_details/models/breeder_note_model/breeder_note_model.dart';
import 'package:bunny_sync/features/breeder_details/view/widgets/breeder_note_details_tile.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/router/router.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/bottom_sheet_widget.dart';
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

  void onNoteTap(BreederNoteModel breederNoteModel);

  void onEditTap(BreederNoteModel breederNoteModel);

  void onDeleteTap(BreederNoteModel breederNoteModel);
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
    context.router.push(
      AddNoteRoute(
        breederId: widget.breederId,
        breederDetailsCubit: breederDetailsCubit,
      ),
    );
  }

  @override
  void onTryAgainTap() {
    breederDetailsCubit.getBreederNotes(widget.breederId);
  }

  @override
  void onDeleteTap(BreederNoteModel breederNoteModel) {
    context.router.popForced();
    mainShowBottomSheet(
      context,
      widget: BottomSheetWidget(
        title: 'are_you_sure_to_delete_note'.i18n,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
              onPressed: () {
                context.router.popForced();
                breederDetailsCubit.deleteNote(breederNoteModel.id);
              },
              child: Text('yes'.i18n),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void onEditTap(BreederNoteModel breederNoteModel) {
    // TODO: implement onEditTap
  }

  @override
  void onNoteTap(BreederNoteModel breederNoteModel) {
    mainShowBottomSheet(
      context,
      widget: BottomSheetWidget(
        title: "note_options".i18n,
        model: breederNoteModel,
        onDelete: onDeleteTap,
        onEdit: onEditTap,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<BreederDetailsCubit, GeneralBreederDetailsState>(
        listener: (context, state) {
          if (state is BreederNoteDeleteSuccess) {
            MainSnackBar.showSuccessMessageBar(
              context,
              "note_deleted".i18n,
            );
            context.loaderOverlay.hide();
          } else if (state is BreederNoteDeleteFail) {
            MainSnackBar.showErrorMessageBar(
              context,
              "note_delete_fail".i18n,
            );
            context.loaderOverlay.hide();
          } else if (state is BreederNoteAddLoading) {
            context.loaderOverlay.show();
          }
        },
        buildWhen: (prev, curr) => curr is BreederNotesState,
        builder: (context, state) {
          if (state is BreederNotesFetch) {
            return Skeletonizer(
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
                          itemCount: state.breederNotes.length,
                          itemBuilder: (context, index) {
                            Color tileColor;
                            if (index.isEven) {
                              tileColor = context.cs.surface;
                            } else {
                              tileColor = context.cs.onInverseSurface;
                            }
                            return BreederNoteDetailsTile(
                              breederNoteModel: state.breederNotes[index],
                              tileColor: tileColor,
                              onTap: () => onNoteTap(state.breederNotes[index]),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const Divider(
                              thickness: 1,
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
            return MainErrorWidget(
              error: state.message,
              onTap: onTryAgainTap,
            );
          }
          return const SizedBox.shrink();
        },
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
  }
}
