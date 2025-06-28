import 'package:eccomerce_app/core/theming/styles_manager.dart';
import 'package:eccomerce_app/core/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theming/color_manager.dart';
import '../../../../../core/widgets/build_custom_border.dart';
import '../../../../../core/widgets/custom_badge.dart';
import '../../../../products/presentation/views/widgets/products_search_results.dart';


PreferredSizeWidget buildAppBar(BuildContext context, int index) {
  final TextEditingController searchController = TextEditingController();

  return PreferredSize(
    preferredSize: Size.fromHeight(index != 3 ? 120.h : kToolbarHeight),
    child: StatefulBuilder(
      builder: (context, setState) {
        searchController.addListener(() {
          setState(() {}); // Rebuild لما تتغير قيمة الـ text
        });

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
                if (index != 3)
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: searchController,
                            style: Styles.regular14Text,
                            cursorColor: ColorManager.primaryColor,
                            onSubmitted: (value) {
                              final trimmedValue = value.trim();
                              if (trimmedValue.isNotEmpty) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => SearchResultsView(keyword: trimmedValue),
                                  ),
                                );
                              }
                            },
                            decoration: InputDecoration(
                              border: buildCustomBorder(),
                              enabledBorder: buildCustomBorder(),
                              focusedBorder: buildCustomBorder(),
                              contentPadding: EdgeInsets.all(16.h),
                              hintStyle: Styles.light14SearchHint,
                              hintText: "what do you wishlist for?",
                              suffixIcon: searchController.text.isNotEmpty
                                  ? IconButton(
                                icon: const Icon(Icons.clear, color: Colors.black),
                                onPressed: () {
                                  searchController.clear();
                                  // optional: reset view if needed
                                },
                              )
                                  : null,
                              prefixIcon: Icon(
                                Icons.search,
                                size: 30.sp,
                                color: ColorManager.primaryColor.withOpacity(0.75),
                              ),
                            ),
                          ),
                        ),
                        const CustomAppBarBadge(count: 5),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    ),
  );
}
