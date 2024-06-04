import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppConstants {
  static const radius = 8.0;
  static const imageRadius = 8.0;

  static const http = 'http';
  static const storage = 'storage';

  static final borderRadius5 = BorderRadius.circular(5);
  static final borderRadius8 = BorderRadius.circular(8);
  static final borderRadius10 = BorderRadius.circular(10);
  static final borderRadius15 = BorderRadius.circular(15);
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

  static const searchHeroTag = 'searchHeroTag';

  static const padding16 = EdgeInsets.only(
  left: 16,
  top: 16,
  right: 16,
  bottom: 16,
  );

  static const paddingWithoutTop16 = EdgeInsets.only(
  left: 16,
  right: 16,
  bottom: 16,
  );

  static const dialogPadding = EdgeInsets.only(
  left: 16,
  top: 16,
  right: 16,
  bottom: 24,
  );

  static const textFieldContentPadding = EdgeInsets.symmetric(
  horizontal: 16,
  vertical: 14,
  );

  static const phoneNumberPrefix = '09';
}
