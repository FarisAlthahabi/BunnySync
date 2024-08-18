import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppConstants {
  static const value8 = 8.0;
  static const value12 = 12.0;
  static const imageRadius = 8.0;

  static const http = 'http';
  static const storage = 'storage';

  static final borderRadius5 = BorderRadius.circular(5);
  static const borderRadius8 = BorderRadius.all(Radius.circular(8));
  static final borderRadius10 = BorderRadius.circular(10);
  static const borderRadius12 = BorderRadius.all(Radius.circular(12));
  static final borderRadius15 = BorderRadius.circular(15);
  static const borderRadius16 = BorderRadius.all(Radius.circular(16));
  static const borderRadius18 = BorderRadius.all(Radius.circular(18));
  static final borderRadius20 = BorderRadius.circular(20);
  static final circularBorderRadius = BorderRadius.circular(100);

  static const topCornersBorderRadius = BorderRadius.only(
    topRight: Radius.circular(15),
    topLeft: Radius.circular(15),
  );
  static const bottomCornersBorderRadius = BorderRadius.only(
    bottomRight: Radius.circular(15),
    bottomLeft: Radius.circular(15),
  );

  static const radius20 = Radius.circular(20);

  static final double collapsedAppBarHeight = 90.h;

  static const defaultDuration = Duration(milliseconds: 200);

  static const duration100ms = Duration(milliseconds: 100);
  static const duration150ms = Duration(milliseconds: 150);
  static const duration200ms = Duration(milliseconds: 200);
  static const duration300ms = Duration(milliseconds: 300);
  static const duration400ms = Duration(milliseconds: 400);
  static const duration1s = Duration(seconds: 1);
  static const duration2s = Duration(seconds: 2);

  static const searchHeroTag = 'searchHeroTag';

  static const padding4 = EdgeInsets.all(4);

  static const padding3 = EdgeInsets.all(3);

  static const padding6 = EdgeInsets.all(6);

  static const padding10 = EdgeInsets.all(10);

  static const padding12 = EdgeInsets.all(12);

  static const padding16 = EdgeInsets.all(16);

  static const padding20 = EdgeInsets.all(20);

  static const padding24 = EdgeInsets.all(24);

  static const padding30 = EdgeInsets.all(30);

  static const padding40 = EdgeInsets.all(40);

  static const paddingT16 = EdgeInsets.only(top: 16);

  static const paddingH2 = EdgeInsets.symmetric(horizontal: 4);

  static const paddingH5 = EdgeInsets.symmetric(horizontal: 4);

  static const paddingH16 = EdgeInsets.symmetric(horizontal: 16);

  static const paddingH8 = EdgeInsets.symmetric(horizontal: 8);

  static const paddingH24 = EdgeInsets.symmetric(horizontal: 24);

  static const paddingV12 = EdgeInsets.symmetric(vertical: 12);

  static const paddingH16V10 = EdgeInsets.symmetric(
    horizontal: 16,
    vertical: 10,
  );

  static const paddingH16V20 = EdgeInsets.symmetric(
    horizontal: 16,
    vertical: 20,
  );

  static const paddingH16V28 = EdgeInsets.symmetric(
    horizontal: 16,
    vertical: 28,
  );

  static const paddingH28 = EdgeInsets.symmetric(horizontal: 28);

  static const paddingLRB16 = EdgeInsets.only(
    left: 16,
    right: 16,
    bottom: 16,
  );

  static const paddingSB16 = EdgeInsetsDirectional.only(
    start: 16,
    bottom: 16,
  );

  static const paddingTE16 = EdgeInsetsDirectional.only(
    top: 16,
    end: 16,
  );

  static const paddingB10 = EdgeInsetsDirectional.only(
    bottom: 10,
  );

  static const dialogPadding = EdgeInsets.only(
    left: 16,
    top: 16,
    right: 16,
    bottom: 24,
  );

  static const textFieldContentPadding = EdgeInsets.symmetric(
    horizontal: 16,
    vertical: 9,
  );
}
