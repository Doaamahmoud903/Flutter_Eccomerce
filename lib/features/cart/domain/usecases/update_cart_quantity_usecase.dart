import 'package:eccomerce_app/features/cart/domain/repository/cart_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdateCartQuantityUsecase{
  final CartRepository cartRepository;
  UpdateCartQuantityUsecase(this.cartRepository);

  invoke(String token ,int count, String productId){
    return cartRepository.updateCartQuantity(token, count, productId);
  }

}