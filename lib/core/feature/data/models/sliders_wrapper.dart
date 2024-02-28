// To parse this JSON data, do
//
//     final slidersWrapper = slidersWrapperFromJson(jsonString);

import 'dart:convert';

SlidersWrapper slidersWrapperFromJson(String str) =>
    SlidersWrapper.fromJson(json.decode(str));

String slidersWrapperToJson(SlidersWrapper data) => json.encode(data.toJson());

class SlidersWrapper {
  List<SliderModel>? data;

  SlidersWrapper({
    this.data,
  });

  SlidersWrapper copyWith({
    List<SliderModel>? data,
  }) =>
      SlidersWrapper(
        data: data ?? this.data,
      );

  factory SlidersWrapper.fromJson(Map<String, dynamic> json) => SlidersWrapper(
        data: json["data"] == null
            ? []
            : List<SliderModel>.from(
                json["data"]!.map((x) => SliderModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class SliderModel {
  int? id;
  String? image;

  SliderModel({
    this.id,
    this.image,
  });

  SliderModel copyWith({
    int? id,
    String? image,
  }) =>
      SliderModel(
        id: id ?? this.id,
        image: image ?? this.image,
      );

  factory SliderModel.fromJson(Map<String, dynamic> json) => SliderModel(
        id: json["id"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
      };
}
