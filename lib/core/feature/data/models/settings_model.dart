// To parse this JSON data, do
//
//     final settings = settingsFromJson(jsonString);

import 'dart:convert';

SettingsModel settingsFromJson(String str) =>
    SettingsModel.fromJson(json.decode(str));

String settingsToJson(SettingsModel data) => json.encode(data.toJson());

class SettingsModel {
  String? appName;
  String? description;
  String? phone;
  String? email;
  dynamic whatsapp;
  dynamic facebook;
  dynamic twitter;
  dynamic instagram;
  String? introVideo;
  String? androidVersion;
  String? iosVersion;
  String? address;
  int? changeIdentifierNo;

  SettingsModel({
    this.appName,
    this.description,
    this.phone,
    this.email,
    this.whatsapp,
    this.facebook,
    this.twitter,
    this.instagram,
    this.introVideo,
    this.androidVersion,
    this.iosVersion,
    this.address,
    this.changeIdentifierNo,
  });

  SettingsModel copyWith({
    String? appName,
    String? description,
    String? phone,
    String? email,
    dynamic whatsapp,
    dynamic facebook,
    dynamic twitter,
    dynamic instagram,
    String? introVideo,
    String? androidVersion,
    String? iosVersion,
    String? address,
    int? changeIdentifierNo,
  }) =>
      SettingsModel(
        appName: appName ?? this.appName,
        description: description ?? this.description,
        phone: phone ?? this.phone,
        email: email ?? this.email,
        whatsapp: whatsapp ?? this.whatsapp,
        facebook: facebook ?? this.facebook,
        twitter: twitter ?? this.twitter,
        instagram: instagram ?? this.instagram,
        introVideo: introVideo ?? this.introVideo,
        androidVersion: androidVersion ?? this.androidVersion,
        iosVersion: iosVersion ?? this.iosVersion,
        address: address ?? this.address,
        changeIdentifierNo: changeIdentifierNo ?? this.changeIdentifierNo,
      );

  factory SettingsModel.fromJson(Map<String, dynamic> json) => SettingsModel(
        appName: json["app_name"],
        description: json["description"],
        phone: json["phone"],
        email: json["email"],
        whatsapp: json["whatsapp"],
        facebook: json["facebook"],
        twitter: json["twitter"],
        instagram: json["instagram"],
        introVideo: json["intro_video"],
        androidVersion: json["android_version"],
        iosVersion: json["ios_version"],
        address: json["address"],
        changeIdentifierNo: json["change_identifier_no"],
      );

  Map<String, dynamic> toJson() => {
        "app_name": appName,
        "description": description,
        "phone": phone,
        "email": email,
        "whatsapp": whatsapp,
        "facebook": facebook,
        "twitter": twitter,
        "instagram": instagram,
        "intro_video": introVideo,
        "android_version": androidVersion,
        "ios_version": iosVersion,
        "address": address,
        "change_identifier_no": changeIdentifierNo,
      };
}
