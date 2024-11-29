class OrdersModel {
  String? id;
  bool? isActive;
  String? price;
  String? company;
  String? picture;
  String? buyer;
  List<String>? tags;
  String? status;
  String? registered;

  OrdersModel(
      {this.id,
        this.isActive,
        this.price,
        this.company,
        this.picture,
        this.buyer,
        this.tags,
        this.status,
        this.registered});

  OrdersModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isActive = json['isActive'];
    price = json['price'];
    company = json['company'];
    picture = json['picture'];
    buyer = json['buyer'];
    tags = json['tags'].cast<String>();
    status = json['status'];
    registered = json['registered'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['isActive'] = isActive;
    data['price'] = price;
    data['company'] = company;
    data['picture'] = picture;
    data['buyer'] = buyer;
    data['tags'] = tags;
    data['status'] = status;
    data['registered'] = registered;
    return data;
  }
}
