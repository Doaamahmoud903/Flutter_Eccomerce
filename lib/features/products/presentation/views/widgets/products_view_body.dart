import 'package:eccomerce_app/core/di/di.dart';
import 'package:eccomerce_app/features/products/presentation/manager/products_states.dart';
import 'package:eccomerce_app/features/products/presentation/manager/products_view_model.dart';
import 'package:eccomerce_app/features/products/presentation/views/widgets/product_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

        return ProductGrid(itemCount: productsViewModel.productsList.length, productItem: productsViewModel.productsList);
      },

    );

  }
}