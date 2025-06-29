import 'package:eccomerce_app/features/cart/domain/repository/cart_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class RemoveFromCartUsecase{
  final CartRepository cartRepository;
  RemoveFromCartUsecase(this.cartRepository);

  invoke(String token , String productId){
    return cartRepository.removeItemFromCart(token, productId);
  }

}