import 'package:eccomerce_app/features/brands/domain/repository/brands_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class SpecificBrandUseCase{
  final BrandsRepository brandsRepository;

  SpecificBrandUseCase(this.brandsRepository);
  invoke(String brandId){
    return brandsRepository.getSpecificBrand(brandId);
  }

}