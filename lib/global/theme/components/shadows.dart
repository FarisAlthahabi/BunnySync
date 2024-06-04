import 'package:flutter/painting.dart';

abstract class AppShadows {
  static List<BoxShadow> createShadowsForColor(
    Color color, {
    int blurLevel = 3,
    double color1Opacity = 0.2,
    double color2Opacity = 0.14,
    double color3Opacity = 0.12,
  }) {
    final color1 =
        Color.fromRGBO(color.red, color.green, color.blue, color1Opacity);
    final color2 =
        Color.fromRGBO(color.red, color.green, color.blue, color2Opacity);
    final color3 =
        Color.fromRGBO(color.red, color.green, color.blue, color3Opacity);
    switch (blurLevel) {
      case 1:
        return [
          BoxShadow(
            offset: const Offset(0.0, 2.0),
            blurRadius: 1.0,
            spreadRadius: -1.0,
            color: color1,
          ),
          BoxShadow(
            offset: const Offset(0.0, 1.0),
            blurRadius: 1.0,
            // ignore: avoid_redundant_argument_values
            spreadRadius: 0.0,
            color: color2,
          ),
          BoxShadow(
            offset: const Offset(0.0, 1.0),
            blurRadius: 3.0,
            // ignore: avoid_redundant_argument_values
            spreadRadius: 0.0,
            color: color3,
          ),
        ];
      case 2:
        return [
          BoxShadow(
            offset: const Offset(0.0, 3.0),
            blurRadius: 1.0,
            spreadRadius: -2.0,
            color: color1,
          ),
          BoxShadow(
            offset: const Offset(0.0, 2.0),
            blurRadius: 2.0,
            // ignore: avoid_redundant_argument_values
            spreadRadius: 0.0,
            color: color2,
          ),
          BoxShadow(
            offset: const Offset(0.0, 1.0),
            blurRadius: 5.0,
            // ignore: avoid_redundant_argument_values
            spreadRadius: 0.0,
            color: color3,
          ),
        ];
      case 3:
        return [
          BoxShadow(
            offset: const Offset(0.0, 3.0),
            blurRadius: 3.0,
            spreadRadius: -2.0,
            color: color1,
          ),
          BoxShadow(
            offset: const Offset(0.0, 3.0),
            blurRadius: 4.0,
            // ignore: avoid_redundant_argument_values
            spreadRadius: 0.0,
            color: color2,
          ),
          BoxShadow(
            offset: const Offset(0.0, 1.0),
            blurRadius: 8.0,
            // ignore: avoid_redundant_argument_values
            spreadRadius: 0.0,
            color: color3,
          ),
        ];
      case 4:
        return [
          BoxShadow(
            offset: const Offset(0.0, 2.0),
            blurRadius: 4.0,
            spreadRadius: -1.0,
            color: color1,
          ),
          BoxShadow(
            offset: const Offset(0.0, 4.0),
            blurRadius: 5.0,
            // ignore: avoid_redundant_argument_values
            spreadRadius: 0.0,
            color: color2,
          ),
          BoxShadow(
            offset: const Offset(0.0, 1.0),
            blurRadius: 10.0,
            // ignore: avoid_redundant_argument_values
            spreadRadius: 0.0,
            color: color3,
          ),
        ];
      case 6:
        return [
          BoxShadow(
            offset: const Offset(0.0, 3.0),
            blurRadius: 5.0,
            spreadRadius: -1.0,
            color: color1,
          ),
          BoxShadow(
            offset: const Offset(0.0, 6.0),
            blurRadius: 10.0,
            // ignore: avoid_redundant_argument_values
            spreadRadius: 0.0,
            color: color2,
          ),
          BoxShadow(
            offset: const Offset(0.0, 1.0),
            blurRadius: 18.0,
            // ignore: avoid_redundant_argument_values
            spreadRadius: 0.0,
            color: color3,
          ),
        ];

      case 8:
        return [
          BoxShadow(
            offset: const Offset(0.0, 5.0),
            blurRadius: 5.0,
            spreadRadius: -3.0,
            color: color1,
          ),
          BoxShadow(
            offset: const Offset(0.0, 8.0),
            blurRadius: 10.0,
            spreadRadius: 1.0,
            color: color2,
          ),
          BoxShadow(
            offset: const Offset(0.0, 3.0),
            blurRadius: 14.0,
            spreadRadius: 2.0,
            color: color3,
          ),
        ];

      case 9:
        return [
          BoxShadow(
            offset: const Offset(0.0, 5.0),
            blurRadius: 6.0,
            spreadRadius: -3.0,
            color: color1,
          ),
          BoxShadow(
            offset: const Offset(0.0, 9.0),
            blurRadius: 12.0,
            spreadRadius: 1.0,
            color: color2,
          ),
          BoxShadow(
            offset: const Offset(0.0, 3.0),
            blurRadius: 16.0,
            spreadRadius: 2.0,
            color: color3,
          ),
        ];

      case 12:
        return [
          BoxShadow(
            offset: const Offset(0.0, 7.0),
            blurRadius: 8.0,
            spreadRadius: -4.0,
            color: color1,
          ),
          BoxShadow(
            offset: const Offset(0.0, 12.0),
            blurRadius: 17.0,
            spreadRadius: 2.0,
            color: color2,
          ),
          BoxShadow(
            offset: const Offset(0.0, 5.0),
            blurRadius: 22.0,
            spreadRadius: 4.0,
            color: color3,
          ),
        ];

      case 16:
        return [
          BoxShadow(
            offset: const Offset(0.0, 8.0),
            blurRadius: 10.0,
            spreadRadius: -5.0,
            color: color1,
          ),
          BoxShadow(
            offset: const Offset(0.0, 16.0),
            blurRadius: 24.0,
            spreadRadius: 2.0,
            color: color2,
          ),
          BoxShadow(
            offset: const Offset(0.0, 6.0),
            blurRadius: 30.0,
            spreadRadius: 5.0,
            color: color3,
          ),
        ];

      case 24:
        return [
          BoxShadow(
            offset: const Offset(0.0, 11.0),
            blurRadius: 15.0,
            spreadRadius: -7.0,
            color: color1,
          ),
          BoxShadow(
            offset: const Offset(0.0, 24.0),
            blurRadius: 38.0,
            spreadRadius: 3.0,
            color: color2,
          ),
          BoxShadow(
            offset: const Offset(0.0, 9.0),
            blurRadius: 46.0,
            spreadRadius: 8.0,
            color: color3,
          ),
        ];

      default:
        throw Exception("Shadows with that blur level isn't found.");
    }
  }

  static List<BoxShadow> createShadowsForColorBlur6(
    Color color, {
    double color1Alpha = 0.2,
    double color2Alpha = 0.14,
    double color3Alpha = 0.12,
  }) {
    final color1 =
        Color.fromRGBO(color.red, color.green, color.blue, color1Alpha);
    final color2 =
        Color.fromRGBO(color.red, color.green, color.blue, color2Alpha);
    final color3 =
        Color.fromRGBO(color.red, color.green, color.blue, color3Alpha);

    return [
      BoxShadow(
        offset: const Offset(0.0, 3.0),
        blurRadius: 5.0,
        spreadRadius: -1.0,
        color: color1,
      ),
      BoxShadow(
        offset: const Offset(0.0, 6.0),
        blurRadius: 10.0,
        // ignore: avoid_redundant_argument_values
        spreadRadius: 0.0,
        color: color2,
      ),
      BoxShadow(
        offset: const Offset(0.0, 1.0),
        blurRadius: 18.0,
        // ignore: avoid_redundant_argument_values
        spreadRadius: 0.0,
        color: color3,
      ),
    ];
  }
}
