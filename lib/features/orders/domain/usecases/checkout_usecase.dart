import 'package:eccomerce_app/features/orders/domain/repository/order_repository.dart';
import 'package:injectable/injectable.dart';


@injectable
class CheckoutUsecase{
final OrderRepository orderRepository;

  CheckoutUsecase(this.orderRepository);
  call(String token ,String cartId)async{
    return await orderRepository.checkout(token, cartId);
  }
}