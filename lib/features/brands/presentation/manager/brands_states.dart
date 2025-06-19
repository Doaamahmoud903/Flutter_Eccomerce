import 'package:eccomerce_app/core/errors/failures.dart';

import '../../../categories/domain/entities/category_brand_response_entity.dart';

abstract class BrandsStates{}
class BrandsIntial extends BrandsStates{}
class BrandsLoading extends BrandsStates{}

class BrandsSuccess extends BrandsStates{
  final CetegoryBrandResponseEntity cetegoryBrandResponseEntity;
  BrandsSuccess(this.cetegoryBrandResponseEntity);
}

class BrandsFailure extends BrandsStates{
  final Failure failure;
  BrandsFailure(this.failure);
}

class SpecificBrandLoading extends BrandsStates{

}
class SpecificBrandSuccess extends BrandsStates{
  final Data specificBrandData;
  SpecificBrandSuccess(this.specificBrandData);
}

class SpecificBrandFailure extends BrandsStates{
  final Failure failure;
  SpecificBrandFailure(this.failure);
}
