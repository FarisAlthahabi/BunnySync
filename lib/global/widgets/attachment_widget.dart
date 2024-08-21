import 'package:bunny_sync/global/localization/localization.dart';
import 'package:flutter/material.dart';

class AttachmentWidget extends StatelessWidget {
  const AttachmentWidget({
    super.key,
    required this.onTap,
    this.readOnly = false,
    this.filePath,
  });

  final VoidCallback onTap;
  final bool readOnly;
  final String? filePath;

  @override
  Widget build(BuildContext context) {
    final filePath = this.filePath;

    return InkWell(
      onTap: readOnly ? null : onTap,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).colorScheme.onSurface),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Row(
          children: [
            Row(
              children: [
                Text(
                  filePath == null ? 'choose_file'.i18n : 'chosen_file'.i18n,
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).hintColor,
                  ),
                ),
                const SizedBox(width: 8),
              ],
            ),
            if (filePath != null)
              Expanded(
                child: Text(
                  filePath,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
