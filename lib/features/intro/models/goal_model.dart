import 'package:bunny_sync/global/widgets/multi_selector_widget.dart';

class GoalModel implements MultiSelectorItemModel {
  const GoalModel({required this.title, required this.icon});

  @override
  final String title;

  @override
  final String icon;
}
