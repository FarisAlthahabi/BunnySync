import 'package:flutter/material.dart';

extension ScrollControllerExtension on ScrollController {
  void scrollToTop() {
    animateTo(
      0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void scrollToBottom() {
    animateTo(
      position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
