import 'package:dartz/dartz.dart';
import 'package:eccomerce_app/core/errors/failures.dart';
import 'package:eccomerce_app/features/cart/domain/entities/cart_response_entity.dart';

import '../entities/get_cart_response_entity.dart';

abstract class CartRepository{
  Future<Either<Failure , CartResponseEntity>> addToCart(String token , String productId);
  Future<Either<Failure , GetCartResponseEntity>> updateCartQuantity(String token ,int count, String productId);
  Future<Either<Failure , GetCartResponseEntity>> getCart(String token );
  Future<Either<Failure , CartResponseEntity>> clearCart(String token );
  Future<Either<Failure , GetCartResponseEntity>> removeItemFromCart(String token , String productId);

}
