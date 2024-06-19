import 'package:flutter/material.dart';

part 'animated_switchers_layout_builders.dart';

class AnimatedSwitcherWithSize extends StatelessWidget {
  const AnimatedSwitcherWithSize({
    super.key,
    this.duration = const Duration(milliseconds: 175),
    this.layoutBuilder = AnimatedSwitcher.defaultLayoutBuilder,
    required this.child,
  });

  final Duration duration;
  final AnimatedSwitcherLayoutBuilder layoutBuilder;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: duration,
      layoutBuilder: layoutBuilder,
      transitionBuilder: (child, animation) {
        return SizeTransition(
          sizeFactor: animation,
          child: child,
        );
      },
      child: child,
    );
  }
}

class AnimatedSwitcherWithScale extends StatelessWidget {
  const AnimatedSwitcherWithScale({
    super.key,
    this.duration = const Duration(milliseconds: 400),
    this.layoutBuilder = AnimatedSwitcher.defaultLayoutBuilder,
    required this.child,
  });

  final Duration duration;
  final AnimatedSwitcherLayoutBuilder layoutBuilder;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: duration,
      layoutBuilder: layoutBuilder,
      transitionBuilder: (child, animation) {
        return ScaleTransition(
          scale: animation,
          child: child,
        );
      },
      child: child,
    );
  }
}

class AnimatedSwitcherWithFade extends StatelessWidget {
  const AnimatedSwitcherWithFade({
    super.key,
    this.duration = const Duration(milliseconds: 400),
    this.layoutBuilder = AnimatedSwitcher.defaultLayoutBuilder,
    required this.child,
  });

  final Duration duration;
  final AnimatedSwitcherLayoutBuilder layoutBuilder;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: duration,
      layoutBuilder: layoutBuilder,
      transitionBuilder: (child, animation) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      child: child,
    );
  }
}

class AnimatedSwitcherWithSlide extends StatelessWidget {
  const AnimatedSwitcherWithSlide({
    super.key,
    this.duration = const Duration(milliseconds: 400),
    this.layoutBuilder = AnimatedSwitcher.defaultLayoutBuilder,
    required this.child,
  });

  final Duration duration;
  final AnimatedSwitcherLayoutBuilder layoutBuilder;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: duration,
      layoutBuilder: layoutBuilder,
      transitionBuilder: (child, animation) {
        final offsetAnimation = Tween<Offset>(
          begin: const Offset(0.0, 1.0),
          end: Offset.zero,
        ).animate(animation);
        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
      child: child,
    );
  }
}
