import 'package:auto_size_text/auto_size_text.dart';
import 'package:eccomerce_app/core/theming/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/custom_badge.dart';
import 'cart_item.dart';

class CartViewBody extends StatelessWidget {
  static const String routeName = "cart";
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _customAppBar(context),
        body: Column(
          children: [
            Expanded(
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return const CartItem();
                  },
                )),
            _buildCheckOut(context, 15000),
          ],
        ));
  }

  Widget _buildCheckOut(BuildContext context, double price) {
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
                    //todo: navigate to payment section
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

PreferredSizeWidget _customAppBar(BuildContext context) {
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
        onPressed: () {},
        icon: Icon(
          Icons.search_outlined,
          size: 35.sp,
          color: ColorManager.primaryColor,
        ),
      ),
      Padding(
        padding: EdgeInsets.only(right: 16.w),
        child: const CustomAppBarBadge(count: 5),
      ),
    ],
  );
}
