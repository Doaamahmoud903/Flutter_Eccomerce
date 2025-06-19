import 'package:eccomerce_app/features/products/domain/repository/products_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class AllProductsUseCase{
  final ProductsRepository productsRepository;
  AllProductsUseCase(this.productsRepository);
  invoke(){
    return productsRepository.getAllProducts();
  }
}