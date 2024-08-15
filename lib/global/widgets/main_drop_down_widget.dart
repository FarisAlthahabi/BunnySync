import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

abstract class DropDownItemModel {
  String get displayName;

  int get id;
}

class MainDropDownWidget<T extends DropDownItemModel> extends StatefulWidget {
  const MainDropDownWidget({
    super.key,
    required this.text,
    required this.onChanged,
    required this.items,
    this.selectedValue,
  });

  final String text;
  final ValueSetter<T?> onChanged;
  final List<T> items;
  final T? selectedValue;

  @override
  State<MainDropDownWidget<T>> createState() => _MainDropDownWidgetState<T>();
}

class _MainDropDownWidgetState<T extends DropDownItemModel>
    extends State<MainDropDownWidget<T>> {
  late T? selectedValue = widget.selectedValue;

  @override
  void didUpdateWidget(covariant MainDropDownWidget<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    setState(() {
      selectedValue = widget.selectedValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<T>(
        dropdownStyleData: const DropdownStyleData(maxHeight: 200),
        isExpanded: true,
        value: selectedValue,
        hint: Text(
          widget.text,
          style: TextStyle(
            fontSize: 14,
            color: Theme.of(context).hintColor,
          ),
        ),
        items: widget.items
            .map(
              (T item) => DropdownMenuItem<T>(
                value: item,
                child: Text(
                  item.displayName,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
            )
            .toList(),
        onChanged: (value) {
          setState(() {
            selectedValue = value;
          });
          widget.onChanged(value);
        },
      ),
    );
  }
}
