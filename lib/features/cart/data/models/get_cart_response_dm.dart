import 'package:eccomerce_app/features/cart/domain/entities/get_cart_response_entity.dart';

class GetCartProductsResponseDm extends GetCartResponseEntity {
  GetCartProductsResponseDm({
    super.status,
    super.numOfCartItems,
    super.cartId,
    super.data,
  });

  factory GetCartProductsResponseDm.fromJson(Map<String, dynamic> json) {
    return GetCartProductsResponseDm(
      status: json['status'],
      numOfCartItems: json['numOfCartItems'],
      cartId: json['cartId'],
      data: json['data'] != null ? GetCartDataDm.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'numOfCartItems': numOfCartItems,
      'cartId': cartId,
      'data': (data as GetCartDataDm?)?.toJson(),
    };
  }
}

class GetCartDataDm extends GetCartDataEntity {
  GetCartDataDm({
    super.id,
    super.cartOwner,
    super.products,
    super.createdAt,
    super.updatedAt,
    super.v,
    super.totalCartPrice,
  });

  factory GetCartDataDm.fromJson(Map<String, dynamic> json) {
    return GetCartDataDm(
      id: json['_id'],
      cartOwner: json['cartOwner'],
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => GetCartProductsDm.fromJson(e))
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
      'products': products?.map((e) => (e as GetCartProductsDm).toJson()).toList(),
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      '__v': v,
      'totalCartPrice': totalCartPrice,
    };
  }
}

class GetCartProductsDm extends GetCartProductsEntity {
  GetCartProductsDm({
    super.cartItemId,
    super.count,
    super.price,
    this.product,
    super.id,
    super.title,
    super.quantity,
    super.imageCover,
    super.category,
    super.brand,
    super.ratingsAverage,
    super.subcategory,
  });

  final GetProductDm? product;

  factory GetCartProductsDm.fromJson(Map<String, dynamic> json) {
    final productJson = json['product'];

    return GetCartProductsDm(
      cartItemId: json['_id'], // ID الخاص بعنصر السلة
      id: productJson?['id'], // ID الخاص بالمنتج
      title: productJson?['title'],
      quantity: productJson?['quantity'],
      imageCover: productJson?['imageCover'],
      category: productJson?['category'] != null
          ? GetCategoryDm.fromJson(productJson!['category'])
          : null,
      brand: productJson?['brand'] != null
          ? GetBrandDm.fromJson(productJson!['brand'])
          : null,
      ratingsAverage: productJson?['ratingsAverage'],
      subcategory: (productJson?['subcategory'] as List<dynamic>?)
          ?.map((e) => GetSubcategoryDm.fromJson(e))
          .toList(),
      price: json['price'],
      count: json['count'],
      product: productJson != null ? GetProductDm.fromJson(productJson) : null,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      '_id': cartItemId,
      'price': price,
      'count': count,
      'product': product?.toJson(),
    };
  }
}

class GetProductDm extends GetCartProductsEntity {
  GetProductDm({
    super.id,
    super.title,
    super.quantity,
    super.imageCover,
    super.category,
    super.brand,
    super.ratingsAverage,
    super.subcategory,
  });

  factory GetProductDm.fromJson(Map<String, dynamic> json) {
    return GetProductDm(
      id: json['_id'],
      title: json['title'],
      quantity: json['quantity'],
      imageCover: json['imageCover'],
      category: json['category'] != null ? GetCategoryDm.fromJson(json['category']) : null,
      brand: json['brand'] != null ? GetBrandDm.fromJson(json['brand']) : null,
      ratingsAverage: json['ratingsAverage'],
      subcategory: (json['subcategory'] as List<dynamic>?)
          ?.map((e) => GetSubcategoryDm.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'quantity': quantity,
      'imageCover': imageCover,
      'category': (category as GetCategoryDm?)?.toJson(),
      'brand':(brand as GetBrandDm?)?.toJson(),
      'ratingsAverage': ratingsAverage,
      'subcategory': subcategory
          ?.map((e) => (e as GetSubcategoryDm).toJson())
          .toList(),

    };
  }
}

class GetBrandDm extends GetBrandEntity {
  GetBrandDm({
    super.id,
    super.name,
    super.slug,
    super.image,
  });

  factory GetBrandDm.fromJson(Map<String, dynamic> json) {
    return GetBrandDm(
      id: json['_id'],
      name: json['name'],
      slug: json['slug'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() => {
    '_id': id,
    'name': name,
    'slug': slug,
    'image': image,
  };
}

class GetCategoryDm extends GetCategoryEntity {
  GetCategoryDm({
    super.id,
    super.name,
    super.slug,
    super.image,
  });

  factory GetCategoryDm.fromJson(Map<String, dynamic> json) {
    return GetCategoryDm(
      id: json['_id'],
      name: json['name'],
      slug: json['slug'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() => {
    '_id': id,
    'name': name,
    'slug': slug,
    'image': image,
  };
}

class GetSubcategoryDm extends GetSubcategoryEntity {
  GetSubcategoryDm({
    super.id,
    super.name,
    super.slug,
    super.category,
  });

  factory GetSubcategoryDm.fromJson(Map<String, dynamic> json) {
    return GetSubcategoryDm(
      id: json['_id'],
      name: json['name'],
      slug: json['slug'],
      category: json['category'],
    );
  }

  Map<String, dynamic> toJson() => {
    '_id': id,
    'name': name,
    'slug': slug,
    'category': category,
  };
}
