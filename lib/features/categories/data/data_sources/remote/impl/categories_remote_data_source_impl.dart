import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:eccomerce_app/core/api/api_constant.dart';
import 'package:eccomerce_app/core/api/api_services.dart';
import 'package:eccomerce_app/features/categories/data/data_sources/remote/categories_remote_data_source.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/errors/failures.dart';
import '../../../../../../core/errors/models/api_error_model.dart';
import '../../../models/category_brand_response_dm.dart';

@Injectable(as: CategoriesRemoteDataSource)
class CategoriesRemoteDataSourceImpl extends CategoriesRemoteDataSource{
  final ApiService apiService;
  CategoriesRemoteDataSourceImpl(this.apiService);

  @override
  Future<Either<Failure, CetegoryBrandResponseDm>> getAllCategories() async{
    try{
      final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult.contains(ConnectivityResult.mobile) ||connectivityResult.contains(ConnectivityResult.wifi)) {
      final response =await apiService.get(
          endPoint: ApiConstant.getAllCategories
      );
      print(response);
      final categoriesResponse = CetegoryBrandResponseDm.fromJson(response);
      return right(categoriesResponse);
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

  @override
  Future<Either<Failure, DataDm>> getSpecificCategory(String categoryId) async{
    try{
      final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult.contains(ConnectivityResult.mobile) ||connectivityResult.contains(ConnectivityResult.wifi)) {
        final response =await apiService.get(
            endPoint: ApiConstant.getSpecificCategory(categoryId)
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

  @override
  Future<Either<Failure , CetegoryBrandResponseDm>> getAllSubCategory(String categoryId) async{
    try{
      final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult.contains(ConnectivityResult.mobile) ||connectivityResult.contains(ConnectivityResult.wifi)) {
        final response =await apiService.get(
            endPoint: ApiConstant.getAllSubCategory(categoryId)
        );
        print(response);
        final categoryResponse = CetegoryBrandResponseDm.fromJson(response);
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
