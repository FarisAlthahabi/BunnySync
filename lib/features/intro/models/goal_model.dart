import 'package:bunny_sync/global/widgets/multi_selector_widget.dart';
import 'package:flutter/material.dart';

class GoalModel implements MultiSelectorItemModel {
  const GoalModel({
    required this.title,
    required this.icon,
    this.call,
  });

  @override
  final String title;

  @override
  final String icon;

  final VoidCallback? call;
}
