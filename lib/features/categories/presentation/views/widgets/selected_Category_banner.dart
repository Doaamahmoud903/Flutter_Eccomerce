import 'package:eccomerce_app/core/theming/color_manager.dart';
import 'package:eccomerce_app/core/theming/styles_manager.dart';
import 'package:eccomerce_app/core/utils/assets_manager.dart';
import 'package:eccomerce_app/core/widgets/custom_button.dart';
import 'package:eccomerce_app/core/widgets/custom_cached_image_network.dart';
import 'package:eccomerce_app/features/wishlist/presentation/views/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/routes/app_routes.dart';
import '../../manager/categories_view_model.dart';

class SelectedCategoryBanner extends StatelessWidget {
  final String image;
  final String title;
  const SelectedCategoryBanner({super.key, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: 8.w
          ),
          width: 250.w,
          height: 120.h,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10)
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CustomCachedNetworkImage(url: image),

          ),

        ),
        Padding(
          padding:  EdgeInsets.only(
              left: 20.w,
              top: 12.h
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title , style: const TextStyle(
                  fontSize: 22,
                  color: ColorManager.whiteColor
              )),
              SizedBox(height: 8.h,),
              SizedBox(
                width: 120.w,
                height: 40.h,
                child: CustomElevatedButton(
                  text: "Shop Now",
                  onPressed: (){
                    BlocProvider.of<CategoriesViewModel>(context).showProducts();
                  },
                  backgroundColor: ColorManager.primaryDark,
                  textStyle: Styles.semi16TextWhite,


                ),
              )

            ],
          ),
        )
      ],
    );
  }
}