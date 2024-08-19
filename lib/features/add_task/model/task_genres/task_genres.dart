import 'package:bunny_sync/global/localization/translations.i18n.dart';
import 'package:bunny_sync/global/widgets/main_drop_down_widget.dart';

enum TaskGenres implements DropDownItemModel {
  breed,
  pregnancyCheck,
  birth,
  weight,
  nestBox,
  medical,
  calendar,
  heart,
  ribbon,
  eye,
  flag,
  paw,
  trophy;

  @override
  int get id => index;

  @override
  String get displayName {
    switch (this) {
      case TaskGenres.breed:
        return 'breed'.i18n;
      case TaskGenres.pregnancyCheck:
        return 'pregnancy_check'.i18n;
      case TaskGenres.birth:
        return 'birth'.i18n;
      case TaskGenres.weight:
        return 'weight'.i18n;
      case TaskGenres.nestBox:
        return 'nest_box'.i18n;
      case TaskGenres.medical:
        return 'medical'.i18n;
      case TaskGenres.calendar:
        return 'calendar'.i18n;
      case TaskGenres.heart:
        return 'heart'.i18n;
      case TaskGenres.ribbon:
        return 'ribbon'.i18n;
      case TaskGenres.eye:
        return 'eye'.i18n;
      case TaskGenres.flag:
        return 'flag'.i18n;
      case TaskGenres.paw:
        return 'paw'.i18n;
      case TaskGenres.trophy:
        return 'trophy'.i18n;
    }
  }

  static TaskGenres fromJson(String value) {
    if (value == TaskGenres.breed.name) {
      return TaskGenres.breed;
    } else if (value == TaskGenres.pregnancyCheck.name) {
      return TaskGenres.pregnancyCheck;
    } else if (value == TaskGenres.birth.name) {
      return TaskGenres.birth;
    } else if (value == TaskGenres.weight.name ||
        value.toLowerCase() == 'weigh') {
      return TaskGenres.weight;
    } else if (value == TaskGenres.nestBox.name) {
      return TaskGenres.nestBox;
    } else if (value.toLowerCase() == TaskGenres.medical.name) {
      return TaskGenres.medical;
    } else if (value == TaskGenres.calendar.name) {
      return TaskGenres.calendar;
    } else if (value == TaskGenres.heart.name) {
      return TaskGenres.heart;
    } else if (value == TaskGenres.ribbon.name) {
      return TaskGenres.ribbon;
    } else if (value == TaskGenres.eye.name) {
      return TaskGenres.eye;
    } else if (value == TaskGenres.flag.name) {
      return TaskGenres.flag;
    } else if (value == TaskGenres.paw.name) {
      return TaskGenres.paw;
    } else if (value == TaskGenres.trophy.name) {
      return TaskGenres.trophy;
    } else {
      throw Exception('Unknown TaskGenres value: $value');
    }
  }
}
