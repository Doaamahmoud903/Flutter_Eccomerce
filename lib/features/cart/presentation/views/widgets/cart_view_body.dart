import 'package:auto_size_text/auto_size_text.dart';
import 'package:eccomerce_app/core/di/di.dart';
import 'package:eccomerce_app/core/routes/app_routes.dart';
import 'package:eccomerce_app/core/theming/color_manager.dart';
import 'package:eccomerce_app/core/widgets/custom_loding_indicator.dart';
import 'package:eccomerce_app/features/cart/presentation/manager/cart_states.dart';
import 'package:eccomerce_app/features/cart/presentation/manager/cart_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/custom_badge.dart';
import 'cart_item.dart';

class CartViewBody extends StatelessWidget {
   CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _customAppBar(context ,  CartViewModel.get(context).cartData?.numOfCartItems?.toInt() ?? 0),
      body: BlocBuilder<CartViewModel, CartStates>(
        bloc: CartViewModel.get(context)..getCart(),
        builder: (context, state) {
          print(state);

          if (state is CartLoadingState ||
              state is UpdateItemLoadingState ||
              state is RemoveItemLoadingState) {
            return const Center(child: CustomLoadingIndicator());
          } else if (state is CartFailureState) {
            print(state.failure.errMessage);
            return Center(child: Text(state.failure.errMessage));
          } else if (state is GetCartSuccesState) {
            final cart = state.cart;
            final products = cart.data?.products ?? [];
            final cartId = cart.cartId;

            if (products.isEmpty) {
              return const Center(
                child: Text(
                  "No Items in Cart",
                  style: TextStyle(color: Colors.black),
                ),
              );
            }

            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return CartItem(item: products[index], cart: cart);
                    },
                  ),
                ),
                _buildCheckOut(context, cart.data!.totalCartPrice!.toDouble() ,cartId!),
              ],
            );
          } else {
            return const Center(
              child: Text(
                "Something went wrong",
                style: TextStyle(color: Colors.black),
              ),
            );
          }
        },
      ),
    );

  }

  Widget _buildCheckOut(BuildContext context, double price ,String cartId) {
    return Padding(
      padding: EdgeInsets.only(bottom: 50.h, left: 16.w, right: 16.w),
      child: Row(
        children: [
          Column(
            children: [
              AutoSizeText(
                "Total Price",
                maxLines: 1,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: ColorManager.primaryColor,
                  fontSize: 18.sp,
                ),
              ),
              AutoSizeText(
                "$price",
                maxLines: 1,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: ColorManager.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.sp,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 30.w,
          ),
          Expanded(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: ColorManager.primaryColor),
                  onPressed: () {
                   Navigator.pushNamed(context, AppRoutes.checkout,arguments: cartId);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AutoSizeText(
                        "Check Out",
                        maxLines: 1,
                        style:
                        Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: ColorManager.whiteColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: ColorManager.whiteColor,
                        size: 28.sp,
                      ),
                    ],
                  )))
        ],
      ),
    );
  }
}

PreferredSizeWidget _customAppBar(BuildContext context , int count) {
  return AppBar(
    surfaceTintColor: Colors.transparent,
    toolbarHeight: 50.h,
    centerTitle: true,
    elevation: 0,
    title: const Text("Cart"),
    backgroundColor: Colors.transparent,
    foregroundColor: ColorManager.primaryColor,
    titleTextStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
        fontSize: 24.sp,
        fontWeight: FontWeight.w500,
        color: ColorManager.primaryColor),
    actions: [
      IconButton(
        padding: EdgeInsets.zero,
        onPressed: () {
          CartViewModel.get(context).clearCart();
        },
        icon: Icon(
          CupertinoIcons.delete,
          size: 30.sp,
          color: ColorManager.redColor,
        ),
      ),
      Padding(
        padding: EdgeInsets.only(right: 16.w),
        child:  CustomAppBarBadge(count: count),
      ),
    ],
  );
}
