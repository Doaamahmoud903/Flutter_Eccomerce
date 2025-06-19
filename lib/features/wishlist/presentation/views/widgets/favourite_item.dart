import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:eccomerce_app/core/theming/color_manager.dart';
import 'package:eccomerce_app/core/theming/styles_manager.dart';
import 'package:eccomerce_app/core/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:colornames/colornames.dart';
import '../../../../../core/routes/app_routes.dart';
import 'custom_elevated_button.dart';

class FavoriteItem extends StatefulWidget {
  final Map<String, dynamic> product;
  String heartIcon = AssetManager.selectedFavouriteIcon;
  bool isClicked = false;

  FavoriteItem({super.key, required this.product});

  @override
  State<FavoriteItem> createState() => _FavoriteItemState();
}

class _FavoriteItemState extends State<FavoriteItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, AppRoutes.productRoute);
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
                    imageUrl: widget.product["imageUrl"],
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(
                        color: ColorManager.primaryColor,
                      ),
                    ),
                    errorWidget: (context, url, error) => const Icon(
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
                            widget.product["title"],
                            style: Styles.medium18Header,
                          ),
                          InkWell(
                            // radius: 25,
                            customBorder: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            onTap: () {
                              setState(() {
                                widget.isClicked = !widget.isClicked;
                                widget.heartIcon = !widget.isClicked
                                    ? AssetManager.selectedFavouriteIcon
                                    : AssetManager.selectedAddToFavouriteIcon;
                              });
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
                                  )),
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
                              color: widget.product["color"],
                              shape: BoxShape.circle,
                            ),
                          ),
                          AutoSizeText(
                            (widget.product["color"] as Color).colorName,
                            style: Styles.regular14Text,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          AutoSizeText(
                            "EGP ${widget.product["finalPrice"]}",
                            style: Styles.medium18Header,
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          AutoSizeText(
                            "EGP${widget.product["salePrice"]}",
                            style: Styles.regular11SalePrice.copyWith(
                                decoration: TextDecoration.lineThrough),
                          ),
                          const Spacer(),
                          SizedBox(
                            width: 100.w,
                            height: 36.h,
                            child: CustomElevatedButton(
                                text: "Add To Cart",
                                onPressed: () {},
                                backgroundColor: ColorManager.primaryColor,
                                textStyle: Styles.medium14Category
                                    .copyWith(color: ColorManager.whiteColor)),
                          )
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
