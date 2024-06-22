import 'package:bunny_sync/global/models/rabbit_property_model.dart';
import 'package:flutter/material.dart';

class BreederDetailsTile extends StatelessWidget {
  const BreederDetailsTile(
      {super.key, required this.tileColor, required this.rabbitProperty,});

  final Color tileColor;
  final RabbitPropertyModel rabbitProperty;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(color: tileColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              rabbitProperty.title,
              style: const TextStyle(
                color: Color.fromRGBO(23, 26, 31, 1),
                fontSize: 14,
                fontWeight: FontWeight.w400,
                height: 1.22,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Text(
              rabbitProperty.value,
              style: const TextStyle(
                color: Color.fromRGBO(109, 49, 237, 1),
                fontSize: 14,
                fontWeight: FontWeight.w400,
                height: 1.22,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
