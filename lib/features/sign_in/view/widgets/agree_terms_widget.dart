import 'package:bunny_sync/global/localization/localization.dart';
import 'package:flutter/material.dart';

class AgreeTermsWidget extends StatefulWidget {
  const AgreeTermsWidget({
    super.key,
    this.isChecked = false,
  });

  final bool isChecked;

  @override
  State<AgreeTermsWidget> createState() => _AgreeTermsWidgetState();
}

class _AgreeTermsWidgetState extends State<AgreeTermsWidget> {
  late bool isChecked = widget.isChecked;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: SizedBox(
        width: 300,
        child: Row(
          children: [
            Checkbox(
              value: widget.isChecked,
              onChanged: (isChecked) {
                setState(() {
                  if (isChecked != null) {
                    this.isChecked = isChecked;
                  }
                });
              },
            ),
            Text('i_agree_with_terms'.i18n),
          ],
        ),
      ),
    );
  }
}
