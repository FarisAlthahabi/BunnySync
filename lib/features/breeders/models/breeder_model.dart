import 'package:bunny_sync/global/gen/assets.gen.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:bunny_sync/global/models/rabbit_property_model.dart';
import 'package:flutter/material.dart';

class BreederModel {
  BreederModel({
    required this.name,
    required this.image,
    required this.id,
    required this.prefix,
    required this.buckOrDoe,
    required this.properties,
  });

  final String name;
  final String image;
  final String id;
  final String prefix;
  final bool buckOrDoe;
  final List<RabbitPropertyModel> properties;

  Widget get genderIcon =>
      buckOrDoe ? Assets.icons.buck.svg() : Assets.icons.doe.svg();

  String get gender => buckOrDoe ? 'buck'.i18n : 'doe'.i18n;
}
