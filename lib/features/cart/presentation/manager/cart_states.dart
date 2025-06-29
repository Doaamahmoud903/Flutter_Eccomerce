import 'package:eccomerce_app/core/errors/failures.dart';
import 'package:eccomerce_app/features/cart/domain/entities/cart_response_entity.dart';
import '../../data/models/get_cart_response_dm.dart';

abstract class CartStates{}

class CartIntState extends CartStates{}

class CartLoadingState extends CartStates{}

class CartSuccesState extends CartStates{
  final CartResponseEntity cartResponseEntity;
  CartSuccesState(this.cartResponseEntity);

}

class CartFailureState extends CartStates{
  final Failure failure;
  CartFailureState(this.failure);
}
class GetCartSuccesState extends CartStates{
  final GetCartProductsResponseDm cart;
  GetCartSuccesState(this.cart);

}

class RemoveItemLoadingState extends CartStates{}
class RemoveItemErrorState extends CartStates{
  final Failure failure;
  RemoveItemErrorState(this.failure);

}

class UpdateItemLoadingState extends CartStates{}
class UpdateItemErrorState extends CartStates{
  final Failure failure;
  UpdateItemErrorState(this.failure);

}
