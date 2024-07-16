import 'package:bunny_sync/global/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/date_picker_theme.dart';
import 'package:flutter_holo_date_picker/widget/date_picker_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainDatePicker extends StatelessWidget {
  const MainDatePicker({
    super.key,
    this.initialDate,
    required this.onChange,
  });

  final DateTime? initialDate;
  final Function(DateTime, List<int>) onChange;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 0.7.sw,
      child: DatePickerWidget(
        initialDate: initialDate,
        looping: true,
        dateFormat: "dd/MMM/yyyy",
        onChange: onChange,
        pickerTheme: DateTimePickerTheme(
          itemTextStyle: context.tt.bodyLarge?.copyWith(
                fontSize: 18,
                color: context.cs.secondaryContainer,
                fontWeight: FontWeight.w700,
              ) ??
              const TextStyle(),
          dividerColor: context.cs.secondaryContainer,
        ),
      ),
    );
  }
}
