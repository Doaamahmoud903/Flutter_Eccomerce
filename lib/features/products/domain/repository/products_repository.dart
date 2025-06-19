import 'package:dartz/dartz.dart';
import 'package:eccomerce_app/core/errors/failures.dart';
import 'package:eccomerce_app/features/products/domain/entities/products_response_entity.dart';

abstract class ProductsRepository{
  Future<Either<Failure, ProductsResponseEntity>>getAllProducts({int page = 1});
  Future<Either<Failure, Product>>getSpecificProducts(String productId);
}
