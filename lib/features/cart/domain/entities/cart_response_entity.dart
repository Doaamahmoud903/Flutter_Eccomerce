
class CartResponseEntity {
  String? status;
  String? message;
  num? numOfCartItems;
  String? cartId;
  CartData? data;

  CartResponseEntity({
    this.status,
    this.message,
    this.numOfCartItems,
    this.cartId,
    this.data,
  });
}

class CartData {
  String? id;
  String? cartOwner;
  List<CartProductsEntity>? products;
  String? createdAt;
  String? updatedAt;
  num? v;
  num? totalCartPrice;

  CartData({
    this.id,
    this.cartOwner,
    this.products,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.totalCartPrice,
  });
}

class CartProductsEntity {
  num? count;
  String? id;
  String? product;
  num? price;

  CartProductsEntity({
    this.count,
    this.id,
    this.product,
    this.price,
  });
}
