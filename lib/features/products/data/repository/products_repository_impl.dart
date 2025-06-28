import 'package:dartz/dartz.dart';
import 'package:eccomerce_app/core/errors/failures.dart';
import 'package:eccomerce_app/features/products/data/data_sources/remote/products_remote_data_source.dart';
import 'package:eccomerce_app/features/products/domain/entities/products_response_entity.dart';
import 'package:eccomerce_app/features/products/domain/repository/products_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductsRepository)
class ProductsRepositoryImpl extends ProductsRepository{
  final ProductsRemoteDataSource productsRemoteDataSource;
  ProductsRepositoryImpl(this.productsRemoteDataSource);

  @override
  Future<Either<Failure, ProductsResponseEntity>> getAllProducts({int page = 1}) async{
    return productsRemoteDataSource.getAllProducts();
  }

  @override
  Future<Either<Failure, Product>> getSpecificProducts(String productId) async{
   return productsRemoteDataSource.getSpecificProducts(productId);
  }

  @override
  Future<Either<Failure, ProductsResponseEntity>> searchProducts(String keyword) async{
    return productsRemoteDataSource.searchProducts(keyword);
  }
}
