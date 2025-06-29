import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:eccomerce_app/core/di/di.dart';
import 'package:eccomerce_app/core/theming/color_manager.dart';
import 'package:eccomerce_app/features/cart/domain/entities/cart_response_entity.dart';
import 'package:eccomerce_app/features/cart/presentation/manager/cart_view_model.dart';
import 'package:eccomerce_app/features/cart/presentation/views/cart_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/utils/toast_utils.dart';
import '../../../../../core/widgets/custom_loding_indicator.dart';
import '../../../data/models/get_cart_response_dm.dart';
import '../../../domain/entities/get_cart_response_entity.dart';
import '../../manager/cart_states.dart';

class CartItem extends StatefulWidget {
  final GetCartProductsEntity item;
  final GetCartResponseEntity cart;
   CartItem({super.key, required this.item, required this.cart});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  int itemCount = 1;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //todo: navigate to product detail screen
        Navigator.pushNamed(context, AppRoutes.productDetailsRoute);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        child: Container(
          height: 142.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18.r),
            border: Border.all(color: ColorManager.primary30Opacity, width: 1),
          ),
          child: Row(
            children: [
              _buildImageContainer(),
              Expanded(
                child: Padding(
                  padding:
                  EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
                  child: Column(
                    children: [
                      _buildItemHeader(),
                      SizedBox(height: 5.h),
                      _buildItemDetails(),
                      SizedBox(height: 5.h),
                      _buildItemPrice(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImageContainer() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: ColorManager.primary30Opacity, width: 1),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.r),
        child: CachedNetworkImage(
          width: 130.w,
          height: 145.h,
          fit: BoxFit.cover,
          imageUrl: widget.item.imageCover ?? "",
          placeholder: (context, url) => const Center(
            child: CircularProgressIndicator(
              color: ColorManager.yellowColor,
            ),
          ),
          errorWidget: (context, url, error) => const Icon(
            Icons.error,
            color: ColorManager.redColor,
          ),
        ),
      ),
    );
  }

  Widget _buildItemHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AutoSizeText(
          widget.item.title?.split(" ").take(3).join(" ") ?? "",
          maxLines: 1,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: ColorManager.primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 18.sp,
          ),
        ),
        InkWell(
          onTap: () {
            CartViewModel.get(context).removeItemFromCart(widget.item.id!);
          },
          child: Icon(
            CupertinoIcons.delete,
            color: ColorManager.primaryColor,
            size: 25.sp,
          ),
        ),
      ],
    );
  }

  Widget _buildItemDetails() {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: ColorManager.blackColor,
          radius: 10.r,
        ),
        SizedBox(width: 10.w),
        AutoSizeText(
          "black | size 40",
          maxLines: 1,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: ColorManager.primaryDarkLight,
            fontWeight: FontWeight.w500,
            fontSize: 14.sp,
          ),
        ),
      ],
    );
  }

  Widget _buildItemPrice() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AutoSizeText(
          "Egp ${widget.item.price}",
          maxLines: 1,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: ColorManager.primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 18.sp,
          ),
        ),
        _buildQuantityControl(),
      ],
    );
  }

  Widget _buildQuantityControl() {
    return Container(
      height: 50.h,
      decoration: BoxDecoration(
        color: ColorManager.primaryColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: () {
              if (widget.item.count!.toInt() > 1) {
                CartViewModel.get(context).updateCartQuantity(
                  widget.item.id!,
                  widget.item.count!.toInt() - 1,
                );
              }
            },
            icon: Icon(
              Icons.remove_circle_outline_rounded,
              color: ColorManager.whiteColor,
              size: 25.sp,
            ),
          ),
          AutoSizeText(
            "${widget.item.count}",
            maxLines: 1,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: ColorManager.whiteColor,
              fontWeight: FontWeight.bold,
              fontSize: 14.sp,
            ),
          ),
          IconButton(
            onPressed: () {
              CartViewModel.get(context).updateCartQuantity(
                widget.item.id!,
                widget.item.count!.toInt() + 1,
              );
            },
            icon: Icon(
              Icons.add_circle_outline_rounded,
              color: ColorManager.whiteColor,
              size: 25.sp,
            ),
          ),
        ],
      ),
    );
  }

}
