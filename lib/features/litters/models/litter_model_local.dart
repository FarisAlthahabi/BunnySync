import 'package:bunny_sync/features/breeders/models/breeder_entry_model/breeder_entry_model.dart';
import 'package:bunny_sync/global/models/rabbit_property_model.dart';

class LitterModelLocal {
  LitterModelLocal({
    required this.parents,
    required this.buckOrDoe,
    required this.properties,
    required this.kids,
  });

  final List<BreederEntryModel> parents;
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
