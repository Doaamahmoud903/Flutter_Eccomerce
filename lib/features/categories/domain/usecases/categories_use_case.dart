import 'package:eccomerce_app/features/categories/domain/repository/categories_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class CategoriesUseCase{
  final CategoriesRepository categoriesRepository;

  CategoriesUseCase(this.categoriesRepository);
  invoke(){
    return categoriesRepository.getAllCategories();
  }
}