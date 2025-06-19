import 'package:eccomerce_app/features/products/domain/repository/products_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class AllProductsUseCase{
  final ProductsRepository productsRepository;
  AllProductsUseCase(this.productsRepository);
  invoke({int page = 1}){
    return productsRepository.getAllProducts(page : page);
  }
}