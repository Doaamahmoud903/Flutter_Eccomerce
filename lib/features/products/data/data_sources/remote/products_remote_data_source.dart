import 'package:dartz/dartz.dart';
import 'package:eccomerce_app/features/products/data/models/products_response_dm.dart';
import '../../../../../core/errors/failures.dart';

abstract class ProductsRemoteDataSource{
  Future<Either<Failure, ProductsResponseDm>>getAllProducts();
  Future<Either<Failure, ProductDm>>getSpecificProducts(String productId);
}
