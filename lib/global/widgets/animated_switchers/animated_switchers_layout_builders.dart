part of 'animated_switchers.dart';

abstract class AnimatedSwitchersLayoutBuilders {
  static AnimatedSwitcherLayoutBuilder row({
    MainAxisSize mainAxisSize = MainAxisSize.max,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
  }) {
    return (Widget? currentChild, List<Widget> previousChildren) {
      return Row(
        mainAxisSize: mainAxisSize,
        mainAxisAlignment: mainAxisAlignment,
        children: <Widget>[
          ...previousChildren,
          if (currentChild != null) currentChild,
        ],
      );
    };
  }

  static AnimatedSwitcherLayoutBuilder column({
    MainAxisSize mainAxisSize = MainAxisSize.max,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
  }) {
    return (Widget? currentChild, List<Widget> previousChildren) {
      return Column(
        mainAxisSize: mainAxisSize,
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        children: <Widget>[
          ...previousChildren,
          if (currentChild != null) currentChild,
        ],
      );
    };
  }

  static AnimatedSwitcherLayoutBuilder stack({
    AlignmentGeometry alignment = Alignment.center,
  }) {
    return (Widget? currentChild, List<Widget> previousChildren) {
      return Stack(
        alignment: alignment,
        children: <Widget>[
          ...previousChildren,
          if (currentChild != null) currentChild,
        ],
      );
    };
  }
}
