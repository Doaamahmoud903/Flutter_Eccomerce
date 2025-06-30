import 'package:dartz/dartz.dart';
import 'package:eccomerce_app/core/errors/failures.dart';
import 'package:eccomerce_app/features/orders/data/data_sources/orders_remote_data_source.dart';
import 'package:eccomerce_app/features/orders/data/models/get_user_order_response_dm.dart';
import 'package:eccomerce_app/features/orders/data/models/orders_response_dm.dart';
import 'package:eccomerce_app/features/orders/domain/repository/order_repository.dart';
import 'package:injectable/injectable.dart';


@Injectable(as: OrderRepository)
class OrdersRepositoryImpl extends OrderRepository{
  final OrdersRemoteDataSource ordersRemoteDataSource;

  OrdersRepositoryImpl(this.ordersRemoteDataSource);
  @override
  Future<Either<Failure, OrdersResponseDm>> checkout(String token, String cartId) async{
    return await ordersRemoteDataSource.checkout(token, cartId);
  }

  @override
  Future<Either<Failure, OrdersResponseDm>> createCashOrder(String token, String cartId, String details, String phone, String city)async {
    return await ordersRemoteDataSource.createCashOrder(token, cartId, details, phone, city);
  }

  @override
  Future<Either<Failure, GetUserOrderResponseDm>> getUserOrders(String userId) async{
    return await ordersRemoteDataSource.getUserOrders(userId);
  }
}