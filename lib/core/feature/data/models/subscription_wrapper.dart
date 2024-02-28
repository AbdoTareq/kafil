// To parse this JSON data, do
//
//     final subscriptionWrapper = subscriptionWrapperFromJson(jsonString);

import 'dart:convert';

SubscriptionWrapper subscriptionWrapperFromJson(String str) =>
    SubscriptionWrapper.fromJson(json.decode(str));

String subscriptionWrapperToJson(SubscriptionWrapper data) =>
    json.encode(data.toJson());

class SubscriptionWrapper {
  List<SubscriptionModel>? data;

  SubscriptionWrapper({
    this.data,
  });

  SubscriptionWrapper copyWith({
    List<SubscriptionModel>? data,
  }) =>
      SubscriptionWrapper(
        data: data ?? this.data,
      );

  factory SubscriptionWrapper.fromJson(Map<String, dynamic> json) =>
      SubscriptionWrapper(
        data: json["data"] == null
            ? []
            : List<SubscriptionModel>.from(
                json["data"]!.map((x) => SubscriptionModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class SubscriptionModel {
  int? id;
  int? teacherId;
  String? teacherName;
  int? subjectId;
  String? subjectName;
  String? status;
  DateTime? startAt;
  DateTime? endAt;

  SubscriptionModel({
    this.id,
    this.teacherId,
    this.teacherName,
    this.subjectId,
    this.subjectName,
    this.status,
    this.startAt,
    this.endAt,
  });

  SubscriptionModel copyWith({
    int? id,
    int? teacherId,
    String? teacherName,
    int? subjectId,
    String? subjectName,
    String? status,
    DateTime? startAt,
    DateTime? endAt,
  }) =>
      SubscriptionModel(
        id: id ?? this.id,
        teacherId: teacherId ?? this.teacherId,
        teacherName: teacherName ?? this.teacherName,
        subjectId: subjectId ?? this.subjectId,
        subjectName: subjectName ?? this.subjectName,
        status: status ?? this.status,
        startAt: startAt ?? this.startAt,
        endAt: endAt ?? this.endAt,
      );

  factory SubscriptionModel.fromJson(Map<String, dynamic> json) =>
      SubscriptionModel(
        id: json["id"],
        teacherId: json["teacher_id"],
        teacherName: json["teacher_name"],
        subjectId: json["subject_id"],
        subjectName: json["subject_name"],
        status: json["status"],
        startAt:
            json["start_at"] == null ? null : DateTime.parse(json["start_at"]),
        endAt: json["end_at"] == null ? null : DateTime.parse(json["end_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "teacher_id": teacherId,
        "teacher_name": teacherName,
        "subject_id": subjectId,
        "subject_name": subjectName,
        "status": status,
        "start_at": startAt?.toIso8601String(),
        "end_at": endAt?.toIso8601String(),
      };
}
