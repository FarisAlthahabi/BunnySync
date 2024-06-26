import 'package:flutter/material.dart';

class MainActionButton extends StatelessWidget {
  const MainActionButton({
    super.key,
    required this.text,
    required this.onTap,
    this.textStyle,
    this.child,
  });

  final String text;
  final VoidCallback onTap;
  final TextStyle? textStyle;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: child ??
          Text(
            text,
            style: textStyle,
          ),
    );
  }
}
