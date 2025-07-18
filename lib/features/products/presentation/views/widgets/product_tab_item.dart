import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:eccomerce_app/core/di/di.dart';
import 'package:eccomerce_app/core/theming/styles_manager.dart';
import 'package:eccomerce_app/core/utils/assets_manager.dart';
import 'package:eccomerce_app/core/theming/color_manager.dart';
import 'package:eccomerce_app/core/utils/toast_utils.dart';
import 'package:eccomerce_app/core/widgets/custom_loding_indicator.dart';
import 'package:eccomerce_app/features/cart/presentation/manager/cart_states.dart';
import 'package:eccomerce_app/features/cart/presentation/manager/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../wishlist/presentation/manager/wishlist_view_model.dart';
import '../../../domain/entities/products_response_entity.dart';

class ProductTabItem extends StatelessWidget {
  final Product product;
   ProductTabItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final wishlistViewModel = WishlistViewModel.get(context);
    return BlocListener<CartViewModel , CartStates>(
      bloc: CartViewModel.get(context),
      listener: (context , state){
        if(state is CartLoadingState){
           const Center(child: CustomLoadingIndicator(),);
        }else if(state is CartFailureState){
           print(state.failure.errMessage);
           ToastUtils.showErrorToast(state.failure.errMessage);
        }else if(state is CartSuccesState){
          ToastUtils.showSuccessToast(state.cartResponseEntity.message ?? "Success");
        }
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: ColorManager.primary30Opacity, width: 2)),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.r),
                  child: CachedNetworkImage(
                    width: 191.w,
                    height: 120.h,
                    fit: BoxFit.cover,
                    imageUrl:
                   product.imageCover ?? "",
                    placeholder: (context, url) => const Center(
                      child: CustomLoadingIndicator(
                      ),
                    ),
                    errorWidget: (context, url, error) => const Icon(
                      Icons.error,
                      color: ColorManager.redColor,
                    ),
                  ),
                ),
                Positioned(
                    top: 8.h,
                    right: 8.w,
                    child: CircleAvatar(
                      backgroundColor: ColorManager.whiteColor,
                      radius: 20.r,
                      child: Center(
                        child: IconButton(
                            onPressed: () {
                              wishlistViewModel.addItemToWishlist(product.id!);
                            },
                            color: ColorManager.primaryColor,
                            padding: EdgeInsets.zero,
                            iconSize: 30.r, // Adjust icon size as needed
                            icon: const Icon(
                              Icons.favorite_border_rounded,
                              color: ColorManager.primaryColor,
                            )),
                      ),
                    ))
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    product.title ?? "",
                    maxLines: 1,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: ColorManager.primaryColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp,
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  AutoSizeText(
                   product.description ?? "",
                    maxLines: 1,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: ColorManager.primaryColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp,
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Row(children: [
                    AutoSizeText(
                      product.price.toString() ?? "",
                      maxLines: 1,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: ColorManager.primaryColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp,
                      ),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    AutoSizeText(
                      "EGP 2000",
                      maxLines: 1,
                      style: Styles.regular11SalePrice.copyWith(
                          color: ColorManager.discountTextColor,
                          decoration: TextDecoration.lineThrough),
                    ),
                  ]),
                  SizedBox(
                    height: 1.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: AutoSizeText(
                          "Review ${product.ratingsAverage}",
                          maxLines: 1,
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: ColorManager.primaryColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.star,
                        color: ColorManager.yellowColor,
                        size: 25.sp,
                      ),

                      InkWell(
                        onTap:()=> CartViewModel.get(context).addToCart(product.id!),
                        splashColor: Colors.transparent,
                        child: Icon(
                          Icons.add_circle,
                          size: 32.sp,
                          color: ColorManager.primaryColor,
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
