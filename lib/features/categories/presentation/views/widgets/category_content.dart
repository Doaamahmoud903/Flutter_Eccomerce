import 'package:eccomerce_app/features/categories/presentation/views/widgets/selected_Category_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theming/color_manager.dart';
import '../../../../../core/widgets/custom_cached_image_network.dart';
import '../../../../../core/widgets/custom_loding_indicator.dart';
import '../../manager/categories_states.dart';
import '../../manager/categories_view_model.dart';

class CategoryContent extends StatefulWidget {
  const CategoryContent({super.key});

  @override
  State<CategoryContent> createState() => _CategoryContentState();
}

class _CategoryContentState extends State<CategoryContent> {
  @override
  Widget build(BuildContext context) {
    final categoriesViewModel = BlocProvider.of<CategoriesViewModel>(context);

    return BlocBuilder<CategoriesViewModel, CategoriesStates>(
      bloc: categoriesViewModel,
      buildWhen: (previous, current) =>
      current is AllSubCategoriesSuccess ||
          current is AllSubCategoriesFailure ||
          current is AllSubCategoriesLoading,
      builder: (context, state) {
        print("⛔ subCategories: ${categoriesViewModel.selectedCategorySubcategories.length}");
        if (state is AllSubCategoriesLoading) {
          return const Center(child: CustomLoadingIndicator());
        }

        if (state is AllSubCategoriesFailure) {
          return Center(child: Text(state.failure.errMessage));
        }

        final subCategories = categoriesViewModel.selectedCategorySubcategories;
        print(subCategories.length);
        final selectedCategory = categoriesViewModel.selectedCategory;
        if (subCategories.isEmpty) {
          return Column(
            children: [
              SelectedCategoryBanner(
                image: selectedCategory?.image ?? "",
                title: selectedCategory?.name ?? "",
              ),
              const SizedBox(height: 16),
              const Expanded(
                child: Center(
                  child: Text(
                    'No Subcategories Available.',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500 ,color: ColorManager.primaryDark),
                  ),
                ),
              ),
            ],
          );

        }




        return Column(
          children: [
            SelectedCategoryBanner(
              image: selectedCategory?.image ?? "",
              title: selectedCategory?.name ?? "",
            ),
            SizedBox(height: 8.h),
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 8.h,
                  crossAxisSpacing: 8.w,
                  childAspectRatio: 0.75,
                ),
                itemCount: subCategories.length,
                itemBuilder: (context, index) {
                  final subCategory = subCategories[index];
                  return InkWell(
                    onTap: (){

                    },
                    child: Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: double.infinity,
                            height: 70.h,
                            child: CustomCachedNetworkImage(
                              url: subCategory.image ?? "",
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(4.0.w),
                            child: Text(
                              subCategory.name ?? "",
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
