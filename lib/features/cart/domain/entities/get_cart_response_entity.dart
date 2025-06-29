import 'package:hive/hive.dart';
part 'get_cart_response_entity.g.dart';


@HiveType(typeId: 3)
class GetCartResponseEntity {
  @HiveField(0)
  String? status;

  @HiveField(1)
  String? message;

  @HiveField(2)
  num? numOfCartItems;

  @HiveField(3)
  String? cartId;

  @HiveField(4)
  GetCartDataEntity? data;

  GetCartResponseEntity({
    this.status,
    this.message,
    this.numOfCartItems,
    this.cartId,
    this.data,
  });
}

@HiveType(typeId: 4)
class GetCartDataEntity {
  @HiveField(0)
  String? id;

  @HiveField(1)
  String? cartOwner;

  @HiveField(2)
  List<GetCartProductsEntity>? products;

  String? createdAt;
  String? updatedAt;
  num? v;

  @HiveField(3)
  num? totalCartPrice;

  GetCartDataEntity({
    this.id,
    this.cartOwner,
    this.products,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.totalCartPrice,
  });
}

@HiveType(typeId: 5)
class GetCartProductsEntity {
  @HiveField(0)
  List<GetSubcategoryEntity>? subcategory;
  @HiveField(1)
  String? id;
  @HiveField(3)
  String? title;
  @HiveField(4)
  num? quantity;
  @HiveField(5)
  String? imageCover;
  @HiveField(6)
  GetCategoryEntity? category;
  @HiveField(7)
  GetBrandEntity? brand;
  @HiveField(8)
  num? ratingsAverage;
  @HiveField(9)
  num? price;
  @HiveField(10)
  num? count;
  @HiveField(11)
  String? cartItemId;

  GetCartProductsEntity({
    this.cartItemId,
    this.subcategory,
    this.id,
    this.title,
    this.quantity,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,
    this.price,
    this.count
  });

}


@HiveType(typeId: 6)
class GetBrandEntity {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? slug;
  @HiveField(3)
  String? image;

  GetBrandEntity({this.id, this.name, this.slug, this.image});
}

@HiveType(typeId: 7)
class GetCategoryEntity {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? slug;
  @HiveField(3)
  String? image;

  GetCategoryEntity({this.id, this.name, this.slug, this.image});
}

@HiveType(typeId: 8)
class GetSubcategoryEntity {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? slug;
  @HiveField(3)
  String? category;

  GetSubcategoryEntity({this.id, this.name, this.slug, this.category});
}
