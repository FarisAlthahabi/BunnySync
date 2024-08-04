import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

abstract class DropDownItemModel {
  String get name;

  int get id;
}

class MainDropDownWidget<T extends DropDownItemModel> extends StatelessWidget {
  const MainDropDownWidget({
    super.key,
    required this.text,
    required this.onChanged,
    required this.items,
    required this.selectedValue,
  });

  final String text;
  final ValueSetter<T?> onChanged;
  final List<T> items;
  final T? selectedValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<T>(
        dropdownStyleData: const DropdownStyleData(maxHeight: 200),
        isExpanded: true,
        value: selectedValue,
        hint: Text(
          text,
          style: TextStyle(
            fontSize: 14,
            color: Theme.of(context).hintColor,
          ),
        ),
        items: items
            .map(
              (T item) => DropdownMenuItem<T>(
                value: item,
                child: Text(
                  item.name,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
            )
            .toList(),
        onChanged: onChanged,
      ),
    );
  }
}
