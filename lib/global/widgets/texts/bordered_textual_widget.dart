import 'package:bunny_sync/global/theme/theme.dart';
import 'package:flutter/material.dart';

class BorderedTextualWidget extends StatelessWidget {
  const BorderedTextualWidget({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: context.cs.primary,
        ),
        color: context.cs.surface,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          text,
          style: context.tt.titleSmall?.copyWith(
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
