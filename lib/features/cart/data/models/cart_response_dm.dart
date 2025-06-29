import 'package:eccomerce_app/features/cart/domain/entities/cart_response_entity.dart';

class CartResponseDm extends CartResponseEntity {
  CartResponseDm({
    required super.status,
    required super.message,
    required super.numOfCartItems,
    required super.cartId,
    required super.data,
  });

  factory CartResponseDm.fromJson(Map<String, dynamic> json) {
    return CartResponseDm(
      status: json['status'],
      message: json['message'],
      numOfCartItems: json['numOfCartItems'],
      cartId: json['cartId'],
      data: CartDataDm.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'numOfCartItems': numOfCartItems,
      'cartId': cartId,
      'data': (data as CartDataDm).toJson(),
    };
  }
}
class CartDataDm extends CartData {
  CartDataDm({
    required super.id,
    required super.cartOwner,
    required super.products,
    required super.createdAt,
    required super.updatedAt,
    required super.v,
    required super.totalCartPrice,
  });

  factory CartDataDm.fromJson(Map<String, dynamic> json) {
    return CartDataDm(
      id: json['_id'],
      cartOwner: json['cartOwner'],
      products: (json['products'] as List)
          .map((e) => CartProductsDm.fromJson(e))
          .toList(),
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      v: json['__v'],
      totalCartPrice: json['totalCartPrice'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'cartOwner': cartOwner,
      'products':
       products?.map((product) =>
           (product as CartProductsDm).toJson()).toList(),
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      '__v': v,
      'totalCartPrice': totalCartPrice,
    };
  }
}
class CartProductsDm extends CartProductsEntity {
  CartProductsDm({
    required super.count,
    required super.id,
    required super.product,
    required super.price,
  });

  factory CartProductsDm.fromJson(Map<String, dynamic> json) {
    return CartProductsDm(
      count: json['count'],
      id: json['_id'],
      product: json['product'],
      price: json['price'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'count': count,
      '_id': id,
      'product': product,
      'price': price,
    };
  }
}
