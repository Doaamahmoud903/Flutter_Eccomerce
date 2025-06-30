import 'package:eccomerce_app/core/errors/failures.dart';
import 'package:eccomerce_app/features/wishlist/domain/entities/wishlist_response_entity.dart';

abstract class WishlistState {}

class WishlistInitialState extends WishlistState {}

class WishlistLoadingState extends WishlistState {}

class WishlistSuccessState extends WishlistState {
  final GetWishlistResponseEntity wishlistResponseEntity;
  WishlistSuccessState(this.wishlistResponseEntity);
}

class WishlistErrorState extends WishlistState {
  final Failure failure;
  WishlistErrorState(this.failure);
}

class WishlistItemAddedState extends WishlistState {
  final WishlistResponseEntity wishlistResponseEntity;
  WishlistItemAddedState(this.wishlistResponseEntity);
}

class WishlistItemAddedFailedState extends WishlistState {
  final Failure failure;
  WishlistItemAddedFailedState(this.failure);
}

class WishlistItemRemovedState extends WishlistState {
  final WishlistResponseEntity wishlistResponseEntity;
  WishlistItemRemovedState(this.wishlistResponseEntity);
}

class WishlistItemRemovedFailedState extends WishlistState {
  final Failure failure;
  WishlistItemRemovedFailedState(this.failure);
}
