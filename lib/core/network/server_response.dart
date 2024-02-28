class ServerResponse {
  dynamic message;
  dynamic errors;
  num? total;
  dynamic data;
  String? token;
  Links? links;
  int? unreadCount;

  ServerResponse({
    this.message,
    this.errors,
    this.data,
    this.total,
    this.token,
  });

  ServerResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    errors = json['errors'] ?? json['error'];
    total = json['total'];
    data = json['data'] ?? json;
    token = json['token'];
    links = json['links'] != null ? new Links.fromJson(json['links']) : null;
    unreadCount = json['unread_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['total'] = this.total;
    data['errors'] = this.errors;
    data['token'] = this.token;
    if (this.data != null) {
      data['data'] = this.data!;
    }
    if (this.links != null) {
      data['links'] = this.links!.toJson();
    }
    data['unread_count'] = this.unreadCount;
    return data;
  }
}

class Links {
  String? first;
  String? last;
  String? prev;
  String? next;

  Links({this.first, this.last, this.prev, this.next});

  Links.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    last = json['last'];
    prev = json['prev'];
    next = json['next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first'] = this.first;
    data['last'] = this.last;
    data['prev'] = this.prev;
    data['next'] = this.next;
    return data;
  }
}

class InternalLinks {
  String? url;
  String? label;
  bool? active;

  InternalLinks({this.url, this.label, this.active});

  InternalLinks.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['label'] = this.label;
    data['active'] = this.active;
    return data;
  }
}
