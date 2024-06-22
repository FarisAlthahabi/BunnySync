import 'package:flutter/material.dart';

class IndicatorInfoWidget extends StatelessWidget {
  const IndicatorInfoWidget({
    super.key,
    required this.value,
    required this.color,
  });

  final String value;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5.5),
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          value,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ),
    );
  }
}
