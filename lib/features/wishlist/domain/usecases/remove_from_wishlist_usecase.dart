import 'package:eccomerce_app/features/wishlist/domain/repository/wishlist_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class RemoveFromWishlistUsecase {
  final WishlistRepository wishlistRepository;

  RemoveFromWishlistUsecase(this.wishlistRepository);

  call(String token, String productId) async {
    return await wishlistRepository.removeFromWishlist(token, productId);
  }
}
