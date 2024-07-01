import 'package:bunny_sync/global/theme/theme.dart';
import 'package:flutter/material.dart';

class RadioButton<T> extends StatelessWidget {
  const RadioButton({
    super.key,
    required this.value,
    required this.toggleable,
    this.onChanged,
    this.groupValue,
  });

  final T value;
  final bool toggleable;
  final ValueChanged<T?>? onChanged;
  final T? groupValue;

  @override
  Widget build(BuildContext context) {
    return Radio<T>(
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return context.cs.primary;
        }
        return context.cs.onSurface;
      }),
      value: value,
      groupValue: groupValue,
      toggleable: toggleable,
      onChanged: onChanged,
    );
  }
}
