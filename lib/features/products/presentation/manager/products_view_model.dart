import 'package:eccomerce_app/features/products/domain/entities/products_response_entity.dart';
import 'package:eccomerce_app/features/products/domain/usecases/all_products_use_case.dart';
import 'package:eccomerce_app/features/products/domain/usecases/search_products_usecase.dart';
import 'package:eccomerce_app/features/products/domain/usecases/specific_product_use_case.dart';
import 'package:eccomerce_app/features/products/presentation/manager/products_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductsViewModel extends Cubit<ProductsStates>{
  final AllProductsUseCase allProductsUseCase;
  final SpecificProductUseCase specificProductUseCase;
  final SearchProductsUseCase searchProductsUseCase;
  ProductsViewModel(this.allProductsUseCase, this.specificProductUseCase, this.searchProductsUseCase)
      :super(ProductsLoading());


  List<Product> productsList = [];
  List<Product> productsSearchList = [];

  Future<void> searchProducts(String keyword) async {

    if (keyword.trim().isEmpty) {
      getAllProducts(); // fallback to all products
      return;
    }
    emit(ProductsSearchLoading());
    emit(ProductsSearchKeyword(keyword));
    final response = await searchProductsUseCase.invoke(keyword);
    response.fold(
          (failure) => emit(ProductsSearchFailure(failure)),
          (response) {
            productsSearchList = response.data ?? [];
            emit(ProductsSearchSuccess(ProductsResponseEntity(data: []), ''));
      },
    );
  }

  Future<void> getAllProducts() async {

    emit(ProductsLoading());
    final response = await allProductsUseCase.invoke();
    response.fold(
          (failure) => emit(ProductsFailure(failure)),
          (response) {
        productsList = response.data ?? [];
        emit(ProductsSuccess(response));
      },
    );
  }

}
