import '../../../../core/errors/failures.dart';
import '../../../categories/domain/entities/category_brand_response_entity.dart';

abstract class CategoriesStates{}
class CategoriesIntial extends CategoriesStates{}
class CategoriesLoading extends CategoriesStates{}

class CategoriesSuccess extends CategoriesStates{
  final CetegoryBrandResponseEntity cetegoryBrandResponseEntity;
  CategoriesSuccess(this.cetegoryBrandResponseEntity);
}

class CategoriesFailure extends CategoriesStates{
  final Failure failure;
  CategoriesFailure(this.failure);
}

class SpecificCategoryLoading extends CategoriesStates{}

class SpecificCategorySuccess extends CategoriesStates{
  final Data specificBrandData;
  SpecificCategorySuccess(this.specificBrandData);
}

class SpecificCategoryFailure extends CategoriesStates{
  final Failure failure;
  SpecificCategoryFailure(this.failure);
}

class AllSubCategoriesLoading extends CategoriesStates{}

class AllSubCategoriesSuccess extends CategoriesStates{
  final CetegoryBrandResponseEntity subCategories;
  AllSubCategoriesSuccess(this.subCategories);
}

class AllSubCategoriesFailure extends CategoriesStates{
  final Failure failure;
  AllSubCategoriesFailure(this.failure);
}
class CategoriesViewProducts extends CategoriesStates {
  final bool isViewingProducts;

  CategoriesViewProducts({required this.isViewingProducts});
}