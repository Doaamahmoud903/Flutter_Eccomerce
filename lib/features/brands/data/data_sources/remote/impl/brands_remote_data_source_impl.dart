import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:eccomerce_app/core/api/api_services.dart';
import 'package:eccomerce_app/core/errors/failures.dart';
import 'package:eccomerce_app/features/brands/data/data_sources/remote/brands_remote_data_source.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/api/api_constant.dart';
import '../../../../../../core/errors/models/api_error_model.dart';
import '../../../../../categories/data/models/category_brand_response_dm.dart';

@Injectable(as: BrandsRemoteDataSource)
class BrandsRemoteDataSourceImpl extends BrandsRemoteDataSource{
  final ApiService apiService;

  BrandsRemoteDataSourceImpl(this.apiService);
  @override
  Future<Either<Failure, CetegoryBrandResponseDm>> getAllBrands({int page = 1}) async {
    try {
      final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult.contains(ConnectivityResult.mobile) || connectivityResult.contains(ConnectivityResult.wifi)) {
        final response = await apiService.get(
          endPoint: ApiConstant.getAllBrands,
          queryParameters: {
            "page": page,
          },
        );

        print(response);
        final categoriesResponse = CetegoryBrandResponseDm.fromJson(response);
        return right(categoriesResponse);
      } else {
        return left(NetworkFailure("No Internet Connection"));
      }
    } catch (error) {
      if (error is DioException) {
        return Left(
          ServerFailure.fromResponse(
            error.response?.statusCode,
            ApiErrorResponse.fromJson(error.response?.data),
          ),
        );
      } else {
        return left(ServerFailure('Something went wrong ${error.toString()}'));
      }
    }
  }



  @override
  Future<Either<Failure, DataDm>> getSpecificBrand(String brandId) async{
    try{
      final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult.contains(ConnectivityResult.mobile) ||connectivityResult.contains(ConnectivityResult.wifi)) {
        final response =await apiService.get(
            endPoint: ApiConstant.getSpecificBrand(brandId)
        );
        print(response);
        final categoryResponse = DataDm.fromJson(response);
        return right(categoryResponse);
      } else{
        // NO Internet Connection
        return left(NetworkFailure("No Internet Connection"));
      }
    }catch (error) {
      if (error is DioException) {
        return Left(
            ServerFailure.fromResponse(
                error.response?.statusCode,
                ApiErrorResponse.fromJson(error.response?.data)
            )
        );
      } else {
        return left(ServerFailure('Something went wrong ${error.toString()}'));
      }
    }
  }
}