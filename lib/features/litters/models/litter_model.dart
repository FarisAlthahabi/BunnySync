// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bunny_sync/global/models/rabbit_property_model.dart';

class LitterModel {
  LitterModel({
    required this.parents,
    required this.buckOrDoe,
    required this.properties,
    required this.kids,
  });
  final List<ParentModel> parents;
  final bool buckOrDoe;
  final List<RabbitPropertyModel> properties;
  final List<KidModel> kids;
}

class KidModel {
  KidModel({
    required this.image,
    required this.id,
    this.subTitle,
  });
  final String image;
  final String id;
  final String? subTitle;
}

class ParentModel {
  final String name;
  final String image;
  final String id;
  final String prefix;
  ParentModel({
    required this.name,
    required this.image,
    required this.id,
    required this.prefix,
  });
}
