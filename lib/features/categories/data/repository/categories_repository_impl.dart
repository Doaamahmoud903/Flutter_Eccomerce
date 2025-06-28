import 'package:dartz/dartz.dart';
import 'package:eccomerce_app/features/categories/data/data_sources/remote/categories_remote_data_source.dart';
import 'package:eccomerce_app/features/categories/domain/entities/category_brand_response_entity.dart';
import 'package:eccomerce_app/features/categories/domain/repository/categories_repository.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';

@Injectable(as: CategoriesRepository)
class CategoriesRepositoryImpl extends CategoriesRepository{
  final CategoriesRemoteDataSource categoriesRemoteDataSource;
  CategoriesRepositoryImpl(this.categoriesRemoteDataSource);

  @override
  Future<Either<Failure, CetegoryBrandResponseEntity>> getAllCategories() async{
    return categoriesRemoteDataSource.getAllCategories();
  }

  @override
  Future<Either<Failure, Data>> getSpecificCategory(String categoryId) async{
    return categoriesRemoteDataSource.getSpecificCategory(categoryId);
  }
  @override
  Future<Either<Failure , CetegoryBrandResponseEntity>> getAllSubCategory(String categoryId) async{
    return categoriesRemoteDataSource.getAllSubCategory(categoryId);
  }

}
