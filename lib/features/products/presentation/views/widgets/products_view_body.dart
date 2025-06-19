import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:eccomerce_app/core/theming/styles_manager.dart';
import 'package:eccomerce_app/core/utils/assets_manager.dart';
import 'package:eccomerce_app/core/theming/color_manager.dart';
import 'package:eccomerce_app/features/products/presentation/views/widgets/product_slider.dart';
import 'package:eccomerce_app/features/products/presentation/views/widgets/product_tab_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';
import '../../../../../core/routes/app_routes.dart';

class ProductsViewBody extends StatelessWidget {
  ProductsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 2 / 3.2.h,
                      crossAxisSpacing: 16.w,
                      mainAxisSpacing: 16.h),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        //todo: navigate to product details screen
                        Navigator.pushNamed(context, AppRoutes.productRoute);
                      },
                      child: const ProductTabItem(),
                    );
                  },
                ))
          ],
        ));
  }
}
