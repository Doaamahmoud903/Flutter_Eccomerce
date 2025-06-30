import 'package:eccomerce_app/features/wishlist/domain/repository/wishlist_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetWishlistUsecase {
  final WishlistRepository wishlistRepository;

  GetWishlistUsecase({required this.wishlistRepository});
  call(String token) async {
    return await wishlistRepository.getWishlistProducts(token);
  }
}
