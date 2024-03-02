class ServicesWrapper {
  int? status;
  bool? success;
  List<Service>? data;

  ServicesWrapper({this.status, this.success, this.data});

  ServicesWrapper.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    success = json['success'];
    if (json['data'] != null) {
      data = <Service>[];
      json['data'].forEach((v) {
        data!.add(Service.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Service {
  int? id;
  String? mainImage;
  int? price;
  int? discount;
  int? priceAfterDiscount;
  String? title;
  int? averageRating;
  int? completedSalesCount;
  bool? recommended;

  Service(
      {this.id,
      this.mainImage,
      this.price,
      this.discount,
      this.priceAfterDiscount,
      this.title,
      this.averageRating,
      this.completedSalesCount,
      this.recommended});

  Service.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mainImage = json['main_image'];
    price = json['price'];
    discount = json['discount'];
    priceAfterDiscount = json['price_after_discount'];
    title = json['title'];
    averageRating = json['average_rating'];
    completedSalesCount = json['completed_sales_count'];
    recommended = json['recommended'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['main_image'] = mainImage;
    data['price'] = price;
    data['discount'] = discount;
    data['price_after_discount'] = priceAfterDiscount;
    data['title'] = title;
    data['average_rating'] = averageRating;
    data['completed_sales_count'] = completedSalesCount;
    data['recommended'] = recommended;
    return data;
  }
}
