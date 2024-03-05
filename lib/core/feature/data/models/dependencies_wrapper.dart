class DependenciesWrapper {
  int? status;
  bool? success;
  Dependency? data;

  DependenciesWrapper({this.status, this.success, this.data});

  DependenciesWrapper.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    success = json['success'];
    data = json['data'] != null ? Dependency.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Dependency {
  List<Types>? types;
  List<Types>? tags;
  List<SocialMedia>? socialMedia;

  Dependency({this.types, this.tags, this.socialMedia});

  Dependency.fromJson(Map<String, dynamic> json) {
    if (json['types'] != null) {
      types = <Types>[];
      json['types'].forEach((v) {
        types!.add(Types.fromJson(v));
      });
    }
    if (json['tags'] != null) {
      tags = <Types>[];
      json['tags'].forEach((v) {
        tags!.add(Types.fromJson(v));
      });
    }
    if (json['social_media'] != null) {
      socialMedia = <SocialMedia>[];
      json['social_media'].forEach((v) {
        socialMedia!.add(SocialMedia.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (types != null) {
      data['types'] = types!.map((v) => v.toJson()).toList();
    }
    if (tags != null) {
      data['tags'] = tags!.map((v) => v.toJson()).toList();
    }
    if (socialMedia != null) {
      data['social_media'] = socialMedia!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Types {
  int? value;
  String? name;

  Types({this.value, this.name});

  Types.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    name = json['label'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['value'] = value;
    data['label'] = name;
    return data;
  }
}

class SocialMedia {
  String? value;
  String? label;

  SocialMedia({this.value, this.label});

  SocialMedia.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    label = json['label'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['value'] = value;
    data['label'] = label;
    return data;
  }
}
