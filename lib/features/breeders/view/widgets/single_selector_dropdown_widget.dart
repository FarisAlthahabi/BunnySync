import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/radio_selector_widget.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class SingleSelectorDropdownWidget<T extends RadioSelectorItemModel>
    extends StatefulWidget {
  const SingleSelectorDropdownWidget({
    super.key,
    required this.hint,
    required this.onSelect,
    required this.items,
    this.width = 110,
    this.height = 38,
    this.selected,
  });

  final String hint;
  final ValueChanged<T?> onSelect;
  final List<T> items;
  final double width;
  final double height;
  final T? selected;

  @override
  State<SingleSelectorDropdownWidget<T>> createState() =>
      _SingleSelectorDropdownWidgetState<T>();
}

class _SingleSelectorDropdownWidgetState<T extends RadioSelectorItemModel>
    extends State<SingleSelectorDropdownWidget<T>> {
  late T? selected = widget.selected;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<T>(
        value: selected,
        dropdownStyleData: DropdownStyleData(
          width: widget.width,
          decoration: const BoxDecoration(
            borderRadius: AppConstants.borderRadius8,
          ),
        ),
        isDense: true,
        alignment: Alignment.center,
        buttonStyleData: ButtonStyleData(
          height: widget.height,
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: context.cs.onSurface,
            ),
            borderRadius: AppConstants.borderRadius8,
          ),
        ),
        hint: Text(
          widget.hint,
          style: context.tt.titleSmall,
        ),
        selectedItemBuilder: (context) {
          return widget.items
              .map(
                (item) => Text(
                  item.displayName,
                  style: context.tt.titleSmall,
                ),
              )
              .toList();
        },
        items: widget.items
            .map(
              (item) => DropdownMenuItem<T>(
                value: item,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IgnorePointer(
                      child: Checkbox(
                        visualDensity: VisualDensity.compact,
                        value: item == selected,
                        onChanged: (value) {},
                      ),
                    ),
                    Text(
                      item.displayName,
                      style: context.tt.titleSmall,
                    ),
                  ],
                ),
              ),
            )
            .toList(),
        onChanged: (value) {
          setState(() {
            selected = selected == value ? null : value;
          });
          widget.onSelect(selected);
        },
      ),
    );
  }
}
