import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failures.dart';
import '../../../domain/entities/category_brand_response_entity.dart';

abstract class CategoriesRemoteDataSource{
  Future<Either<Failure , CetegoryBrandResponseEntity>> getAllCategories();
  Future<Either<Failure , Data>> getSpecificCategory(String categoryId);
  Future<Either<Failure , CetegoryBrandResponseEntity>> getAllSubCategory(String categoryId);

}
