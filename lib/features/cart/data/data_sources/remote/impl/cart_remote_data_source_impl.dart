import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:eccomerce_app/core/errors/failures.dart';
import 'package:eccomerce_app/features/cart/data/data_sources/remote/cart_remote_data_source.dart';
import 'package:eccomerce_app/features/cart/data/models/cart_response_dm.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/api/api_constant.dart';
import '../../../../../../core/api/api_services.dart';
import '../../../../../../core/connectivity/handle_network_request.dart';
import '../../../models/get_cart_response_dm.dart';


@Injectable(as: CartRemoteDataSource)
class CartRemoteDataSourceImpl extends CartRemoteDataSource{
  final ApiService apiService;
  final Connectivity connectivity;
  CartRemoteDataSourceImpl(this.apiService, this.connectivity);
  @override
  Future<Either<Failure, CartResponseDm>> addToCart(String token, String productId) async{
    try {
      final result = await handleDataNetworkRequest<Map<String, dynamic>>(
        connectivity: connectivity,
        request: () => apiService.post(
          endPoint: ApiConstant.cart,
          data: {
            "productId": productId,
          },
          token: token
        ),
      );

      print("Response: $result");

      final cartResponse = CartResponseDm.fromJson(result);
      return right(cartResponse);

    } catch (error) {
      if (error is DioException) {
        final errorMsg = error.response?.data['message'] ?? 'Something went wrong';
        return Left(ServerFailure(errorMsg));
      } else {
        return left(ServerFailure('Something went wrong ${error.toString()}'));
      }
    }
  }

  @override
  Future<Either<Failure, CartResponseDm>> clearCart(String token) async{
    try {
      final result = await handleDataNetworkRequest<Map<String, dynamic>>(
        connectivity: connectivity,
        request: () => apiService.delete(
            endPoint: ApiConstant.cart,
            token: token
        ),
      );

      print("Response: $result");

      final cartResponse = CartResponseDm.fromJson(result);
      return right(cartResponse);

    } catch (error) {
      if (error is DioException) {
        final errorMsg = error.response?.data['message'] ?? 'Something went wrong';
        return Left(ServerFailure(errorMsg));
      } else {
        return left(ServerFailure('Something went wrong ${error.toString()}'));
      }
    }
  }

  @override
  Future<Either<Failure, GetCartProductsResponseDm>> getCart(String token) async{
    try {
      final result = await handleDataNetworkRequest<Map<String, dynamic>>(
        connectivity: connectivity,
        request: () => apiService.get(
            endPoint: ApiConstant.cart,
            token: token
        ),
      );

      print("Response: $result");

      final cartResponse = GetCartProductsResponseDm.fromJson(result);
      return right(cartResponse);

    } catch (error) {
      if (error is DioException) {
        final errorMsg = error.response?.data['message'] ?? 'Something went wrong';
        return Left(ServerFailure(errorMsg));
      } else {
        return left(ServerFailure('Something went wrong ${error.toString()}'));
      }
    }
  }

  @override
  Future<Either<Failure, GetCartProductsResponseDm>> removeItemFromCart(String token, String productId) async{
    try {
      final result = await handleDataNetworkRequest<Map<String, dynamic>>(
        connectivity: connectivity,
        request: () => apiService.delete(
            endPoint: ApiConstant.removeItemFromCart(productId),
            token: token
        ),
      );

      print("Response: $result");

      final cartResponse = GetCartProductsResponseDm.fromJson(result);
      return right(cartResponse);

    } catch (error) {
      if (error is DioException) {
        final errorMsg = error.response?.data['message'] ?? 'Something went wrong';
        return Left(ServerFailure(errorMsg));
      } else {
        return left(ServerFailure('Something went wrong ${error.toString()}'));
      }
    }
  }

  @override
  Future<Either<Failure, GetCartProductsResponseDm>> updateCartQuantity(String token, int count, String productId) async{
    try {
      final result = await handleDataNetworkRequest<Map<String, dynamic>>(
        connectivity: connectivity,
        request: () => apiService.put(
            endPoint: ApiConstant.removeItemFromCart(productId),
            data: {
              "count" : count,
            },
            token: token
        ),
      );

      print("Response: $result");

      final cartResponse = GetCartProductsResponseDm.fromJson(result);
      return right(cartResponse);

    } catch (error) {
      if (error is DioException) {
        final errorMsg = error.response?.data['message'] ?? 'Something went wrong';
        return Left(ServerFailure(errorMsg));
      } else {
        return left(ServerFailure('Something went wrong ${error.toString()}'));
      }
    }
    }
}
