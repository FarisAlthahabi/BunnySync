import 'package:auto_route/auto_route.dart';
import 'package:bunny_sync/features/add_note/cubit/add_note_cubit.dart';
import 'package:bunny_sync/global/blocs/note_cubit/cubit/notes_cubit.dart';
import 'package:bunny_sync/global/di/di.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/buttons/main_action_button.dart';
import 'package:bunny_sync/global/widgets/loading_indicator.dart';
import 'package:bunny_sync/global/widgets/main_app_bar.dart';
import 'package:bunny_sync/global/widgets/main_snack_bar.dart';
import 'package:bunny_sync/global/widgets/main_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class AddNoteViewCallBack {
  void onTitleChanged(String title);

  void onTitleSubmitted(String title);

  void onNoteChanged(String note);

  void onNoteSubmitted(String note);

  void onSave();
}

@RoutePage()
class AddNoteView extends StatelessWidget {
  const AddNoteView({
    super.key,
    required this.notesCubit,
    this.breederId,
    this.litterId,
  });

  final int? breederId;
  final int? litterId;
  final NotesCubit notesCubit;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => get<AddNoteCubit>(),
        ),
        BlocProvider.value(value: notesCubit),
      ],
      child: AddNotePage(
        breederId: breederId,
        litterId: litterId,
      ),
    );
  }
}

class AddNotePage extends StatefulWidget {
  const AddNotePage({
    super.key,
    required this.breederId,
    this.litterId,
  });

  final int? breederId;
  final int? litterId;

  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage>
    implements AddNoteViewCallBack {
  late final AddNoteCubit addNoteCubit = context.read();

  late final NotesCubit notesCubit = context.read();

  final titleFocusNode = FocusNode();

  final noteFocusNode = FocusNode();

  @override
  void onNoteChanged(String note) {
    addNoteCubit.setNote(note);
  }

  @override
  void onNoteSubmitted(String note) {
    onSave();
  }

  @override
  void onTitleChanged(String title) {
    addNoteCubit.setTitle(title);
  }

  @override
  void onTitleSubmitted(String title) {
    noteFocusNode.requestFocus();
  }

  @override
  void onSave() {
    addNoteCubit.addNote(
      breederId: widget.breederId,
      litterId: widget.litterId,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: Text(
          'new_note'.i18n,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: AppConstants.paddingH16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    MainTextField(
                      onSubmitted: onTitleSubmitted,
                      onChanged: onTitleChanged,
                      focusNode: titleFocusNode,
                      hintText: "title".i18n,
                      labelText: "title".i18n,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    MainTextField(
                      onSubmitted: onNoteSubmitted,
                      onChanged: onNoteChanged,
                      focusNode: noteFocusNode,
                      hintText: "note".i18n,
                      labelText: "note".i18n,
                      maxLines: 7,
                    ),
                  ],
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: AppConstants.paddingH16,
                  child: SizedBox(
                    width: double.maxFinite,
                    child: BlocConsumer<AddNoteCubit, GeneralAddNoteState>(
                      listener: (context, state) {
                        if (state is AddNoteSuccess) {
                          MainSnackBar.showSuccessMessageBar(
                            context,
                            "note_added".i18n,
                          );
                          context.router.maybePop();
                          notesCubit.addNote(
                            state.note,
                          );
                        } else if (state is AddNoteFail) {
                          MainSnackBar.showErrorMessageBar(
                            context,
                            state.message,
                          );
                        }
                      },
                      builder: (context, state) {
                        var onTap = onSave;
                        Widget? child;
                        if (state is AddNoteLoading) {
                          onTap = () {};
                          child = const LoadingIndicator();
                        }
                        return MainActionButton(
                          onTap: onTap,
                          text: "save".i18n,
                          child: child,
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
