import 'package:eccomerce_app/features/categories/domain/entities/category_brand_response_entity.dart';
import 'package:eccomerce_app/features/categories/domain/usecases/all_sub_categories_use_case.dart';
import 'package:eccomerce_app/features/categories/domain/usecases/categories_use_case.dart';
import 'package:eccomerce_app/features/categories/domain/usecases/specific_category_use_case.dart';
import 'package:eccomerce_app/features/categories/presentation/manager/categories_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class CategoriesViewModel extends Cubit<CategoriesStates> {
  final CategoriesUseCase categoriesUseCase;
  final SpecificCategoryUseCase specificCategoryUseCase;
  final AllSubCategoriesUseCase allSubCategoriesUseCase;

  CategoriesViewModel(this.categoriesUseCase,
      this.specificCategoryUseCase, this.allSubCategoriesUseCase,)
      :super(CategoriesLoading());

  List<Data> categoriesList = [];
  List<Data> selectedCategorySubcategories = [];
  String? selectedCategoryId;

  Future<void> getAllCategories() async {
    emit(CategoriesLoading());

    final response = await categoriesUseCase.invoke();

    response.fold(
          (errorMessage) => emit(CategoriesFailure(errorMessage)),
          (response) async {
        categoriesList = response.data ?? [];

        if (categoriesList != null && categoriesList!.isNotEmpty) {
          selectedCategoryId = categoriesList!.first.id ?? '';
          await getAllSubCategories(selectedCategoryId!);
        }

        emit(CategoriesSuccess(response));
      },
    );
  }


  Future<void> getSpecificCategories(String categoryId) async {
    emit(SpecificCategoryLoading());
    final response = await specificCategoryUseCase.invoke(categoryId);
    response.fold(
          (errorMessage) =>
          emit(SpecificCategoryFailure(errorMessage.errMessage)),
          (response) =>
      {
        selectedCategorySubcategories = response.data ?? [],
        emit(SpecificCategorySuccess(response))
      },
    );
  }

  Future<void> getAllSubCategories(String categoryId) async {
    selectedCategoryId = categoryId;
    selectedCategorySubcategories = [];
    emit(AllSubCategoriesLoading());

    final response = await allSubCategoriesUseCase.invoke(categoryId);

    response.fold(
          (errorMessage) => emit(AllSubCategoriesFailure(errorMessage.errMessage)),
          (response) {
        selectedCategorySubcategories = response.data ?? [];
        emit(AllSubCategoriesSuccess(response));
      },
    );
  }

  Data? get selectedCategory =>
      categoriesList.firstWhere(
            (e) => e.id == selectedCategoryId,
        orElse: () => Data(),
      );
  bool isViewingProducts = false;

  void showProducts() {
    emit(CategoriesViewProducts(isViewingProducts: true));
  }



}