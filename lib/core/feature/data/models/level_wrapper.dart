// To parse this JSON data, do
//
//     final levelWrapper = levelWrapperFromJson(jsonString);

import 'dart:convert';

LevelWrapper levelWrapperFromJson(String str) =>
    LevelWrapper.fromJson(json.decode(str));

String levelWrapperToJson(LevelWrapper data) => json.encode(data.toJson());

class LevelWrapper {
  List<LevelModel>? data;

  LevelWrapper({
    this.data,
  });

  LevelWrapper copyWith({
    List<LevelModel>? data,
  }) =>
      LevelWrapper(
        data: data ?? this.data,
      );

  factory LevelWrapper.fromJson(Map<String, dynamic> json) => LevelWrapper(
        data: json["data"] == null
            ? []
            : List<LevelModel>.from(
                json["data"]!.map((x) => LevelModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class LevelModel {
  int? id;
  String? name;
  List<Year>? years;

  LevelModel({
    this.id,
    this.name,
    this.years,
  });

  LevelModel copyWith({
    int? id,
    String? name,
    List<Year>? years,
  }) =>
      LevelModel(
        id: id ?? this.id,
        name: name ?? this.name,
        years: years ?? this.years,
      );

  factory LevelModel.fromJson(Map<String, dynamic> json) => LevelModel(
        id: json["id"],
        name: json["name"],
        years: json["years"] == null
            ? []
            : List<Year>.from(json["years"]!.map((x) => Year.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "years": years == null
            ? []
            : List<dynamic>.from(years!.map((x) => x.toJson())),
      };
}

class Year {
  int? id;
  String? name;
  int? levelId;
  List<Subject>? subjects;

  Year({
    this.id,
    this.name,
    this.levelId,
    this.subjects,
  });

  Year copyWith({
    int? id,
    String? name,
    int? levelId,
    List<Subject>? subjects,
  }) =>
      Year(
        id: id ?? this.id,
        name: name ?? this.name,
        levelId: levelId ?? this.levelId,
        subjects: subjects ?? this.subjects,
      );

  factory Year.fromJson(Map<String, dynamic> json) => Year(
        id: json["id"],
        name: json["name"],
        levelId: json["level_id"],
        subjects: json["subjects"] == null
            ? []
            : List<Subject>.from(
                json["subjects"]!.map((x) => Subject.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "level_id": levelId,
        "subjects": subjects == null
            ? []
            : List<dynamic>.from(subjects!.map((x) => x.toJson())),
      };
}

class Subject {
  int? id;
  String? name;
  int? yearId;

  Subject({
    this.id,
    this.name,
    this.yearId,
  });

  Subject copyWith({
    int? id,
    String? name,
    int? yearId,
  }) =>
      Subject(
        id: id ?? this.id,
        name: name ?? this.name,
        yearId: yearId ?? this.yearId,
      );

  factory Subject.fromJson(Map<String, dynamic> json) => Subject(
        id: json["id"],
        name: json["name"],
        yearId: json["year_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "year_id": yearId,
      };
}
