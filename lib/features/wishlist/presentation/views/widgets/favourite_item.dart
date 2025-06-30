import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:eccomerce_app/core/theming/color_manager.dart';
import 'package:eccomerce_app/core/theming/styles_manager.dart';
import 'package:eccomerce_app/core/utils/assets_manager.dart';
import 'package:eccomerce_app/features/cart/presentation/manager/cart_view_model.dart';
import 'package:eccomerce_app/features/wishlist/domain/entities/wishlist_response_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:colornames/colornames.dart';
import '../../../../../core/routes/app_routes.dart';
import '../../manager/wishlist_view_model.dart';
import 'custom_elevated_button.dart';

class FavoriteItem extends StatefulWidget {
  final WishlistDataEntity product;
  //final Map<String, dynamic> product;
  String heartIcon = AssetManager.selectedFavouriteIcon;
  bool isClicked = false;

  FavoriteItem({super.key, required this.product});

  @override
  State<FavoriteItem> createState() => _FavoriteItemState();
}

class _FavoriteItemState extends State<FavoriteItem> {
  @override
  Widget build(BuildContext context) {
    WishlistViewModel wishlistViewModel = WishlistViewModel.get(context);
    CartViewModel cartViewModel = CartViewModel.get(context);
    return Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, AppRoutes.productDetailsRoute);
        },
        child: Container(
          height: 135.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(
              color: ColorManager.primaryColor.withOpacity(.3),
            ),
          ),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(
                    color: ColorManager.primaryColor.withOpacity(.6),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.r),
                  child: CachedNetworkImage(
                    width: 120.w,
                    height: 135.h,
                    fit: BoxFit.cover,
                    imageUrl: widget.product.imageCover ?? "",
                    placeholder:
                        (context, url) => const Center(
                          child: CircularProgressIndicator(
                            color: ColorManager.primaryColor,
                          ),
                        ),
                    errorWidget:
                        (context, url, error) => const Icon(
                          Icons.error,
                          color: ColorManager.primaryColor,
                        ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: 8.w, bottom: 8.h, left: 8.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AutoSizeText(
                            widget.product.title ?? "",
                            style: Styles.medium18Header,
                          ),
                          InkWell(
                            // radius: 25,
                            customBorder: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            onTap: () {
                              // setState(() {
                              //   widget.isClicked = !widget.isClicked;
                              //   widget.heartIcon =
                              //       !widget.isClicked
                              //           ? AssetManager.selectedFavouriteIcon
                              //           : AssetManager
                              //               .selectedAddToFavouriteIcon;
                              // });
                              wishlistViewModel.removeItemFromWishlist(widget.product.id!);
                            },
                            child: Material(
                              // borderRadius: BorderRadius.circular(2),
                              color: ColorManager.whiteColor,
                              elevation: 5,
                              shape: const StadiumBorder(),
                              shadowColor: ColorManager.blackColor,
                              child: Padding(
                                padding: const EdgeInsets.all(6),
                                child: ImageIcon(
                                  AssetImage(widget.heartIcon),
                                  color: ColorManager.primaryColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 10.w),
                            width: 14.w,
                            height: 14.h,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 148, 175),
                              shape: BoxShape.circle,
                            ),
                          ),
                          AutoSizeText(
                            (Color.fromARGB(255, 255, 148, 175) as Color)
                                .colorName,
                            style: Styles.regular14Text,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          AutoSizeText(
                            "EGP ${widget.product.price}",
                            style: Styles.medium18Header,
                          ),
                          SizedBox(width: 8.w),
                          AutoSizeText(
                            "EGP${widget.product.price!.toDouble() * .1}",
                            style: Styles.regular11SalePrice.copyWith(
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                          const Spacer(),
                          SizedBox(
                            width: 100.w,
                            height: 36.h,
                            child: CustomElevatedButton(
                              text: "Add To Cart",
                              onPressed: () {
                                cartViewModel.addToCart(widget.product.id!);
                              },
                              backgroundColor: ColorManager.primaryColor,
                              textStyle: Styles.medium14Category.copyWith(
                                color: ColorManager.whiteColor,
                              ),
                            ),
                          ),
                        ],
                      ),
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
}
