class GetUserOrderResponseDm {
  GetUserOrderResponseDm({
      this.shippingAddress, 
      this.taxPrice, 
      this.shippingPrice, 
      this.totalOrderPrice, 
      this.paymentMethodType, 
      this.isPaid, 
      this.isDelivered, 
      this.id, 
      this.user, 
      this.cartItems, 
      this.createdAt, 
      this.updatedAt, 
      this.orderId,
      this.v,});

  GetUserOrderResponseDm.fromJson(dynamic json) {
    shippingAddress = json['shippingAddress'] != null ? ShippingAddress.fromJson(json['shippingAddress']) : null;
    taxPrice = json['taxPrice'];
    shippingPrice = json['shippingPrice'];
    totalOrderPrice = json['totalOrderPrice'];
    paymentMethodType = json['paymentMethodType'];
    isPaid = json['isPaid'];
    isDelivered = json['isDelivered'];
    id = json['_id'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    if (json['cartItems'] != null) {
      cartItems = [];
      json['cartItems'].forEach((v) {
        cartItems?.add(CartItems.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    orderId = json['id'];
    v = json['__v'];
  }
  ShippingAddress? shippingAddress;
  num? taxPrice;
  num? shippingPrice;
  num? totalOrderPrice;
  String? paymentMethodType;
  bool? isPaid;
  bool? isDelivered;
  String? id;
  User? user;
  List<CartItems>? cartItems;
  String? createdAt;
  String? updatedAt;
  num? orderId;
  num? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (shippingAddress != null) {
      map['shippingAddress'] = shippingAddress?.toJson();
    }
    map['taxPrice'] = taxPrice;
    map['shippingPrice'] = shippingPrice;
    map['totalOrderPrice'] = totalOrderPrice;
    map['paymentMethodType'] = paymentMethodType;
    map['isPaid'] = isPaid;
    map['isDelivered'] = isDelivered;
    map['_id'] = id;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    if (cartItems != null) {
      map['cartItems'] = cartItems?.map((v) => v.toJson()).toList();
    }
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['id'] = id;
    map['__v'] = v;
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
    product = json['product'] != null ? Product.fromJson(json['product']) : null;
    price = json['price'];
  }
  num? count;
  String? id;
  Product? product;
  num? price;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = count;
    map['_id'] = id;
    if (product != null) {
      map['product'] = product?.toJson();
    }
    map['price'] = price;
    return map;
  }

}

class Product {
  Product({
      this.subcategory,
      this.ratingsQuantity,
      this.id,
      this.title,
      this.imageCover,
      this.category,
      this.brand,
      this.ratingsAverage,
      this.userId,});

  Product.fromJson(dynamic json) {
    if (json['subcategory'] != null) {
      subcategory = [];
      json['subcategory'].forEach((v) {
        subcategory?.add(Subcategory.fromJson(v));
      });
    }
    ratingsQuantity = json['ratingsQuantity'];
    id = json['_id'];
    title = json['title'];
    imageCover = json['imageCover'];
    category = json['category'] != null ? Category.fromJson(json['category']) : null;
    brand = json['brand'] != null ? Brand.fromJson(json['brand']) : null;
    ratingsAverage = json['ratingsAverage'];
    userId = json['id'];
  }
  List<Subcategory>? subcategory;
  num? ratingsQuantity;
  String? id;
  String? title;
  String? imageCover;
  Category? category;
  Brand? brand;
  num? ratingsAverage;
  String? userId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (subcategory != null) {
      map['subcategory'] = subcategory?.map((v) => v.toJson()).toList();
    }
    map['ratingsQuantity'] = ratingsQuantity;
    map['_id'] = id;
    map['title'] = title;
    map['imageCover'] = imageCover;
    if (category != null) {
      map['category'] = category?.toJson();
    }
    if (brand != null) {
      map['brand'] = brand?.toJson();
    }
    map['ratingsAverage'] = ratingsAverage;
    map['id'] = id;
    return map;
  }

}

class Brand {
  Brand({
      this.id,
      this.name,
      this.slug,
      this.image,});

  Brand.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
  }
  String? id;
  String? name;
  String? slug;
  String? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    map['image'] = image;
    return map;
  }

}

class Category {
  Category({
      this.id,
      this.name,
      this.slug,
      this.image,});

  Category.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
  }
  String? id;
  String? name;
  String? slug;
  String? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    map['image'] = image;
    return map;
  }

}

class Subcategory {
  Subcategory({
      this.id,
      this.name,
      this.slug,
      this.category,});

  Subcategory.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    category = json['category'];
  }
  String? id;
  String? name;
  String? slug;
  String? category;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    map['category'] = category;
    return map;
  }

}

class User {
  User({
      this.id,
      this.name,
      this.email,
      this.phone,});

  User.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
  }
  String? id;
  String? name;
  String? email;
  String? phone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['phone'] = phone;
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