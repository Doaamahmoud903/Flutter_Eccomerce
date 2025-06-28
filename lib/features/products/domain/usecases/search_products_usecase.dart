import 'package:eccomerce_app/features/products/domain/repository/products_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class SearchProductsUseCase{
  final ProductsRepository productsRepository;
  SearchProductsUseCase(this.productsRepository);
  invoke(String keyword){
    return productsRepository.searchProducts(keyword);
  }
}