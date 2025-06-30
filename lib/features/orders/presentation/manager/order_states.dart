import 'package:eccomerce_app/core/errors/failures.dart';
import 'package:eccomerce_app/features/orders/data/models/get_user_order_response_dm.dart';
import 'package:eccomerce_app/features/orders/data/models/orders_response_dm.dart';

abstract class OrderStates{}
class OrderIntialState extends OrderStates{}

class OrderLoadingState extends OrderStates{}

class GetOrdersSuccessState extends OrderStates{
  final OrdersResponseDm orderResponseDm;
  GetOrdersSuccessState(this.orderResponseDm);

}

class OrderFailureState extends OrderStates{
   final Failure failure;
  OrderFailureState(this.failure);

}

class CreateOrdersSuccessState extends OrderStates{
  final OrdersResponseDm orderResponseDm;
  CreateOrdersSuccessState(this.orderResponseDm);

}

class CreateOrderFailureState extends OrderStates{
  final Failure failure;
  CreateOrderFailureState(this.failure);

}