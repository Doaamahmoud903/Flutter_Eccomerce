import 'package:dartz/dartz.dart';
import 'package:eccomerce_app/features/cart/domain/entities/get_cart_response_entity.dart';
import '../../../../../core/errors/failures.dart';
import '../../../domain/entities/cart_response_entity.dart';
import '../../models/get_cart_response_dm.dart';

abstract class CartRemoteDataSource{
  Future<Either<Failure , CartResponseEntity>> addToCart(String token , String productId);
  Future<Either<Failure , GetCartResponseEntity>> updateCartQuantity(String token ,int count, String productId);
  Future<Either<Failure , GetCartProductsResponseDm>> getCart(String token );
  Future<Either<Failure , CartResponseEntity>> clearCart(String token );
  Future<Either<Failure , GetCartResponseEntity>> removeItemFromCart(String token , String productId);

}
