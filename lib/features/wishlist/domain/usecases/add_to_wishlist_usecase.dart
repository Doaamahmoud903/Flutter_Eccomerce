import 'package:eccomerce_app/features/wishlist/domain/repository/wishlist_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddToWishlistUsecase {
  final WishlistRepository wishlistRepository;

  AddToWishlistUsecase({required this.wishlistRepository});
  call(String token, String productId) async {
    return await wishlistRepository.addToWishlist(token, productId);
  }
}
