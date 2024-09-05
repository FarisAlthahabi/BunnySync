import 'dart:convert';

import 'package:bunny_sync/features/profile/model/profile_types/profile_types.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'user_post_model.g.dart';

@JsonSerializable()
@immutable
class UserPostModel {
  const UserPostModel({
    String? firstName,
    String? lastName,
    String? address,
    String? phoneNumber,
    String? city,
    String? state,
    bool? pets,
    bool? show,
    bool? wool,
    bool? pelts,
    bool? meat,
    ProfileTypes? type,
    String? search,
  })  : _firstName = firstName,
        _lastName = lastName,
        _address = address,
        _phoneNumber = phoneNumber,
        _city = city,
        _state = state,
        _pets = pets,
        _show = show,
        _wool = wool,
        _pelts = pelts,
        _meat = meat,
        _type = type,
        _search = search;

  factory UserPostModel.fromJsonStr(String str) =>
      UserPostModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory UserPostModel.fromJson(Map<String, dynamic> json) =>
      _$UserPostModelFromJson(json);

  final String? _firstName;

  final String? _lastName;

  final String? _address;

  final String? _phoneNumber;

  final String? _city;

  final String? _state;

  final bool? _pets;

  final bool? _show;

  final bool? _wool;

  final bool? _pelts;

  final bool? _meat;

  final ProfileTypes? _type;

  final String? _search;

  UserPostModel copyWith({
    String? Function()? firstName,
    String? Function()? lastName,
    String? Function()? address,
    String? Function()? phoneNumber,
    String? Function()? city,
    String? Function()? state,
    bool? Function()? pets,
    bool? Function()? show,
    bool? Function()? wool,
    bool? Function()? pelts,
    bool? Function()? meat,
    ProfileTypes? Function()? type,
    String? Function()? search,
  }) {
    return UserPostModel(
      firstName: firstName != null ? firstName() : _firstName,
      lastName: lastName != null ? lastName() : _lastName,
      address: address != null ? address() : _address,
      phoneNumber: phoneNumber != null ? phoneNumber() : _phoneNumber,
      city: city != null ? city() : _city,
      state: state != null ? state() : _state,
      pets: pets != null ? pets() : _pets,
      show: show != null ? show() : _show,
      wool: wool != null ? wool() : _wool,
      pelts: pelts != null ? pelts() : _pelts,
      meat: meat != null ? meat() : _meat,
      type: type != null ? type() : _type,
      search: search != null ? search() : _search,
    );
  }

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$UserPostModelToJson(this);

  @JsonKey(name: 'first_name')
  String get firstName {
    if (_firstName == null || _firstName.isEmpty) {
      throw "First name can't be empty";
    } else {
      return _firstName;
    }
  }

  @JsonKey(name: 'last_name')
  String get lastName {
    if (_lastName == null || _lastName.isEmpty) {
      return "Co";
    } else {
      return _lastName;
    }
  }

  String get address {
    if (_address == null || _address.isEmpty) {
      return 'unknwon'.i18n;
    } else {
      return _address;
    }
  }

  @JsonKey(name: 'phone')
  String get phoneNumber {
    if (_phoneNumber == null || _phoneNumber.isEmpty) {
      return 'unknwon'.i18n;
    } else {
      return _phoneNumber;
    }
  }

  String get city {
    if (_city == null || _city.isEmpty) {
      return 'unknwon'.i18n;
    } else {
      return _city;
    }
  }

  String get state {
    if (_state == null || _state.isEmpty) {
      return 'unknwon'.i18n;
    } else {
      return _state;
    }
  }

  bool get pets {
    return _pets ?? false;
  }

  bool get show {
    return _show ?? false;
  }

  bool get wool {
    return _wool ?? false;
  }

  bool get pelts {
    return _pelts ?? false;
  }

  bool get meat {
    return _meat ?? false;
  }

  ProfileTypes get type {
    if (_type == null) {
      return ProfileTypes.existingCustomer;
    } else {
      return _type;
    }
  }

  String get search {
    if (_search == null || _search.isEmpty) {
      return "my friends";
    } else {
      return _search;
    }
  }
}
