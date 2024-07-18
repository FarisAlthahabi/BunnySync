import 'package:bunny_sync/global/utils/app_constants.dart';
import 'package:bunny_sync/global/widgets/buttons/radio_button.dart';
import 'package:flutter/material.dart';

abstract class RadioSelectorItemModel {
  dynamic get value;
  
  String get displayName;
}

class RadioSelectorWidget<T extends RadioSelectorItemModel>
    extends StatefulWidget {
  const RadioSelectorWidget({
    super.key,
    required this.items,
    required this.onSelected,
    this.selected,
    this.childOnSelectedBuilder,
  });

  final List<T> items;
  final T? selected;
  final void Function(T) onSelected;
  final Widget Function(T?)? childOnSelectedBuilder;

  @override
  State<RadioSelectorWidget<T>> createState() => _RadioSelectorWidgetState<T>();
}

class _RadioSelectorWidgetState<T extends RadioSelectorItemModel>
    extends State<RadioSelectorWidget<T>> {
  late T? selected = widget.selected;

  bool isItemSelected(RadioSelectorItemModel item) =>
      selected?.value == item.value;

  @override
  void didUpdateWidget(RadioSelectorWidget<T> oldWidget) {
    super.didUpdateWidget(oldWidget);

    setState(() {
      selected = widget.selected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        for (final item in widget.items)
          InkWell(
            borderRadius: AppConstants.borderRadius12,
            onTap: () {
              setState(() {
                selected = item;
                widget.onSelected(item);
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 11,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 10,
                    height: 10,
                    child: RadioButton<dynamic>(
                      value: item.value,
                      groupValue: selected?.value,
                      toggleable: true,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Text(item.displayName),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
