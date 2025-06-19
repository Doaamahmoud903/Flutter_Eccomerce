import 'package:auto_size_text/auto_size_text.dart';
import 'package:eccomerce_app/core/di/di.dart';
import 'package:eccomerce_app/features/categories/presentation/manager/categories_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theming/color_manager.dart';
import '../../../../../core/widgets/capitalize_text.dart';
import '../../../../../core/widgets/custom_loding_indicator.dart';
import '../../manager/categories_states.dart';

class CategorySidebar extends StatefulWidget {
  CategorySidebar({super.key});

  @override
  State<CategorySidebar> createState() => _CategorySidebarState();
}

class _CategorySidebarState extends State<CategorySidebar> {


  @override
  Widget build(BuildContext context) {
    final  categoriesViewModel =  BlocProvider.of<CategoriesViewModel>(context);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return BlocBuilder<CategoriesViewModel, CategoriesStates>(
      bloc: categoriesViewModel,
      buildWhen: (previous, current) =>
      current is CategoriesSuccess || current is CategoriesFailure,
      builder: (context, state) {
        if (state is CategoriesLoading) {
          return const Center(child: CustomLoadingIndicator());
        } else if (state is CategoriesFailure) {
          return Center(child: Text(state.failure.errMessage));
        } else if (state is CategoriesSuccess) {
          final categories = categoriesViewModel.categoriesList ?? [];
          if (categoriesViewModel.selectedCategoryId == null && categories.isNotEmpty) {
            categoriesViewModel.selectedCategoryId = categories.first.id ?? '';
            categoriesViewModel.getAllSubCategories(categories.first.id ?? '');
          }

          return SizedBox(
            height: height,
            child: ListView.builder(

              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return GestureDetector(
                  onTap: () {
                    print(category.id);
                    categoriesViewModel.getAllSubCategories(category.id ?? '');
                    setState(() {

                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 16.h,
                      horizontal: 2.w,
                    ),
                    decoration:  BoxDecoration(
                      color: category.id == categoriesViewModel.selectedCategoryId
                          ? Colors.transparent
                          : ColorManager.discountTextColor,

                    ),
                    child: Row(
                      children: [
                        Container(width: 5.w,
                          height: 40,
                          decoration:  BoxDecoration(
                            color: category.id == categoriesViewModel.selectedCategoryId
                                ? ColorManager.discountTextColor
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(5)

                          ),),
                        SizedBox(width: 5.w,),
                        Expanded(
                         child:  AutoSizeText(
                           CapitalizeText.capitalizeText(category.name?.trim().isNotEmpty == true ? category.name! : 'No Name'),
                           softWrap: true,
                            wrapWords: true,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: const TextStyle(
                              color: ColorManager.primaryDark,
                              fontSize: 14,
                            ),
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

        return Container();
      },
    );
  }
}
