import 'package:eccomerce_app/features/cart/domain/repository/cart_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCartUsecase{
  final CartRepository cartRepository;
  GetCartUsecase(this.cartRepository);

  invoke(String token){
    return cartRepository.getCart(token);
  }

}