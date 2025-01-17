import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/models/note_model/note_model.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:flutter/material.dart';

class BreederNoteDetailsTile extends StatelessWidget {
  const BreederNoteDetailsTile({
    super.key,
    required this.tileColor,
    required this.noteModel,
    required this.onTap,
  });

  final Color tileColor;
  final NoteModel noteModel;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: tileColor,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                  child: Text(
                    'title'.i18n,
                    style: TextStyle(color: context.cs.primary),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Text(
                      noteModel.title,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 13,
                    ),
                    child: Text(
                      'note'.i18n,
                      style: TextStyle(color: context.cs.primary),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Text(
                        noteModel.note,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
