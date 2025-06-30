import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:eccomerce_app/core/api/api_services.dart';
import 'package:eccomerce_app/core/connectivity/handle_network_request.dart';
import 'package:eccomerce_app/core/errors/failures.dart';
import 'package:eccomerce_app/features/orders/data/data_sources/orders_remote_data_source.dart';
import 'package:eccomerce_app/features/orders/data/models/get_user_order_response_dm.dart';
import 'package:eccomerce_app/features/orders/data/models/orders_response_dm.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/api/api_constant.dart';


@Injectable(as:OrdersRemoteDataSource )
class OrdersRemoteDataSourceImpl extends OrdersRemoteDataSource{
  final ApiService apiService;
  final Connectivity connectivity;
  OrdersRemoteDataSourceImpl(this.apiService, this.connectivity);
  @override
  Future<Either<Failure, OrdersResponseDm>> createCashOrder(
      String token ,String cartId ,String details , String phone ,String city) async {
    try {
      final result = await handleDataNetworkRequest<Map<String, dynamic>>(
        connectivity: connectivity,
        request:
            () => apiService.post(
          endPoint: ApiConstant.createOrder(cartId),
          data: {
            "shippingAddress":{
              "details": details,
              "phone": phone,
              "city": city
            } },
          token: token,
        ),
      );

      print("Response: $result");
      final orderResponse = OrdersResponseDm.fromJson(result);
      return right(orderResponse);
    }catch(error){
      if(error is DioException){
        final errorMsg = error.message ?? "Something went wrong";
        return Left(ServerFailure(errorMsg));
      }else{
        return left(ServerFailure(error.toString() ?? ""));
      }
    }
  }

  @override
  Future<Either<Failure, OrdersResponseDm>> checkout(String token, String cartId) {
    // TODO: implement createCashOrder
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, GetUserOrderResponseDm>> getUserOrders(String userId) async{
    try {
      final result = await handleDataNetworkRequest<Map<String, dynamic>>(
        connectivity: connectivity,
        request:
            () => apiService.get(endPoint: ApiConstant.orders)
      );
      print("Response: $result");
      final orderResponse = GetUserOrderResponseDm.fromJson(result);
      return right(orderResponse);
    }catch(error){
      if(error is DioException){
        final errorMsg = error.message ?? "Something went wrong";
        return Left(ServerFailure(errorMsg));
      }else{
        return left(ServerFailure(error.toString() ?? ""));
      }
    }
  }
}