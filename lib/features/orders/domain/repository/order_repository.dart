import 'package:dartz/dartz.dart';
import 'package:eccomerce_app/core/errors/failures.dart';
import 'package:eccomerce_app/features/orders/data/models/get_user_order_response_dm.dart';
import 'package:eccomerce_app/features/orders/data/models/orders_response_dm.dart';

abstract class OrderRepository{
  Future<Either<Failure , OrdersResponseDm>>createCashOrder( String token ,String cartId ,String details , String phone ,String city);
  Future<Either<Failure , OrdersResponseDm>>checkout( String token ,String cartId);
  Future<Either<Failure , GetUserOrderResponseDm>>getUserOrders(String userId);


}