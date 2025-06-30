import 'package:eccomerce_app/features/orders/domain/repository/order_repository.dart';
import 'package:injectable/injectable.dart';


@injectable
class GetOrdersUsecase{
  final OrderRepository orderRepository;

  GetOrdersUsecase(this.orderRepository);
  call(String userId)async{
    return await orderRepository.getUserOrders(userId);
  }
}