import 'package:eccomerce_app/core/di/di.dart';
import 'package:eccomerce_app/features/categories/presentation/manager/categories_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../products/presentation/views/products_view.dart';
import '../../manager/categories_states.dart';
import 'category_content.dart';
import 'category_sidebar.dart';

class CategoriesViewBody extends StatefulWidget {
  const CategoriesViewBody({super.key});

  @override
  State<CategoriesViewBody> createState() => _CategoriesViewBodyState();
}

class _CategoriesViewBodyState extends State<CategoriesViewBody> {
  final CategoriesViewModel viewModel = getIt<CategoriesViewModel>();

  @override
  void initState() {
    super.initState();
    viewModel.getAllCategories();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: viewModel,
      child: BlocBuilder<CategoriesViewModel, CategoriesStates>(
        builder: (context, state) {
          final isViewingProducts =
              state is CategoriesViewProducts && state.isViewingProducts;

          if (isViewingProducts) {
            return const ProductsView();
          } else {
            return Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 16.w, top: 5.h),
                  width: 137.w,
                  height: 720.h,
                  child:  CategorySidebar(),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 16.w, top: 5.h),
                    child: const CategoryContent(),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
