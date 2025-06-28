
import 'package:eccomerce_app/core/di/di.dart';
import 'package:eccomerce_app/core/routes/app_routes.dart';
import 'package:eccomerce_app/core/theming/color_manager.dart';
import 'package:eccomerce_app/core/utils/toast_utils.dart';
import 'package:eccomerce_app/core/widgets/custom_loding_indicator.dart';
import 'package:eccomerce_app/features/brands/presentation/manager/brands_states.dart';
import 'package:eccomerce_app/features/brands/presentation/manager/brands_view_model.dart';
import 'package:eccomerce_app/features/categories/domain/entities/category_brand_response_entity.dart';
import 'package:eccomerce_app/features/categories/presentation/manager/categories_states.dart';
import 'package:eccomerce_app/features/categories/presentation/manager/categories_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theming/styles_manager.dart';
import '../../../../../core/utils/assets_manager.dart';
import '../../../../categories/presentation/views/widgets/category_brand_item.dart';
import '../../../../layout/presentation/manager/layout_cubit.dart';

class HomeViewBody extends StatelessWidget {
  CategoriesViewModel categoriesViewModel = getIt<CategoriesViewModel>();
  BrandsViewModel brandsViewModel = getIt<BrandsViewModel>();
  HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = LayoutCubit.get(context);
    return SingleChildScrollView(
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 16.h,
            ),
            _buildAnnouncement(
              items: [
                {
                  'image': AssetManager.announcement1,
                  'right': 0.0,
                  'left': 40.0,
                },
                {
                  'image': AssetManager.announcement2,
                  'right': 40.0,
                  'left': 0.0,
                },
                {
                  'image': AssetManager.announcement3,
                  'right': 0.0,
                  'left': 40.0,
                },
              ],
            ),

            SizedBox(
              height: 24.h,
            ),
            _lineBreak(name: "Categories" , onPressed: cubit.goToCategoriesView),
            // _buildCategoryBrandSec(const CategoryBrandItem()),
            BlocBuilder<CategoriesViewModel , CategoriesStates>(
                bloc: categoriesViewModel..getAllCategories(),
                buildWhen: (previous, current) {
                  return current is CategoriesSuccess || current is CategoriesFailure;
                },
                builder: (context , state){
                  if(state is CategoriesLoading){
                    return const Center(child: CustomLoadingIndicator());
                  }else if(state is CategoriesFailure){
                    print(state.failure.errMessage);
                    ToastUtils.showErrorToast(state.failure.errMessage);
                  }else if(state is CategoriesSuccess){
                    final categories = categoriesViewModel.categoriesList;
                    print(categories);
                    return  _buildCategoryBrandSec(categories);
                  }
                  return Container();
                }

            ),
            _lineBreak(name: "Brands" , onPressed: (){
              Navigator.pushNamed(context, AppRoutes.brandsRoute);
            }),
            BlocBuilder<BrandsViewModel , BrandsStates>(
                bloc: brandsViewModel..getAllBrands(),
                buildWhen: (previous, current) {
                  return current is BrandsSuccess || current is BrandsFailure;
                },
                builder: (context , state){
                  if(state is BrandsLoading){
                    return const Center(child: CustomLoadingIndicator());
                  }else if(state is BrandsFailure){
                    print(state.failure.errMessage);
                    ToastUtils.showErrorToast(state.failure.errMessage);
                  }else if(state is BrandsSuccess){
                    final brands = brandsViewModel.brandsList;
                    print(brands.length);
                    return  _buildCategoryBrandSec(brands);

                  }
                  return Container();
                }

            ),

          ],
        ),
      ),
    );
  }

  SizedBox _buildCategoryBrandSec(List<Data> categoryBrandList) {
    return SizedBox(
      height: 250.h,
      width: double.infinity,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 16.h, crossAxisSpacing: 16.w),
        itemCount: categoryBrandList.length,
        scrollDirection: Axis.horizontal,
        physics: const ScrollPhysics(),
        itemBuilder: (context, index) {
          return CategoryBrandItem(items: categoryBrandList[index]);
        },
      ),
    );
  }

  ImageSlideshow _buildAnnouncement({
    required List<Map<String, dynamic>> items,
  }) {
    return ImageSlideshow(
      indicatorColor: ColorManager.primaryColor,
      initialPage: 0,
      indicatorBottomPadding: 15.h,
      indicatorPadding: 8.w,
      indicatorRadius: 5,
      indicatorBackgroundColor: ColorManager.whiteColor,
      isLoop: true,
      autoPlayInterval: 3000,
      height: 190.h,
      children: items.map((item) {
        final String url = item['image'];
        final double right = item['right'];
        final double left = item['left'];
        return Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                url,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            Positioned(
              right: right == 0 ? null : right,
              left: left == 0 ? null : left,
              top: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "UP TO 25% OFF",
                    style: TextStyle(color: left == 0 ?ColorManager.whiteColor :ColorManager.primaryColor, fontSize: 18),
                  ),
                  Text(
                    "For all Headphones ",
                    style: TextStyle(color: left == 0 ?ColorManager.whiteColor :ColorManager.primaryColor, fontSize: 14),
                  ),
                  Text(
                    " AirPods &",
                    style: TextStyle(color: left == 0 ?ColorManager.whiteColor :ColorManager.primaryColor, fontSize: 14),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorManager.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      "Shop Now",
                      style: TextStyle(color: ColorManager.whiteColor),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }).toList(),
    );
  }


  Widget _lineBreak({required String name , required void Function()? onPressed}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(name, style: Styles.medium18Header),
        TextButton(
          onPressed: onPressed,
          child: Text("View All", style: Styles.regular12Text),
        )
      ],
    );
  }
}