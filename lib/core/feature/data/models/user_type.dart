import 'package:easy_localization/easy_localization.dart';
import 'package:kafil/generated/translations.g.dart';

class UserChoice {
  final int id;
  final String name;

  UserChoice(this.id, this.name);
}

final List<UserChoice> userTypes = [
  UserChoice(2, seller.tr()),
  UserChoice(1, buyer.tr()),
  UserChoice(3, both.tr()),
];
