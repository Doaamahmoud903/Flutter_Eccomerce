class OrdersResponseDm {
  OrdersResponseDm({
      this.status, 
      this.data,});

  OrdersResponseDm.fromJson(dynamic json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? status;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

class Data {
  Data({
    this.taxPrice,
    this.shippingPrice,
    this.totalOrderPrice,
    this.paymentMethodType,
    this.isPaid,
    this.isDelivered,
    this.backendId,
    this.user,
    this.cartItems,
    this.shippingAddress,
    this.createdAt,
    this.updatedAt,
    this.userId,
    this.v,
  });

  Data.fromJson(dynamic json) {
    taxPrice = json['taxPrice'];
    shippingPrice = json['shippingPrice'];
    totalOrderPrice = json['totalOrderPrice'];
    paymentMethodType = json['paymentMethodType'];
    isPaid = json['isPaid'];
    isDelivered = json['isDelivered'];
    backendId = json['_id']; // <-- هنا بوضوح
    user = json['user'];
    if (json['cartItems'] != null) {
      cartItems = [];
      json['cartItems'].forEach((v) {
        cartItems?.add(CartItems.fromJson(v));
      });
    }
    shippingAddress = json['shippingAddress'] != null
        ? ShippingAddress.fromJson(json['shippingAddress'])
        : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    userId = json['id'];
    v = json['__v'];
  }

  num? taxPrice;
  num? shippingPrice;
  num? totalOrderPrice;
  String? paymentMethodType;
  bool? isPaid;
  bool? isDelivered;
  String? backendId;
  String? user;
  List<CartItems>? cartItems;
  ShippingAddress? shippingAddress;
  String? createdAt;
  String? updatedAt;
  int? userId;
  num? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['taxPrice'] = taxPrice;
    map['shippingPrice'] = shippingPrice;
    map['totalOrderPrice'] = totalOrderPrice;
    map['paymentMethodType'] = paymentMethodType;
    map['isPaid'] = isPaid;
    map['isDelivered'] = isDelivered;
    map['_id'] = backendId;
    map['user'] = user;
    if (cartItems != null) {
      map['cartItems'] = cartItems?.map((v) => v.toJson()).toList();
    }
    if (shippingAddress != null) {
      map['shippingAddress'] = shippingAddress?.toJson();
    }
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['id'] = userId;
    map['__v'] = v;
    return map;
  }
}


class ShippingAddress {
  ShippingAddress({
      this.details, 
      this.phone, 
      this.city,});

  ShippingAddress.fromJson(dynamic json) {
    details = json['details'];
    phone = json['phone'];
    city = json['city'];
  }
  String? details;
  String? phone;
  String? city;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['details'] = details;
    map['phone'] = phone;
    map['city'] = city;
    return map;
  }

}

class CartItems {
  CartItems({
      this.count, 
      this.id, 
      this.product, 
      this.price,});

  CartItems.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product = json['product'];
    price = json['price'];
  }
  num? count;
  String? id;
  String? product;
  num? price;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = count;
    map['_id'] = id;
    map['product'] = product;
    map['price'] = price;
    return map;
  }

}