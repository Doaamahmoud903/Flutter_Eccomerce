import 'package:eccomerce_app/features/categories/domain/repository/categories_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class SpecificCategoryUseCase{
  final CategoriesRepository categoriesRepository;

  SpecificCategoryUseCase(this.categoriesRepository);
  invoke(String categoryId){
    return categoriesRepository.getSpecificCategory(categoryId);
  }
}