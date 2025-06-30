import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../models/get_user_order_response_dm.dart';
import '../models/orders_response_dm.dart';

abstract class OrdersRemoteDataSource{
  Future<Either<Failure , OrdersResponseDm>>createCashOrder(
      String token ,String cartId ,String details , String phone ,String city);
  Future<Either<Failure , OrdersResponseDm>>checkout( String token ,String cartId);
  Future<Either<Failure , GetUserOrderResponseDm>>getUserOrders(String userId);

}