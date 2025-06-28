import 'package:eccomerce_app/core/theming/color_manager.dart';
import 'package:eccomerce_app/features/products/presentation/views/widgets/product_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/di/di.dart';
import '../../manager/products_states.dart';
import '../../manager/products_view_model.dart';

class SearchResultsView extends StatelessWidget {
  final String keyword;

  const SearchResultsView({super.key, required this.keyword});

  @override
  Widget build(BuildContext context) {
    final productsViewModel = getIt<ProductsViewModel>();

    return BlocProvider.value(
      value: productsViewModel..searchProducts(keyword),
      child: Scaffold(
        appBar: AppBar(title: const Text('Search Results',style: TextStyle(
            color: ColorManager.primaryDark,
            fontSize: 25
        ),)),
        body: BlocBuilder<ProductsViewModel, ProductsStates>(
          builder: (context, state) {
            if (state is ProductsSearchLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProductsSearchFailure) {
              return Center(child: Text('Error: ${state.failure.errMessage}'));
            }else if (state is ProductsSearchSuccess) {
              final viewModel = context.read<ProductsViewModel>();
              final results = state.productResponse.data;


              if (results == null || results.isEmpty) {
                return const Center(child: Text("There are no results." , style: TextStyle(
                  color: ColorManager.primaryDark,
                  fontSize: 20
                ),));
              }

              return ProductGrid(
                itemCount: viewModel.productsSearchList.length,
                productItem: viewModel.productsSearchList,
              );
            }


            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
