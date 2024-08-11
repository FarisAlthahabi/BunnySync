import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class IndexedGridScaleFadeAnimatedTile extends StatelessWidget {
  const IndexedGridScaleFadeAnimatedTile({
    super.key,
    required this.index,
    required this.columnCount,
    required this.child,
    required this.onTap,
    this.duration,
  });

  final int index;
  final int columnCount;
  final Widget child;
  final VoidCallback onTap;
  final Duration? duration;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: AnimationConfiguration.staggeredGrid(
        position: index,
        duration: const Duration(milliseconds: 700),
        columnCount: columnCount,
        child: ScaleAnimation(
          duration: duration,
          child: FadeInAnimation(
            duration: duration,
            child: child,
          ),
        ),
      ),
    );
  }
}
