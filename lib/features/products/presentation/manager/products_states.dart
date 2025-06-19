import 'package:eccomerce_app/core/errors/failures.dart';

import '../../domain/entities/products_response_entity.dart';

abstract class ProductsStates{}
class ProductsIntialState{}
class ProductsLoading extends ProductsStates{}
class ProductsSuccess extends ProductsStates{
  final ProductsResponseEntity productResponse;

  ProductsSuccess(this.productResponse);
}
class ProductsFailure extends ProductsStates{
  final Failure failure;

  ProductsFailure(this.failure);
}

