import 'package:eccomerce_app/core/theming/color_manager.dart';
import 'package:eccomerce_app/features/wishlist/presentation/manager/wishlist_states.dart';
import 'package:eccomerce_app/features/wishlist/presentation/manager/wishlist_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/toast_utils.dart';
import 'favourite_item.dart';

class WishlistViewBody extends StatelessWidget {
  WishlistViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    WishlistViewModel wishlistViewModel = WishlistViewModel.get(context);

    return BlocConsumer<WishlistViewModel, WishlistState>(
      listener: (context, state) {
        if (state is WishlistItemAddedState) {
          wishlistViewModel.getWishlist();
          ToastUtils.showSuccessToast(
            "Item added to wishlist",
          );
        }
      },
      builder: (context, state) {
        if (state is WishlistLoadingState) {
          return Center(child: CircularProgressIndicator());
        } else if (state is WishlistErrorState) {
          return Center(child: Text(state.failure.errMessage));
        } else if (state is WishlistSuccessState) {
          final favoriteProducts = state.wishlistResponseEntity.data ?? [];
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemBuilder:
                      (context, index) =>
                          FavoriteItem(product: favoriteProducts[index]),
                  itemCount: favoriteProducts.length,
                ),
              ),
            ],
          );
        }
        return Center(
          child: Text(
            "No items in wishlist",
            style: TextStyle(fontSize: 16.sp, color: ColorManager.primaryColor),
          ),
        );
      },
    );
  }

  OutlineInputBorder _buildCustomBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: ColorManager.primaryColor, width: 1),
      borderRadius: BorderRadius.circular(50.r),
    );
  }
}
