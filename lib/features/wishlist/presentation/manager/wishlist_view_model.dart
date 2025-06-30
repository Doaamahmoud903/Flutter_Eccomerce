import 'package:eccomerce_app/core/cach_helper/cach_helper.dart';
import 'package:eccomerce_app/features/wishlist/domain/usecases/add_to_wishlist_usecase.dart';
import 'package:eccomerce_app/features/wishlist/domain/usecases/get_wishlist_usecase.dart';
import 'package:eccomerce_app/features/wishlist/domain/usecases/remove_from_wishlist_usecase.dart';
import 'package:eccomerce_app/features/wishlist/presentation/manager/wishlist_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/utils/toast_utils.dart';

@injectable
class WishlistViewModel extends Cubit<WishlistState> {
  final AddToWishlistUsecase addToWishlistUsecase;
  final RemoveFromWishlistUsecase removeFromWishlistUsecase;
  final GetWishlistUsecase getWishlistUsecase;
  WishlistViewModel({
    required this.addToWishlistUsecase,
    required this.removeFromWishlistUsecase,
    required this.getWishlistUsecase,
  }) : super(WishlistInitialState());

  static WishlistViewModel get(context) => BlocProvider.of(context);

  void addItemToWishlist(String productId) async {
    final token = await CacheHelper().getData("token");
    emit(WishlistLoadingState());
    final response = await addToWishlistUsecase.call(token, productId);
    print(response);
    response.fold(
      (failure) => emit(WishlistItemAddedFailedState(failure)),
      (success) => {
      getWishlist(),
      ToastUtils.showSuccessToast("Item added to wishlist", ),
        emit(WishlistItemAddedState(success))},
    );
  }

  void removeItemFromWishlist(String productId) async {
    final token = await CacheHelper().getData("token");
    emit(WishlistLoadingState());
    final response = await removeFromWishlistUsecase.call(token, productId);
    print(response);
    response.fold(
      (failure) => emit(WishlistItemRemovedFailedState(failure)),
      (success) => {
        getWishlist(),
        ToastUtils.showErrorToast("Item Removed to wishlist", ),
        emit(WishlistItemRemovedState(success))},
    );
  }

  void getWishlist() async {
    final token = await CacheHelper().getData("token");
    emit(WishlistLoadingState());
    final response = await getWishlistUsecase.call(token);
    print(response);
    response.fold(
      (failure) => emit(WishlistErrorState(failure)),
      (success) => emit(WishlistSuccessState(success)),
    );
  }
}
