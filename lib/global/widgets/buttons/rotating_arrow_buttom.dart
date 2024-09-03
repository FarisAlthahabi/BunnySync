import 'package:bunny_sync/global/theme/theme.dart';
import 'package:flutter/material.dart';

class RotatingArrowButton extends StatefulWidget {
  const RotatingArrowButton({super.key, required this.isExpanded});

  final bool isExpanded;

  @override
  State<RotatingArrowButton> createState() => _RotatingArrowButtonState();
}

class _RotatingArrowButtonState extends State<RotatingArrowButton> {
  late double turns = widget.isExpanded ? 0.5 : 0.25;

  @override
  void didUpdateWidget(covariant RotatingArrowButton oldWidget) {
    super.didUpdateWidget(oldWidget);

    setState(() {
      turns = widget.isExpanded ? 0.5 : 0.25;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedRotation(
      turns: turns,
      duration: const Duration(milliseconds: 175),
      child: Icon(
        Icons.keyboard_arrow_up_rounded,
        color: context.cs.tertiary,
      ),
    );
  }
}
