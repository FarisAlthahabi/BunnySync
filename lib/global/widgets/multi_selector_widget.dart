import 'package:bunny_sync/global/extensions/string_x.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:flutter/material.dart';

abstract class MultiSelectorItemModel {
  MultiSelectorItemModel({required this.title, required this.icon});

  final String title;
  final String icon;
}

class MultiSelectorWidget<T extends MultiSelectorItemModel>
    extends StatefulWidget {
  const MultiSelectorWidget({
    super.key,
    required this.options,
    required this.onChecked,
  });

  final List<T> options;
  final ValueChanged<List<T>> onChecked;

  @override
  State<MultiSelectorWidget<T>> createState() => _MultiSelectorWidgetState<T>();
}

class _MultiSelectorWidgetState<T extends MultiSelectorItemModel>
    extends State<MultiSelectorWidget<T>> {
  List<T> selected = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.options.asMap().entries.map(
        (option) {
          return Column(
            children: [
              CheckboxListTile(
                secondary: option.value.icon.svg(),
                tileColor:
                    option.key.isOdd ? context.cs.onInverseSurface : null,
                title: Text(option.value.title),
                value: selected.contains(option.value),
                onChanged: (value) {
                  setState(() {
                    if (value == true) {
                      selected.add(option.value);
                    } else {
                      selected.remove(option.value);
                    }
                    widget.onChecked(selected);
                  });
                },
              ),
              const SizedBox(height: 20),
            ],
          );
        },
      ).toList(),
    );
  }
}
