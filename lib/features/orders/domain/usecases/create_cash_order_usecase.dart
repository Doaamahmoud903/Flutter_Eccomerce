import 'package:eccomerce_app/features/orders/domain/repository/order_repository.dart';
import 'package:injectable/injectable.dart';


@injectable
class CreateCashOrderUsecase{
  final OrderRepository orderRepository;

  CreateCashOrderUsecase(this.orderRepository);
  call( String token ,String cartId ,String details , String phone ,String city) async{
    return await orderRepository.createCashOrder(token, cartId, details, phone, city);
  }
}