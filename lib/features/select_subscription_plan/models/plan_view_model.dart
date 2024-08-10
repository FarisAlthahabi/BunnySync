import 'package:bunny_sync/features/select_subscription_plan/models/feature_model.dart';
import 'package:equatable/equatable.dart';

class PlanViewModel extends Equatable {
  const PlanViewModel({
    required this.id,
    required this.title,
    required this.colorHex,
    required this.icon,
    required this.price,
    required this.yearlyPrice,
    required this.features,
  });

  final int id;
  final String title;
  final String colorHex;
  final String icon;
  final double price;
  final double yearlyPrice;
  final List<FeatureModel> features;

  @override
  List<Object?> get props => [id];
}
