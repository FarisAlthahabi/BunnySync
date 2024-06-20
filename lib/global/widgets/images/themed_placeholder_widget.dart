import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/widgets/images/shimmer_placeholder_widget.dart';
import 'package:flutter/material.dart';

class ThemedPlaceholderWidget extends StatelessWidget {
  const ThemedPlaceholderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ShimmerPlaceHolderWidget(
      backgroundColor: context.cs.surface,
      highlightColor: context.cs.surfaceTint,
    );
  }
}
