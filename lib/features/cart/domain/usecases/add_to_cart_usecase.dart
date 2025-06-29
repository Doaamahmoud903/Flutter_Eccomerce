import 'package:eccomerce_app/features/cart/domain/repository/cart_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddToCartUsecase{
  final CartRepository cartRepository;
  AddToCartUsecase(this.cartRepository);

  invoke(String token , String productId){
    return cartRepository.addToCart(token, productId);
  }

}