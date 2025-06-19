import 'package:eccomerce_app/features/products/domain/repository/products_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class SpecificProductUseCase{
  final ProductsRepository productsRepository;
  SpecificProductUseCase(this.productsRepository);
  invoke(productId){
    return productsRepository.getSpecificProducts(productId);
  }
}