import 'package:bunny_sync/global/theme/theme_x.dart';
import 'package:flash/flash.dart';
import 'package:flutter/material.dart';

abstract class MainSnackBar {
  static Future<T?> showInfoBar<T>({
    required BuildContext context,
    required Widget content,
    FlashPosition position = FlashPosition.bottom,
    Duration duration = const Duration(seconds: 3),
    Icon? icon = const Icon(Icons.info_outline),
    Color? indicatorColor,
    FlashBuilder<T>? primaryActionBuilder,
  }) {
    return showFlash<T>(
      context: context,
      duration: duration,
      builder: (context, controller) {
        return FlashBar(
          controller: controller,
          backgroundColor: context.cs.surface,
          position: position,
          indicatorColor: indicatorColor ?? context.cs.primary,
          icon: icon,
          content: content,
          primaryAction: primaryActionBuilder?.call(context, controller),
        );
      },
    );
  }

  static Future<T?> showSuccessBar<T>({
    required BuildContext context,
    required Widget content,
    FlashPosition position = FlashPosition.bottom,
    Duration duration = const Duration(seconds: 3),
    Icon? icon = const Icon(Icons.check_circle_outline),
    Color? indicatorColor = const Color(0xFF81C784),
    FlashBuilder<T>? primaryActionBuilder,
  }) {
    return showFlash<T>(
      context: context,
      duration: duration,
      builder: (context, controller) {
        return FlashBar(
          controller: controller,
          position: position,
          indicatorColor: indicatorColor,
          icon: icon,
          content: content,
          primaryAction: primaryActionBuilder?.call(context, controller),
        );
      },
    );
  }

  static Future<T?> showSuccessMessageBar<T>(
    BuildContext context,
    String message, {
    FlashPosition position = FlashPosition.bottom,
    Duration duration = const Duration(seconds: 3),
    Icon? icon = const Icon(Icons.check_circle_outline),
    Color? indicatorColor = const Color(0xFF81C784),
    FlashBuilder<T>? primaryActionBuilder,
  }) {
    return showFlash<T>(
      context: context,
      duration: duration,
      builder: (context, controller) {
        return FlashBar(
          controller: controller,
          position: position,
          indicatorColor: indicatorColor,
          icon: icon,
          content: Text(
            message,
            style: const TextStyle(
              //TODO: Change this color
              color: Colors.black,
            ),
          ),
          primaryAction: primaryActionBuilder?.call(context, controller),
        );
      },
    );
  }

  static Future<T?> showErrorBar<T>({
    required BuildContext context,
    required Widget content,
    FlashPosition position = FlashPosition.bottom,
    Duration duration = const Duration(seconds: 3),
    Icon? icon,
    Color? indicatorColor,
    FlashBuilder<T>? primaryActionBuilder,
  }) {
    return showFlash<T>(
      context: context,
      duration: duration,
      builder: (context, controller) {
        return FlashBar(
          controller: controller,
          backgroundColor: context.cs.error,
          position: position,
          indicatorColor: indicatorColor ?? context.cs.onError,
          icon: icon ??
              Icon(
                Icons.error_outline,
                color: context.cs.onError,
              ),
          content: content,
          primaryAction: primaryActionBuilder?.call(context, controller),
        );
      },
    );
  }

  static Future<T?> showErrorMessageBar<T>(
    BuildContext context,
    String message, {
    FlashPosition position = FlashPosition.bottom,
    Duration duration = const Duration(seconds: 3),
    Icon? icon,
    Color? indicatorColor,
    FlashBuilder<T>? primaryActionBuilder,
  }) {
    return showFlash<T>(
      context: context,
      duration: duration,
      builder: (context, controller) {
        return FlashBar(
          controller: controller,
          backgroundColor: context.cs.error,
          position: position,
          indicatorColor: indicatorColor ?? context.cs.onError,
          icon: icon ??
              Icon(
                Icons.error_outline,
                color: context.cs.onError,
              ),
          content: Text(
            message,
            style: TextStyle(color: context.cs.onError),
          ),
          primaryAction: primaryActionBuilder?.call(context, controller),
        );
      },
    );
  }
}
