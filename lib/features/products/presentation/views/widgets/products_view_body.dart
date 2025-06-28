import 'package:eccomerce_app/core/di/di.dart';
import 'package:eccomerce_app/features/products/presentation/manager/products_states.dart';
import 'package:eccomerce_app/features/products/presentation/manager/products_view_model.dart';
import 'package:eccomerce_app/features/products/presentation/views/widgets/product_tab_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../product_details/presentation/views/product_details_view.dart';

class ProductsViewBody extends StatelessWidget {
  ProductsViewModel productsViewModel = getIt<ProductsViewModel>();
  ProductsViewBody({super.key});

  @override
  Widget build(BuildContext context) {

    return  BlocBuilder<ProductsViewModel, ProductsStates>(
      bloc: productsViewModel..getAllProducts(),
      builder: (context, state) {
        if (state is ProductsLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is ProductsFailure) {
          return Center(child: Text(state.failure.errMessage));
        }

        return SafeArea(
          child: Column(
            children: [
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2 / 3.2.h,
                    crossAxisSpacing: 16.w,
                    mainAxisSpacing: 16.h,
                  ),
                  itemCount: productsViewModel.productsList.length,
                  itemBuilder: (context, index) {
                    final product = productsViewModel.productsList[index];
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ProductDetailsView(product: product),
                          ),
                        );

                      },
                      child: ProductTabItem(product: product),
                    );
                  },
                ),
              )
            ],
          ),
        );
      },

    );

  }
}