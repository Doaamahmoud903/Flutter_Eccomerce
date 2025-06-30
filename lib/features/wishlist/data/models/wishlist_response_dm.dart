import 'package:eccomerce_app/features/cart/data/models/get_cart_response_dm.dart';
import 'package:eccomerce_app/features/wishlist/domain/entities/wishlist_response_entity.dart';

class WishlistResponseDm extends WishlistResponseEntity {
  WishlistResponseDm({
    required super.status,
    required super.message,
    required super.data,
  });

  factory WishlistResponseDm.fromJson(Map<String, dynamic> json) {
    return WishlistResponseDm(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null ? json['data'].cast<String>() : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {'status': status, 'message': message, 'data': data};
  }
}

class GetWishlistResponseDm extends GetWishlistResponseEntity {
  GetWishlistResponseDm({
    required super.status,
    required super.message,
    required super.data,
  });

  factory GetWishlistResponseDm.fromJson(Map<String, dynamic> json) {
    return GetWishlistResponseDm(
      status: json['status'],
      message: json['message'],
      data:
          json['data'] != null
              ? List<WishlistDataDm>.from(
                (json['data'] as List).map(
                  (item) => WishlistDataDm.fromJson(item),
                ),
              )
              : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': (data as WishlistDataDm).toJson(),
    };
  }
}

class WishlistDataDm extends WishlistDataEntity {
  WishlistDataDm({
    required super.sold,
    required super.images,
    required super.subcategory,
    required super.ratingsQuantity,
    required super.id,
    required super.title,
    required super.slug,
    required super.description,
    required super.quantity,
    required super.price,
    required super.imageCover,
    required super.category,
    required super.brand,
    required super.ratingsAverage,
    required super.createdAt,
    required super.updatedAt,
    required super.v,
  });

  WishlistDataDm.fromJson(dynamic json) {
    sold = json['sold'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
    if (json['subcategory'] != null) {
      subcategory = [];
      json['subcategory'].forEach((v) {
        subcategory?.add(GetSubcategoryDm.fromJson(v));
      });
    }
    ratingsQuantity = json['ratingsQuantity'];
    id = json['_id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    quantity = json['quantity'];
    price = json['price'];
    imageCover = json['imageCover'];
    category =
        json['category'] != null
            ? GetCategoryDm.fromJson(json['category'])
            : null;
    brand = json['brand'] != null ? GetBrandDm.fromJson(json['brand']) : null;
    ratingsAverage = json['ratingsAverage'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['sold'] = sold;
    map['images'] = images;
    map['subcategory'] =
        subcategory?.map((e) => (e as GetSubcategoryDm).toJson()).toList();
    map['ratingsQuantity'] = ratingsQuantity;
    map['_id'] = id;
    map['title'] = title;
    map['slug'] = slug;
    map['description'] = description;
    map['quantity'] = quantity;
    map['price'] = price;
    map['imageCover'] = imageCover;
    map['category'] = (category as GetCategoryDm?)?.toJson();
    map['brand'] = (brand as GetBrandDm?)?.toJson();
    map['ratingsAverage'] = ratingsAverage;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    return map;
  }
}
