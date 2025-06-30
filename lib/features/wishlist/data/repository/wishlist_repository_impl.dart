import 'package:dartz/dartz.dart';
import 'package:eccomerce_app/core/errors/failures.dart';
import 'package:eccomerce_app/features/wishlist/data/data_sources/remote/wishlist_remote_data_source.dart';
import 'package:eccomerce_app/features/wishlist/domain/entities/wishlist_response_entity.dart';
import 'package:eccomerce_app/features/wishlist/domain/repository/wishlist_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: WishlistRepository)
class WishlistRepositoryImpl extends WishlistRepository {
  final WishlistRemoteDataSource wishlistRemoteDataSource;

  WishlistRepositoryImpl({required this.wishlistRemoteDataSource});
  @override
  Future<Either<Failure, WishlistResponseEntity>> addToWishlist(
    String token,
    String productId,
  ) async {
    return await wishlistRemoteDataSource.addToWishlist(token, productId);
  }

  @override
  Future<Either<Failure, GetWishlistResponseEntity>> getWishlistProducts(
    String token,
  ) async {
    return await wishlistRemoteDataSource.getWishlistProducts(token);
  }

  @override
  Future<Either<Failure, WishlistResponseEntity>> removeFromWishlist(
    String token,
    String productId,
  ) async {
    return await wishlistRemoteDataSource.removeFromWishlist(token, productId);
  }
}
