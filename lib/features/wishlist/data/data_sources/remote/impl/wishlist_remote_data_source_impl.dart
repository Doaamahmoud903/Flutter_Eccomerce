import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:eccomerce_app/core/api/api_constant.dart';
import 'package:eccomerce_app/core/api/api_services.dart';
import 'package:eccomerce_app/core/connectivity/handle_network_request.dart';
import 'package:eccomerce_app/core/errors/failures.dart';
import 'package:eccomerce_app/features/wishlist/data/data_sources/remote/wishlist_remote_data_source.dart';
import 'package:eccomerce_app/features/wishlist/data/models/wishlist_response_dm.dart';
import 'package:eccomerce_app/features/wishlist/domain/entities/wishlist_response_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: WishlistRemoteDataSource)
class WishlistRemoteDataSourceImpl extends WishlistRemoteDataSource {
  final ApiService apiService;
  final Connectivity connectivity;

  WishlistRemoteDataSourceImpl({
    required this.apiService,
    required this.connectivity,
  });
  @override
  Future<Either<Failure, WishlistResponseDm>> addToWishlist(
    String token,
    String productId,
  ) async {
    try {
      final result = await handleDataNetworkRequest<Map<String, dynamic>>(
        connectivity: connectivity,
        request:
            () => apiService.post(
              endPoint: ApiConstant.wishlist,
              data: {"productId": productId},
              token: token,
            ),
      );

      print("Response: $result");

      final wishlistResponse = WishlistResponseDm.fromJson(result);
      return right(wishlistResponse);
    } catch (error) {
      if (error is DioException) {
        final errorMsg =
            error.response?.data['message'] ?? 'Something went wrong';
        return Left(ServerFailure(errorMsg));
      } else {
        return left(ServerFailure('Something went wrong ${error.toString()}'));
      }
    }
  }

  @override
  Future<Either<Failure, GetWishlistResponseDm>> getWishlistProducts(
    String token,
  ) async {
    try {
      final request = await handleDataNetworkRequest(
        connectivity: connectivity,
        request:
            () => apiService.get(endPoint: ApiConstant.wishlist, token: token),
      );
      print("Response : $request");
      final response = GetWishlistResponseDm.fromJson(request);
      return right(response);
    } catch (error) {
      if (error is DioException) {
        String errorMessage =
            error.response?.data['message'] ?? 'Something went wrong';
        return Left(ServerFailure(errorMessage));
      } else {
        return left(ServerFailure('Something went wrong ${error.toString()}'));
      }
    }
  }

  @override
  Future<Either<Failure, WishlistResponseDm>> removeFromWishlist(
    String token,
    String productId,
  ) async {
    try {
      final request = await handleDataNetworkRequest(
        connectivity: connectivity,
        request:
            () => apiService.delete(
              endPoint: ApiConstant.removeItemFromWishlist(productId),
              token: token,
            ),
      );
      print("Response : $request");
      final response = WishlistResponseDm.fromJson(request);
      return right(response);
    } catch (error) {
      if (error is DioException) {
        String errorMessage =
            error.response?.data['message'] ?? 'Something went wrong';
        return Left(ServerFailure(errorMessage));
      } else {
        return left(ServerFailure('Something went wrong ${error.toString()}'));
      }
    }
  }
}
