import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:eccomerce_app/core/errors/failures.dart';
import 'package:eccomerce_app/features/cart/data/data_sources/local/cart_local_data_source.dart';
import 'package:eccomerce_app/features/cart/data/data_sources/remote/cart_remote_data_source.dart';
import 'package:eccomerce_app/features/cart/domain/entities/cart_response_entity.dart';
import 'package:eccomerce_app/features/cart/domain/repository/cart_repository.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/connectivity/handle_network_request.dart';
import '../../domain/entities/get_cart_response_entity.dart';
import '../models/get_cart_response_dm.dart';

@Injectable(as: CartRepository)
class CartRepositoryImpl extends CartRepository{
  final Connectivity connectivity;
  final CartLocalDataSource cartLocalDataSource;
  final CartRemoteDataSource cartRemoteDataSource;

  CartRepositoryImpl(
      {required this.connectivity,required this.cartLocalDataSource, required this.cartRemoteDataSource});
  @override
  Future<Either<Failure, CartResponseEntity>> addToCart(String token, String productId) async {
    return await handleRepoNetworkRequest<CartResponseEntity>(
      connectivity: connectivity,
      onlineRequest: () async {
        final cartResponse = await cartRemoteDataSource.addToCart(token, productId);
        return cartResponse;
      },
      // offlineRequest: () async {
      //   final cachedCart =
      //   await cartLocalDataSource.getCartInfo(token);
      //   if (cachedCart != null) {
      //     return Right(cachedCart);
      //   } else {
      //     return Left(NetworkFailure("No Cached Cart Found"));
      //   }
      // },
    );
  }

  @override
  Future<Either<Failure, CartResponseEntity>> clearCart(String token) async {
    return await handleRepoNetworkRequest<CartResponseEntity>(
      connectivity: connectivity,
      onlineRequest: () async {
        final response = await cartRemoteDataSource.clearCart(token);
        if (response.isRight()) {
          await cartLocalDataSource.clearCartInfo(token);
        }
        return response;
      },
      offlineRequest: () async {
        return Left(NetworkFailure("Cannot clear cart while offline"));
      },
    );
  }


  @override
  Future<Either<Failure, GetCartProductsResponseDm>> getCart(String token) async {
    return await handleRepoNetworkRequest<GetCartProductsResponseDm>(
      connectivity: connectivity,

      onlineRequest: () async {
        final cartResponse = await cartRemoteDataSource.getCart(token);

        return cartResponse.fold(
              (failure) => Left(failure), // لو فشل من الـ API
              (cartEntity) async {
            await cartLocalDataSource.saveCartInfo(token, cartEntity);
            return Right(cartEntity);
          },
        );
      },

      offlineRequest: () async {
        final cachedCart = await cartLocalDataSource.getCartInfo(token);
        if (cachedCart != null) {
          return Right(cachedCart);
        } else {
          return Left(NetworkFailure("No Cached Cart Found"));
        }
      },
    );
  }



  @override
  Future<Either<Failure, GetCartResponseEntity>> removeItemFromCart(String token, String productId) async {
    return await handleRepoNetworkRequest<GetCartResponseEntity>(
      connectivity: connectivity,
      onlineRequest: () async {
        final response = await cartRemoteDataSource.removeItemFromCart(token, productId);
        // if (response.isRight()) {
        //   final updatedCart = response.getOrElse(() => throw Exception("No updated cart"));
        //  // await cartLocalDataSource.saveCartInfo(token, updatedCart);
        // }
        return response;
      },
      offlineRequest: () async {
        return Left(NetworkFailure("Cannot remove item while offline"));
      },
    );
  }


  @override
  Future<Either<Failure, GetCartResponseEntity>> updateCartQuantity(String token, int count, String productId) async {
    return await handleRepoNetworkRequest<GetCartResponseEntity>(
      connectivity: connectivity,
      onlineRequest: () async {
        final response = await cartRemoteDataSource.updateCartQuantity(token, count, productId);
        // if (response.isRight()) {
        //   final updatedCart = response.getOrElse(() => throw Exception("No updated cart"));
        //   await cartLocalDataSource.saveCartInfo(token, updatedCart);
        // }
        return response;
      },
      offlineRequest: () async {
        return Left(NetworkFailure("Cannot update cart while offline"));
      },
    );
  }

}
