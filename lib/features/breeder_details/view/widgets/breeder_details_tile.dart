import 'package:bunny_sync/global/models/rabbit_property_model.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:flutter/material.dart';

class BreederDetailsTile extends StatelessWidget {
  const BreederDetailsTile({
    super.key,
    required this.tileColor,
    required this.rabbitProperty,
  });

  final Color tileColor;
  final RabbitPropertyModel rabbitProperty;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: tileColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
            child: Text(
              rabbitProperty.title,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Text(
              rabbitProperty.value,
              style: TextStyle(color: context.cs.primary),
            ),
          ),
        ],
      ),
    );
  }
}
