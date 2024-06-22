import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class IndexedListSlideFadeAnimatedTile extends StatelessWidget {
  const IndexedListSlideFadeAnimatedTile({
    super.key,
    required this.index,
    required this.child,
  });

  final int index;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
      position: index,
      delay: const Duration(milliseconds: 200),
      duration: const Duration(milliseconds: 500),
      child: SlideAnimation(
        child: FadeInAnimation(
          child: child,
        ),
      ),
    );
  }
}
