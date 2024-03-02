import 'package:easy_localization/easy_localization.dart';
import 'package:kafil/generated/translations.g.dart';

class Gender {
  final int id;
  final String name;

  Gender(this.id, this.name);
}

final List<Gender> genders = [
  Gender(1, male.tr()),
  Gender(2, female.tr()),
];
