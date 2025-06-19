import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:eccomerce_app/core/api/api_services.dart';
import 'package:eccomerce_app/core/errors/failures.dart';
import 'package:eccomerce_app/features/products/data/data_sources/remote/products_remote_data_source.dart';
import 'package:eccomerce_app/features/products/data/models/products_response_dm.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/api/api_constant.dart';
import '../../../../../../core/errors/models/api_error_model.dart';

@Injectable(as: ProductsRemoteDataSource)
class ProductsRemoteDataSourceImpl extends ProductsRemoteDataSource{
  final ApiService apiService;
  ProductsRemoteDataSourceImpl(this.apiService);

  @override
  Future<Either<Failure, ProductsResponseDm>> getAllProducts() async{
    try{
      final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult.contains(ConnectivityResult.mobile) ||connectivityResult.contains(ConnectivityResult.wifi)) {
        final response = apiService.get(
            endPoint: ApiConstant.getAllProducts
        );
        print(response);
        final categoriesResponse = ProductsResponseDm.fromJson(response);
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
  Future<Either<Failure, ProductDm>> getSpecificProducts(String productId) async{
    try{
      final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult.contains(ConnectivityResult.mobile) ||connectivityResult.contains(ConnectivityResult.wifi)) {
        final response = apiService.get(
            endPoint: ApiConstant.getSpecificProducts(productId)
        );
        print(response);
        final categoryResponse = ProductDm.fromJson(response);
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
