import 'package:eccomerce_app/features/categories/domain/repository/categories_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class AllSubCategoriesUseCase{
  final CategoriesRepository categoriesRepository;

  AllSubCategoriesUseCase(this.categoriesRepository);
  invoke(String categoryId){
    return categoriesRepository.getAllSubCategory(categoryId);
  }
}