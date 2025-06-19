import 'package:eccomerce_app/core/theming/styles_manager.dart';
import 'package:eccomerce_app/core/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theming/color_manager.dart';
import '../../../../../core/widgets/build_custom_border.dart';
import '../../../../../core/widgets/custom_badge.dart';

PreferredSizeWidget buildAppBar(int index) {
  return AppBar(
    surfaceTintColor: Colors.transparent,
    elevation: 0,
    toolbarHeight: index != 3 ? 120.h : kToolbarHeight,
    leadingWidth: double.infinity,
    leading: Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 10.h),
            child: Image.asset(
              AssetManager.logo,
              width: 66.w,
              height: 22.h,
            ),
          ),
          Visibility(
            visible: index != 3,
            child: Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                        style: Styles.regular14Text,
                        cursorColor: ColorManager.primaryColor,
                        onTap: () {
                          //todo: implement search logic
                        },
                        decoration: InputDecoration(
                            border: buildCustomBorder(),
                            enabledBorder: buildCustomBorder(),
                            focusedBorder: buildCustomBorder(),
                            contentPadding: EdgeInsets.all(16.h),
                            hintStyle: Styles.light14SearchHint,
                            hintText: "what do you wishlist for?",
                            prefixIcon: Icon(
                              Icons.search,
                              size: 30.sp,
                              color: ColorManager.primaryColor.withOpacity(0.75),
                            ))),
                  ),
                  const CustomAppBarBadge(count: 5)
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}