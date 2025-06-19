import 'package:eccomerce_app/features/brands/domain/repository/brands_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class BrandsUseCase{
  final BrandsRepository brandsRepository;

  BrandsUseCase(this.brandsRepository);
  invoke({int page = 1}){
    return brandsRepository.getAllBrands(page : page);
  }

}