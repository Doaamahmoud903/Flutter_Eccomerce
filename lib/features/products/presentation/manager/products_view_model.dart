import 'package:eccomerce_app/features/products/domain/entities/products_response_entity.dart';
import 'package:eccomerce_app/features/products/domain/usecases/all_products_use_case.dart';
import 'package:eccomerce_app/features/products/domain/usecases/specific_product_use_case.dart';
import 'package:eccomerce_app/features/products/presentation/manager/products_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';


@injectable
class ProductsViewModel extends Cubit<ProductsStates>{
  final AllProductsUseCase allProductsUseCase;
  final SpecificProductUseCase specificProductUseCase;
  ProductsViewModel(this.allProductsUseCase, this.specificProductUseCase)
      :super(ProductsLoading());


  List<Product> productsList = [];
  Future<void>getAllProducts({int page = 1}) async{
    emit(ProductsLoading());
    final response = await allProductsUseCase.invoke(page: page);
    print(response);
    response.fold(
        (failure) => emit(ProductsFailure(failure)),
        (response) => {
          productsList = response.data ?? [],
          emit(ProductsSuccess(response))
        }
    );

  }
}
