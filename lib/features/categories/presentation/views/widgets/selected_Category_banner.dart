import 'package:eccomerce_app/core/theming/color_manager.dart';
import 'package:eccomerce_app/core/theming/styles_manager.dart';
import 'package:eccomerce_app/core/utils/assets_manager.dart';
import 'package:eccomerce_app/core/widgets/custom_button.dart';
import 'package:eccomerce_app/features/wishlist/presentation/views/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          height: 100.h,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10)
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(image,
              fit: BoxFit.cover,
            ),
          ),

        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title , style: Styles.semi20Primary,),
              SizedBox(
                width: 120.w,
                height: 40.h,
                child: CustomElevatedButton(
                    text: "Shop Now",
                    onPressed: (){},
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
