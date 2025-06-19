import 'package:dartz/dartz.dart';
import 'package:eccomerce_app/core/errors/failures.dart';
import 'package:eccomerce_app/features/brands/data/data_sources/remote/brands_remote_data_source.dart';
import 'package:eccomerce_app/features/brands/domain/repository/brands_repository.dart';
import 'package:eccomerce_app/features/categories/domain/entities/category_brand_response_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: BrandsRepository)
class BrandsRepositoryImpl extends BrandsRepository{
  final BrandsRemoteDataSource brandsRemoteDataSource;
  BrandsRepositoryImpl(this.brandsRemoteDataSource);

  @override
  Future<Either<Failure, CetegoryBrandResponseEntity>> getAllBrands({int page = 1}) {
    return brandsRemoteDataSource.getAllBrands(page: page);
  }

  @override
  Future<Either<Failure, Data>> getSpecificBrand(String brandId) {
   return brandsRemoteDataSource.getSpecificBrand(brandId);
  }
}
