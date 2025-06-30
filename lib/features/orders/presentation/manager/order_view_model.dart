import 'package:eccomerce_app/core/utils/toast_utils.dart';
import 'package:eccomerce_app/features/orders/domain/usecases/checkout_usecase.dart';
import 'package:eccomerce_app/features/orders/domain/usecases/create_cash_order_usecase.dart';
import 'package:eccomerce_app/features/orders/domain/usecases/get_orders_usecase.dart';
import 'package:eccomerce_app/features/orders/presentation/manager/order_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/cach_helper/cach_helper.dart';


@injectable
class OrderViewModel extends Cubit<OrderStates>{
  final GetOrdersUsecase getOrdersUsecase;
  final CreateCashOrderUsecase createCashOrderUsecase;
  final CheckoutUsecase checkoutUsecase;

  OrderViewModel(this.getOrdersUsecase, this.createCashOrderUsecase, this.checkoutUsecase):super(OrderIntialState());
  final detailsController = TextEditingController();
  final phoneController = TextEditingController();
  final cityController = TextEditingController();

  static OrderViewModel get(context) => BlocProvider.of(context);

  void getOrders(String userId)async {
    final token = await CacheHelper().getData("token");
    emit(OrderLoadingState());
    final response = await getOrdersUsecase.call(userId);
    print(response);
    response.fold(
          (failure) => emit(OrderFailureState(failure)),
          (success) => emit(GetOrdersSuccessState(success)),
    );
  }


  void createCashOrder(String cartId)async {
    final token = await CacheHelper().getData("token");
    emit(OrderLoadingState());
    final response = await createCashOrderUsecase.call(
        token,
        cartId,
        detailsController.text,
        phoneController.text,
        cityController.text);
    print(response);
    response.fold(
          (failure) => emit(CreateOrderFailureState(failure)),
          (success) => {
            //getOrders(userId)
            ToastUtils.showSuccessToast("Order Created Successfully"),
            emit(CreateOrdersSuccessState(success)),
          }
    );
  }
}