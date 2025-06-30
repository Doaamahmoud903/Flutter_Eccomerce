import 'package:dartz/dartz.dart';
import 'package:eccomerce_app/core/errors/failures.dart';
import 'package:eccomerce_app/features/wishlist/domain/entities/wishlist_response_entity.dart';

abstract class WishlistRepository {
  Future<Either<Failure, GetWishlistResponseEntity>> getWishlistProducts(
    String token,
  );
  Future<Either<Failure, WishlistResponseEntity>> addToWishlist(
    String token,
    String productId,
  );
  Future<Either<Failure, WishlistResponseEntity>> removeFromWishlist(
    String token,
    String productId,
  );
}
