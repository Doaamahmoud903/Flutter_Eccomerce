import 'package:eccomerce_app/features/brands/domain/usecases/brands_use_case.dart';
import 'package:eccomerce_app/features/brands/presentation/manager/brands_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../categories/domain/entities/category_brand_response_entity.dart';
import '../../domain/usecases/specific_brand_use_case.dart';

@injectable
class BrandsViewModel extends Cubit<BrandsStates>{
  final BrandsUseCase brandsUseCase;
  final SpecificBrandUseCase specificBrandUseCase;
  BrandsViewModel(this.brandsUseCase, this.specificBrandUseCase):super(BrandsLoading());

  List<Data> brandsList = [];
  Future<void> getAllBrands({int page = 1}) async{
    emit(BrandsLoading());
    final response = await brandsUseCase.invoke(page: page);
    response.fold(
          (errorMessage) => emit(BrandsFailure(errorMessage)),
          (response) => {
            brandsList = response.data ?? [],
            emit(BrandsSuccess(response)),
          }
    );
  }

  Future<void> getSpecificBrands(brandId) async{
    emit(SpecificBrandLoading());
    final response = await specificBrandUseCase.invoke(brandId);
    response.fold(
            (errorMessage) => emit(SpecificBrandFailure(errorMessage)),
            (response) => emit(SpecificBrandSuccess(response)),

    );
  }

}
