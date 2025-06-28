// import 'package:get_it/get_it.dart';
// import 'package:dio/dio.dart';
// import '../../features/categories/data/data_sources/remote/categories_remote_data_source.dart';
// import '../../features/categories/data/data_sources/remote/impl/categories_remote_data_source_impl.dart';
// import '../../features/categories/data/repository/categories_repository_impl.dart';
// import '../../features/categories/domain/repository/categories_repository.dart';
// import '../../features/categories/domain/usecases/all_sub_categories_use_case.dart';
// import '../../features/categories/domain/usecases/categories_use_case.dart';
// import '../../features/categories/domain/usecases/specific_category_use_case.dart';
// import '../../features/categories/presentation/manager/categories_view_model.dart';
// import '../api/api_services.dart';
//
// final getIt = GetIt.instance;
//
// void setup() {
//   // Dio instance
//
//   // ApiService depends on Dio
//
//   // Remote Data Source depends on ApiService
//   getIt.registerLazySingleton<CategoriesRemoteDataSource>(
//           () => CategoriesRemoteDataSourceImpl(getIt<ApiService>()));
//
//   // Repository depends on RemoteDataSource
//   getIt.registerLazySingleton<CategoriesRepository>(
//           () => CategoriesRepositoryImpl(getIt<CategoriesRemoteDataSource>()));
//
//   // UseCases depend on Repository
//   getIt.registerLazySingleton<CategoriesUseCase>(
//           () => CategoriesUseCase(getIt()));
//   getIt.registerLazySingleton<SpecificCategoryUseCase>(
//           () => SpecificCategoryUseCase(getIt()));
//   getIt.registerLazySingleton<AllSubCategoriesUseCase>(
//           () => AllSubCategoriesUseCase(getIt()));
//
//   // ViewModel (Cubit)
//   getIt.registerFactory<CategoriesViewModel>(() => CategoriesViewModel(
//     getIt<CategoriesUseCase>(),
//     getIt<SpecificCategoryUseCase>(),
//     getIt<AllSubCategoriesUseCase>(),
//   ));
// }
