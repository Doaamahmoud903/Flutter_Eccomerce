import 'package:eccomerce_app/features/cart/domain/entities/get_cart_response_entity.dart';
import 'package:eccomerce_app/features/categories/domain/entities/category_brand_response_entity.dart';

class WishlistResponseEntity {
  WishlistResponseEntity({
    this.status,
    this.message,
    this.data,});

  String? status;
  String? message;
  List<String>? data;

}

class GetWishlistResponseEntity {
  GetWishlistResponseEntity({
    this.status,
    this.message,
    this.data,});

  String? status;
  String? message;
  List<WishlistDataEntity>? data;

}

class WishlistDataEntity {
  WishlistDataEntity({
    this.sold,
    this.images,
    this.subcategory,
    this.ratingsQuantity,
    this.id,
    this.title,
    this.slug,
    this.description,
    this.quantity,
    this.price,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  num? sold;
  List<String>? images;
  List<GetSubcategoryEntity>? subcategory;
  num? ratingsQuantity;
  String? id;
  String? title;
  String? slug;
  String? description;
  num? quantity;
  num? price;
  String? imageCover;
  GetCategoryEntity? category;
  GetBrandEntity? brand;
  num? ratingsAverage;
  String? createdAt;
  String? updatedAt;
  num? v;


}
