import 'package:flutter/material.dart';

class SettingsTileModel {
  const SettingsTileModel({
    required this.title,
    required this.icon,
    this.call,
  });

  final String title;

  final String icon;

  final VoidCallback? call;
}
