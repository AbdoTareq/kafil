// To parse this JSON data, do
//
//     final teacherDetailsWrapper = teacherDetailsWrapperFromJson(jsonString);

import 'dart:convert';

TeacherDetailsWrapper teacherDetailsWrapperFromJson(String str) =>
    TeacherDetailsWrapper.fromJson(json.decode(str));

String teacherDetailsWrapperToJson(TeacherDetailsWrapper data) =>
    json.encode(data.toJson());

class TeacherDetailsWrapper {
  TeacherDetailsModel? data;

  TeacherDetailsWrapper({
    this.data,
  });

  TeacherDetailsWrapper copyWith({
    TeacherDetailsModel? data,
  }) =>
      TeacherDetailsWrapper(
        data: data ?? this.data,
      );

  factory TeacherDetailsWrapper.fromJson(Map<String, dynamic> json) =>
      TeacherDetailsWrapper(
        data: json["data"] == null
            ? null
            : TeacherDetailsModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
      };
}

class TeacherDetailsModel {
  About? about;
  Contact? contact;

  TeacherDetailsModel({
    this.about,
    this.contact,
  });

  TeacherDetailsModel copyWith({
    About? about,
    Contact? contact,
  }) =>
      TeacherDetailsModel(
        about: about ?? this.about,
        contact: contact ?? this.contact,
      );

  factory TeacherDetailsModel.fromJson(Map<String, dynamic> json) =>
      TeacherDetailsModel(
        about: json["about"] == null ? null : About.fromJson(json["about"]),
        contact:
            json["contact"] == null ? null : Contact.fromJson(json["contact"]),
      );

  Map<String, dynamic> toJson() => {
        "about": about?.toJson(),
        "contact": contact?.toJson(),
      };
}

class About {
  String? fullName;
  String? specialty;
  String? workPlace;
  int? experienceYears;
  String? bio;
  dynamic introVideo;

  About({
    this.fullName,
    this.specialty,
    this.workPlace,
    this.experienceYears,
    this.bio,
    this.introVideo,
  });

  About copyWith({
    String? fullName,
    String? specialty,
    String? workPlace,
    int? experienceYears,
    String? bio,
    dynamic introVideo,
  }) =>
      About(
        fullName: fullName ?? this.fullName,
        specialty: specialty ?? this.specialty,
        workPlace: workPlace ?? this.workPlace,
        experienceYears: experienceYears ?? this.experienceYears,
        bio: bio ?? this.bio,
        introVideo: introVideo ?? this.introVideo,
      );

  factory About.fromJson(Map<String, dynamic> json) => About(
        fullName: json["full_name"],
        specialty: json["specialty"],
        workPlace: json["work_place"],
        experienceYears: json["experience_years"],
        bio: json["bio"],
        introVideo: json["intro_video"],
      );

  Map<String, dynamic> toJson() => {
        "full_name": fullName,
        "specialty": specialty,
        "work_place": workPlace,
        "experience_years": experienceYears,
        "bio": bio,
        "intro_video": introVideo,
      };
}

class Contact {
  String? socialEmail;
  String? address;
  String? firstPhone;
  String? secondPhone;
  String? thirdPhone;

  Contact({
    this.socialEmail,
    this.address,
    this.firstPhone,
    this.secondPhone,
    this.thirdPhone,
  });

  Contact copyWith({
    String? socialEmail,
    String? address,
    String? firstPhone,
    String? secondPhone,
    String? thirdPhone,
  }) =>
      Contact(
        socialEmail: socialEmail ?? this.socialEmail,
        address: address ?? this.address,
        firstPhone: firstPhone ?? this.firstPhone,
        secondPhone: secondPhone ?? this.secondPhone,
        thirdPhone: thirdPhone ?? this.thirdPhone,
      );

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
        socialEmail: json["social_email"],
        address: json["address"],
        firstPhone: json["first_phone"],
        secondPhone: json["second_phone"],
        thirdPhone: json["third_phone"],
      );

  Map<String, dynamic> toJson() => {
        "social_email": socialEmail,
        "address": address,
        "first_phone": firstPhone,
        "second_phone": secondPhone,
        "third_phone": thirdPhone,
      };
}
