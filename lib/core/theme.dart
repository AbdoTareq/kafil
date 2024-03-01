import 'package:flutter/material.dart';

import 'app_colors.dart';

const kRoundedAll = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.all(
    Radius.circular(33.0),
  ),
);

final OutlineInputBorder kBorder = OutlineInputBorder(
  borderSide: const BorderSide(
    color: Colors.transparent,
  ),
  borderRadius: BorderRadius.circular(16),
);

final lightTheme = ThemeData(
  primaryColor: kPrimaryColor,
  brightness: Brightness.light,
  appBarTheme: const AppBarTheme().copyWith(color: kPrimaryColor),
  dividerColor: Colors.white54,
  textTheme: Typography.blackCupertino.copyWith(
    titleLarge: const TextStyle(color: kTextGreyColor, fontSize: 16),
    titleMedium: const TextStyle(color: kTextGreyColor, fontSize: 14),
    titleSmall: const TextStyle(color: kTextGreyColor, fontSize: 12),
  ),
  fontFamily: 'Cairo',
  colorScheme: ColorScheme.fromSwatch(primarySwatch: kPrimaryColor)
      .copyWith(secondary: kPrimaryColor)
      .copyWith(background: const Color(0xFFE5E5E5)),
);

final darkTheme = ThemeData(
  primaryColor: kPrimaryColor,
  brightness: Brightness.dark,
  appBarTheme: const AppBarTheme().copyWith(color: kPrimaryColor),
  dividerColor: Colors.black12,
  fontFamily: 'Cairo',
  colorScheme: ColorScheme.fromSwatch(
          primarySwatch: kPrimaryColor, brightness: Brightness.dark)
      .copyWith(secondary: Colors.white)
      .copyWith(background: const Color(0xFF212121)),
);
