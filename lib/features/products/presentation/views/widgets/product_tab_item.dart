import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:eccomerce_app/core/theming/styles_manager.dart';
import 'package:eccomerce_app/core/utils/assets_manager.dart';
import 'package:eccomerce_app/core/theming/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductTabItem extends StatelessWidget {
  const ProductTabItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  "https://www.nike.sa/dw/image/v2/BDVB_PRD/on/demandware.static/-/Sites-akeneo-master-catalog/default/dw42ccc9ea/nk/a9b/7/6/4/b/1/a9b764b1_834c_413e_aec2_f460112b2de6.jpg?sw=2000&sh=2000&sm=fit",
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(
                      color: ColorManager.primaryDark,
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
                            // todo add to favorite
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
                  "Nike Air Jordan",
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
                  "NIKE SHOES FLEXIBLE FOR MEN",
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
                    "EGP 1500",
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
                    AutoSizeText(
                      "Review (4.8)",
                      maxLines: 1,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: ColorManager.primaryColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp,
                      ),
                    ),
                    Icon(
                      Icons.star,
                      color: ColorManager.yellowColor,
                      size: 25.sp,
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    InkWell(
                      onTap: () {
                        //   todo add to cart
                      },
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
    );
  }
}
