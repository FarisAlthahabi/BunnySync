import 'package:bunny_sync/global/widgets/info_properties_widget.dart';

class RabbitPropertyModel implements InfoPropertyModel {
  RabbitPropertyModel({
    required this.title,
    required this.value,
  });

  @override
  final String title;

  @override
  final String value;

}
