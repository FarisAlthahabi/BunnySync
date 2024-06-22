import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class IndexedGridScaleFadeAnimatedTile extends StatelessWidget {
  const IndexedGridScaleFadeAnimatedTile({
    super.key,
    required this.index,
    required this.columnCount,
    required this.child,
  });

  final int index;
  final int columnCount;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredGrid(
      position: index,
      duration: const Duration(milliseconds: 700),
      columnCount: columnCount,
      child: ScaleAnimation(
        child: FadeInAnimation(
          child: child,
        ),
      ),
    );
  }
}
