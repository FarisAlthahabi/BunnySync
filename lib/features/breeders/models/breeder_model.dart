import 'package:bunny_sync/global/models/rabbit_property_model.dart';

class BreederModel {
  BreederModel({
    required this.name,
    required this.image,
    required this.id,
    required this.prefix,
    required this.properties,
  });

  final String name;
  final String image;
  final String id;
  final String prefix;
  final List<RabbitPropertyModel> properties;
}
