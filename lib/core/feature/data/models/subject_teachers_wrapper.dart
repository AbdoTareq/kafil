// To parse this JSON data, do
//
//     final subjectTeachersWrapper = subjectTeachersWrapperFromJson(jsonString);

import 'dart:convert';

SubjectTeachersWrapper subjectTeachersWrapperFromJson(String str) =>
    SubjectTeachersWrapper.fromJson(json.decode(str));

String subjectTeachersWrapperToJson(SubjectTeachersWrapper data) =>
    json.encode(data.toJson());

class SubjectTeachersWrapper {
  List<SubjectTeacherModel>? data;
  Links? links;
  Meta? meta;

  SubjectTeachersWrapper({
    this.data,
    this.links,
    this.meta,
  });

  SubjectTeachersWrapper copyWith({
    List<SubjectTeacherModel>? data,
    Links? links,
    Meta? meta,
  }) =>
      SubjectTeachersWrapper(
        data: data ?? this.data,
        links: links ?? this.links,
        meta: meta ?? this.meta,
      );

  factory SubjectTeachersWrapper.fromJson(Map<String, dynamic> json) =>
      SubjectTeachersWrapper(
        data: json["data"] == null
            ? []
            : List<SubjectTeacherModel>.from(
                json["data"]!.map((x) => SubjectTeacherModel.fromJson(x))),
        links: json["links"] == null ? null : Links.fromJson(json["links"]),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "links": links?.toJson(),
        "meta": meta?.toJson(),
      };
}

class SubjectTeacherModel {
  int? id;
  String? name;
  int? rate;
  String? image;

  SubjectTeacherModel({
    this.id,
    this.name,
    this.rate,
    this.image,
  });

  SubjectTeacherModel copyWith({
    int? id,
    String? name,
    int? rate,
    String? image,
  }) =>
      SubjectTeacherModel(
        id: id ?? this.id,
        name: name ?? this.name,
        rate: rate ?? this.rate,
        image: image ?? this.image,
      );

  factory SubjectTeacherModel.fromJson(Map<String, dynamic> json) =>
      SubjectTeacherModel(
        id: json["id"],
        name: json["name"],
        rate: json["rate"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "rate": rate,
        "image": image,
      };
}

class Links {
  String? first;
  String? last;
  dynamic prev;
  dynamic next;

  Links({
    this.first,
    this.last,
    this.prev,
    this.next,
  });

  Links copyWith({
    String? first,
    String? last,
    dynamic prev,
    dynamic next,
  }) =>
      Links(
        first: first ?? this.first,
        last: last ?? this.last,
        prev: prev ?? this.prev,
        next: next ?? this.next,
      );

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        first: json["first"],
        last: json["last"],
        prev: json["prev"],
        next: json["next"],
      );

  Map<String, dynamic> toJson() => {
        "first": first,
        "last": last,
        "prev": prev,
        "next": next,
      };
}

class Meta {
  int? currentPage;
  int? from;
  int? lastPage;
  String? path;
  int? perPage;
  int? to;
  int? total;

  Meta({
    this.currentPage,
    this.from,
    this.lastPage,
    this.path,
    this.perPage,
    this.to,
    this.total,
  });

  Meta copyWith({
    int? currentPage,
    int? from,
    int? lastPage,
    String? path,
    int? perPage,
    int? to,
    int? total,
  }) =>
      Meta(
        currentPage: currentPage ?? this.currentPage,
        from: from ?? this.from,
        lastPage: lastPage ?? this.lastPage,
        path: path ?? this.path,
        perPage: perPage ?? this.perPage,
        to: to ?? this.to,
        total: total ?? this.total,
      );

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        currentPage: json["current_page"],
        from: json["from"],
        lastPage: json["last_page"],
        path: json["path"],
        perPage: json["per_page"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "from": from,
        "last_page": lastPage,
        "path": path,
        "per_page": perPage,
        "to": to,
        "total": total,
      };
}
