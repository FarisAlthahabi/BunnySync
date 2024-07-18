import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

mixin CreateScrollListenerMixin<T extends StatefulWidget> on State<T> {
  bool isParentScrollingDownward = false;
  bool isParentScrollingUpward = false;

  VoidCallback createScrollListener({
    required ScrollController parent,
    required ScrollController child,
  }) {
    return () {
      child.addListener(() {
        if (child.position.userScrollDirection == ScrollDirection.reverse &&
            !isParentScrollingDownward) {
          parent.animateTo(
             200,
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeIn,
          );
          isParentScrollingDownward = true;
          isParentScrollingUpward = false;
        } else if (child.position.userScrollDirection ==
                ScrollDirection.forward &&
            !isParentScrollingUpward) {
          parent.animateTo(
            0,
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeIn,
          );
          isParentScrollingUpward = true;
          isParentScrollingDownward = false;
        }
      });
    };
  }
}
