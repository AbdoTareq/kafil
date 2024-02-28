// To parse this JSON data, do
//
//     final teacherWrapper = teacherWrapperFromJson(jsonString);

import 'dart:convert';

TeacherWrapper teacherWrapperFromJson(String str) =>
    TeacherWrapper.fromJson(json.decode(str));

String teacherWrapperToJson(TeacherWrapper data) => json.encode(data.toJson());

class TeacherWrapper {
  TeacherModel? data;
  Meta? meta;

  TeacherWrapper({
    this.data,
    this.meta,
  });

  TeacherWrapper copyWith({
    TeacherModel? data,
    Meta? meta,
  }) =>
      TeacherWrapper(
        data: data ?? this.data,
        meta: meta ?? this.meta,
      );

  factory TeacherWrapper.fromJson(Map<String, dynamic> json) => TeacherWrapper(
        data: json["data"] == null ? null : TeacherModel.fromJson(json["data"]),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "meta": meta?.toJson(),
      };
}

class TeacherModel {
  int? id;
  String? name;
  String? phone;
  String? email;
  bool? active;
  bool? confirmed;
  dynamic activationCode;
  ZoomAccount? zoomAccount;
  List<Course>? courses;

  TeacherModel({
    this.id,
    this.name,
    this.phone,
    this.email,
    this.active,
    this.confirmed,
    this.activationCode,
    this.zoomAccount,
    this.courses,
  });

  TeacherModel copyWith({
    int? id,
    String? name,
    String? phone,
    String? email,
    bool? active,
    bool? confirmed,
    dynamic activationCode,
    ZoomAccount? zoomAccount,
    List<Course>? courses,
  }) =>
      TeacherModel(
        id: id ?? this.id,
        name: name ?? this.name,
        phone: phone ?? this.phone,
        email: email ?? this.email,
        active: active ?? this.active,
        confirmed: confirmed ?? this.confirmed,
        activationCode: activationCode ?? this.activationCode,
        zoomAccount: zoomAccount ?? this.zoomAccount,
        courses: courses ?? this.courses,
      );

  factory TeacherModel.fromJson(Map<String, dynamic> json) => TeacherModel(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
        email: json["email"],
        active: json["active"],
        confirmed: json["confirmed"],
        activationCode: json["activation_code"],
        zoomAccount: json["zoom_account"] == null
            ? null
            : ZoomAccount.fromJson(json["zoom_account"]),
        courses: json["courses"] == null
            ? []
            : List<Course>.from(
                json["courses"]!.map((x) => Course.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
        "email": email,
        "active": active,
        "confirmed": confirmed,
        "activation_code": activationCode,
        "zoom_account": zoomAccount?.toJson(),
        "courses": courses == null
            ? []
            : List<dynamic>.from(courses!.map((x) => x.toJson())),
      };
}

class Course {
  int? id;
  String? name;
  int? subjectId;
  String? subjectName;
  int? lessonsCount;
  String? image;

  Course({
    this.id,
    this.name,
    this.subjectId,
    this.subjectName,
    this.lessonsCount,
    this.image,
  });

  Course copyWith({
    int? id,
    String? name,
    int? subjectId,
    String? subjectName,
    int? lessonsCount,
    String? image,
  }) =>
      Course(
        id: id ?? this.id,
        name: name ?? this.name,
        subjectId: subjectId ?? this.subjectId,
        subjectName: subjectName ?? this.subjectName,
        lessonsCount: lessonsCount ?? this.lessonsCount,
        image: image ?? this.image,
      );

  factory Course.fromJson(Map<String, dynamic> json) => Course(
        id: json["id"],
        name: json["name"],
        subjectId: json["subject_id"],
        subjectName: json["subject_name"],
        lessonsCount: json["lessons_count"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "subject_id": subjectId,
        "subject_name": subjectName,
        "lessons_count": lessonsCount,
        "image": image,
      };
}

class ZoomAccount {
  String? username;
  String? password;

  ZoomAccount({
    this.username,
    this.password,
  });

  ZoomAccount copyWith({
    String? username,
    String? password,
  }) =>
      ZoomAccount(
        username: username ?? this.username,
        password: password ?? this.password,
      );

  factory ZoomAccount.fromJson(Map<String, dynamic> json) => ZoomAccount(
        username: json["username"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
      };
}

class Meta {
  String? token;

  Meta({
    this.token,
  });

  Meta copyWith({
    String? token,
  }) =>
      Meta(
        token: token ?? this.token,
      );

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
      };
}
