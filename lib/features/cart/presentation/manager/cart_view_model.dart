import 'package:eccomerce_app/core/cach_helper/cach_helper.dart';
import 'package:eccomerce_app/features/cart/domain/entities/get_cart_response_entity.dart';
import 'package:eccomerce_app/features/cart/domain/usecases/add_to_cart_usecase.dart';
import 'package:eccomerce_app/features/cart/domain/usecases/clear_cart_usecase.dart';
import 'package:eccomerce_app/features/cart/domain/usecases/get_cart_usecase.dart';
import 'package:eccomerce_app/features/cart/domain/usecases/remove_from_cart_usecase.dart';
import 'package:eccomerce_app/features/cart/domain/usecases/update_cart_quantity_usecase.dart';
import 'package:eccomerce_app/features/cart/presentation/manager/cart_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/utils/toast_utils.dart';

@injectable
class CartViewModel extends Cubit<CartStates>{
  final AddToCartUsecase addToCartUsecase;
  final RemoveFromCartUsecase removeFromCartUsecase;
  final GetCartUsecase getCartUsecase;
  final ClearCartUsecase clearCartUsecase;
  final UpdateCartQuantityUsecase updateCartQuantityUsecase;

  CartViewModel(this.addToCartUsecase, this.removeFromCartUsecase, this.getCartUsecase, this.clearCartUsecase, this.updateCartQuantityUsecase):super(CartIntState());

  static CartViewModel get(context) => BlocProvider.of(context);

  void addToCart(String productId) async{
    emit(CartLoadingState());
    final String token = await CacheHelper().getData("token");
    final response = await addToCartUsecase.invoke(token, productId);
    print(response);
    response.fold(
        (failure) => emit(CartFailureState(failure)),
        (cartResponse) => emit(CartSuccesState(cartResponse))
    );
    

   }

  GetCartResponseEntity? cartData;

  void getCart() async{
    emit(CartLoadingState());
    final String token = await CacheHelper().getData("token");
    final response = await getCartUsecase.invoke(token);
    print(response);
    response.fold(
            (failure) => emit(CartFailureState(failure)),
            (cartResponse) => {
              cartData = cartResponse ,
          emit(GetCartSuccesState(cartResponse))
        }
    );
  }

  void removeItemFromCart(String productId) async {
    emit(RemoveItemLoadingState());
    final String token = await CacheHelper().getData("token");
    final response = await removeFromCartUsecase.invoke(token, productId);
    print(response);

    response.fold(
          (failure) => emit(RemoveItemErrorState(failure)),
          (cartResponse) async {
           ToastUtils.showSuccessToast(cartResponse.message ?? "Removed successfully");

        final updatedCart = await getCartUsecase.invoke(token);
        updatedCart.fold(
              (failure) => emit(CartFailureState(failure)),
              (cartEntity) {
            cartData = cartEntity;
            emit(GetCartSuccesState(cartEntity));
          },
        );
      },
    );
  }

  void updateCartQuantity(String productId , int count) async {
    emit(UpdateItemLoadingState());
    final String token = await CacheHelper().getData("token");
    final response = await updateCartQuantityUsecase.invoke(token, count, productId);
    print(response);

    response.fold(
          (failure) => emit(UpdateItemErrorState(failure)),
          (cartResponse) async {
        ToastUtils.showSuccessToast(cartResponse.message ?? "Updated successfully");
        final updatedCart = await getCartUsecase.invoke(token);
        updatedCart.fold(
              (failure) => emit(CartFailureState(failure)),
              (cartEntity) {
            cartData = cartEntity;
            emit(GetCartSuccesState(cartEntity));
          },
        );
      },
    );
  }

  void clearCart() async {
    emit(UpdateItemLoadingState());
    final String token = await CacheHelper().getData("token");
    final response = await clearCartUsecase.invoke(token);
    print(response);

    response.fold(
          (failure) => emit(UpdateItemErrorState(failure)),
          (cartResponse) async {
        ToastUtils.showSuccessToast(cartResponse.message ?? "Cart Cleared successfully");
        final updatedCart = await getCartUsecase.invoke(token);
        updatedCart.fold(
              (failure) => emit(CartFailureState(failure)),
              (cartEntity) {
            cartData = cartEntity;
            emit(GetCartSuccesState(cartEntity));
          },
        );
      },
    );
  }

}
