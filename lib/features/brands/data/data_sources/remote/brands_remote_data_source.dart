
import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failures.dart';
import '../../../../categories/domain/entities/category_brand_response_entity.dart';

abstract class BrandsRemoteDataSource{
  Future<Either<Failure , CetegoryBrandResponseEntity>> getAllBrands({int page = 1});
  Future<Either<Failure , Data>> getSpecificBrand(String brandId);
}