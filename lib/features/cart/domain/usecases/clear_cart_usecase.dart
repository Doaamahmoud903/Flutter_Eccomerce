import 'package:eccomerce_app/features/cart/domain/repository/cart_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class ClearCartUsecase{
  final CartRepository cartRepository;
  ClearCartUsecase(this.cartRepository);

  invoke(String token ){
    return cartRepository.clearCart(token);
  }

}