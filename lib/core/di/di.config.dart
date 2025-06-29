// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/account/data/data_sources/local/account_remote_data_source.dart'
    as _i263;
import '../../features/account/data/data_sources/local/impl/account_remote_data_source_impl.dart'
    as _i415;
import '../../features/account/data/data_sources/remote/account_remote_data_source.dart'
    as _i305;
import '../../features/account/data/data_sources/remote/impl/account_remote_data_source_impl.dart'
    as _i24;
import '../../features/account/data/repository/account_repository_impl.dart'
    as _i852;
import '../../features/account/domain/repository/account_repository.dart'
    as _i104;
import '../../features/account/domain/usecases/update_password_usecase.dart'
    as _i632;
import '../../features/account/domain/usecases/update_user_profile_usecase.dart'
    as _i475;
import '../../features/account/presentation/manager/account_view_model.dart'
    as _i450;
import '../../features/auth/data/data_sources/local/auth_local_data_source.dart'
    as _i485;
import '../../features/auth/data/data_sources/local/impl/auth_local_data_source_impl.dart'
    as _i754;
import '../../features/auth/data/data_sources/remote/auth_remote_data_source.dart'
    as _i432;
import '../../features/auth/data/data_sources/remote/impl/auth_remote_data_source_impl.dart'
    as _i219;
import '../../features/auth/data/repository/auth_repository_impl.dart' as _i409;
import '../../features/auth/domain/repository/auth_repository.dart' as _i961;
import '../../features/auth/domain/usecases/forgot_password/forgot_password_usecase.dart'
    as _i1024;
import '../../features/auth/domain/usecases/login/login_usecase.dart' as _i950;
import '../../features/auth/domain/usecases/register/register_usecase.dart'
    as _i46;
import '../../features/auth/domain/usecases/reset_code/reset_code_usecase.dart'
    as _i870;
import '../../features/auth/domain/usecases/reset_password/reset_password_usecase.dart'
    as _i578;
import '../../features/auth/presentation/manager/forgot_password/forgot_password_view_model.dart'
    as _i290;
import '../../features/auth/presentation/manager/login/login_view_model.dart'
    as _i526;
import '../../features/auth/presentation/manager/reset_code/reset_code_view_model.dart'
    as _i280;
import '../../features/auth/presentation/manager/reset_password/reset_password_view_model.dart'
    as _i903;
import '../../features/auth/presentation/manager/signup/register_view_model.dart'
    as _i292;
import '../../features/brands/data/data_sources/remote/brands_remote_data_source.dart'
    as _i146;
import '../../features/brands/data/data_sources/remote/impl/brands_remote_data_source_impl.dart'
    as _i711;
import '../../features/brands/data/repository/brands_repository_impl.dart'
    as _i682;
import '../../features/brands/domain/repository/brands_repository.dart' as _i96;
import '../../features/brands/domain/usecases/brands_use_case.dart' as _i701;
import '../../features/brands/domain/usecases/specific_brand_use_case.dart'
    as _i1021;
import '../../features/brands/presentation/manager/brands_view_model.dart'
    as _i227;
import '../../features/cart/data/data_sources/local/cart_local_data_source.dart'
    as _i1048;
import '../../features/cart/data/data_sources/local/impl/cart_local_data_source_impl.dart'
    as _i116;
import '../../features/cart/data/data_sources/remote/cart_remote_data_source.dart'
    as _i742;
import '../../features/cart/data/data_sources/remote/impl/cart_remote_data_source_impl.dart'
    as _i1042;
import '../../features/cart/data/repository/cart_repository_impl.dart'
    as _i1063;
import '../../features/cart/domain/repository/cart_repository.dart' as _i26;
import '../../features/cart/domain/usecases/add_to_cart_usecase.dart' as _i659;
import '../../features/cart/domain/usecases/clear_cart_usecase.dart' as _i240;
import '../../features/cart/domain/usecases/get_cart_usecase.dart' as _i179;
import '../../features/cart/domain/usecases/remove_from_cart_usecase.dart'
    as _i355;
import '../../features/cart/domain/usecases/update_cart_quantity_usecase.dart'
    as _i302;
import '../../features/cart/presentation/manager/cart_view_model.dart' as _i582;
import '../../features/categories/data/data_sources/remote/categories_remote_data_source.dart'
    as _i659;
import '../../features/categories/data/data_sources/remote/impl/categories_remote_data_source_impl.dart'
    as _i890;
import '../../features/categories/data/repository/categories_repository_impl.dart'
    as _i187;
import '../../features/categories/domain/repository/categories_repository.dart'
    as _i419;
import '../../features/categories/domain/usecases/all_sub_categories_use_case.dart'
    as _i228;
import '../../features/categories/domain/usecases/categories_use_case.dart'
    as _i444;
import '../../features/categories/domain/usecases/specific_category_use_case.dart'
    as _i319;
import '../../features/categories/presentation/manager/categories_view_model.dart'
    as _i254;
import '../../features/products/data/data_sources/remote/impl/products_remote_data_source_impl.dart'
    as _i832;
import '../../features/products/data/data_sources/remote/products_remote_data_source.dart'
    as _i725;
import '../../features/products/data/repository/products_repository_impl.dart'
    as _i701;
import '../../features/products/domain/repository/products_repository.dart'
    as _i822;
import '../../features/products/domain/usecases/all_products_use_case.dart'
    as _i426;
import '../../features/products/domain/usecases/search_products_usecase.dart'
    as _i657;
import '../../features/products/domain/usecases/specific_product_use_case.dart'
    as _i78;
import '../../features/products/presentation/manager/products_view_model.dart'
    as _i725;
import '../api/api_services.dart' as _i124;
import '../api/dio_factory.dart' as _i1008;
import '../connectivity/connectivity.dart' as _i273;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dioFactory = _$DioFactory();
    final appModule = _$AppModule();
    gh.lazySingleton<_i361.Dio>(() => dioFactory.dio());
    gh.lazySingleton<_i895.Connectivity>(() => appModule.connectivity);
    gh.factory<_i485.AuthLocalDataSource>(
        () => _i754.AuthLocalDataSourceImpl());
    gh.factory<_i124.ApiService>(() => _i124.ApiService(gh<_i361.Dio>()));
    gh.factory<_i659.CategoriesRemoteDataSource>(
        () => _i890.CategoriesRemoteDataSourceImpl(gh<_i124.ApiService>()));
    gh.factory<_i305.AccountRemoteDataSource>(
        () => _i24.AccountRemoteDataSourceImpl(
              gh<_i124.ApiService>(),
              connectivity: gh<_i895.Connectivity>(),
            ));
    gh.factory<_i1048.CartLocalDataSource>(
        () => _i116.CartLocalDataSourceImpl());
    gh.factory<_i419.CategoriesRepository>(() =>
        _i187.CategoriesRepositoryImpl(gh<_i659.CategoriesRemoteDataSource>()));
    gh.factory<_i742.CartRemoteDataSource>(
        () => _i1042.CartRemoteDataSourceImpl(
              gh<_i124.ApiService>(),
              gh<_i895.Connectivity>(),
            ));
    gh.factory<_i146.BrandsRemoteDataSource>(
        () => _i711.BrandsRemoteDataSourceImpl(gh<_i124.ApiService>()));
    gh.factory<_i26.CartRepository>(() => _i1063.CartRepositoryImpl(
          connectivity: gh<_i895.Connectivity>(),
          cartLocalDataSource: gh<_i1048.CartLocalDataSource>(),
          cartRemoteDataSource: gh<_i742.CartRemoteDataSource>(),
        ));
    gh.factory<_i263.AccountRemoteDataSource>(
        () => _i415.AccountRemoteDataSourceImpl(
              gh<_i124.ApiService>(),
              connectivity: gh<_i895.Connectivity>(),
            ));
    gh.factory<_i432.AuthRemoteDataSource>(() => _i219.AuthRemoteDataSourceImpl(
          gh<_i124.ApiService>(),
          connectivity: gh<_i895.Connectivity>(),
        ));
    gh.factory<_i725.ProductsRemoteDataSource>(
        () => _i832.ProductsRemoteDataSourceImpl(gh<_i124.ApiService>()));
    gh.factory<_i104.AccountRepository>(() => _i852.AccountRepositoryImpl(
          gh<_i305.AccountRemoteDataSource>(),
          connectivity: gh<_i895.Connectivity>(),
        ));
    gh.factory<_i822.ProductsRepository>(() =>
        _i701.ProductsRepositoryImpl(gh<_i725.ProductsRemoteDataSource>()));
    gh.factory<_i632.UpdatePasswordUsecase>(
        () => _i632.UpdatePasswordUsecase(gh<_i104.AccountRepository>()));
    gh.factory<_i475.UpdateUserProfileUsecase>(
        () => _i475.UpdateUserProfileUsecase(gh<_i104.AccountRepository>()));
    gh.factory<_i228.AllSubCategoriesUseCase>(
        () => _i228.AllSubCategoriesUseCase(gh<_i419.CategoriesRepository>()));
    gh.factory<_i444.CategoriesUseCase>(
        () => _i444.CategoriesUseCase(gh<_i419.CategoriesRepository>()));
    gh.factory<_i319.SpecificCategoryUseCase>(
        () => _i319.SpecificCategoryUseCase(gh<_i419.CategoriesRepository>()));
    gh.factory<_i426.AllProductsUseCase>(
        () => _i426.AllProductsUseCase(gh<_i822.ProductsRepository>()));
    gh.factory<_i78.SpecificProductUseCase>(
        () => _i78.SpecificProductUseCase(gh<_i822.ProductsRepository>()));
    gh.factory<_i657.SearchProductsUseCase>(
        () => _i657.SearchProductsUseCase(gh<_i822.ProductsRepository>()));
    gh.factory<_i725.ProductsViewModel>(() => _i725.ProductsViewModel(
          gh<_i426.AllProductsUseCase>(),
          gh<_i78.SpecificProductUseCase>(),
          gh<_i657.SearchProductsUseCase>(),
        ));
    gh.factory<_i96.BrandsRepository>(
        () => _i682.BrandsRepositoryImpl(gh<_i146.BrandsRemoteDataSource>()));
    gh.factory<_i701.BrandsUseCase>(
        () => _i701.BrandsUseCase(gh<_i96.BrandsRepository>()));
    gh.factory<_i1021.SpecificBrandUseCase>(
        () => _i1021.SpecificBrandUseCase(gh<_i96.BrandsRepository>()));
    gh.factory<_i659.AddToCartUsecase>(
        () => _i659.AddToCartUsecase(gh<_i26.CartRepository>()));
    gh.factory<_i240.ClearCartUsecase>(
        () => _i240.ClearCartUsecase(gh<_i26.CartRepository>()));
    gh.factory<_i179.GetCartUsecase>(
        () => _i179.GetCartUsecase(gh<_i26.CartRepository>()));
    gh.factory<_i355.RemoveFromCartUsecase>(
        () => _i355.RemoveFromCartUsecase(gh<_i26.CartRepository>()));
    gh.factory<_i302.UpdateCartQuantityUsecase>(
        () => _i302.UpdateCartQuantityUsecase(gh<_i26.CartRepository>()));
    gh.factory<_i961.AuthRepository>(() => _i409.AuthRepositoryImpl(
          authRemoteDataSource: gh<_i432.AuthRemoteDataSource>(),
          authLocalDataSource: gh<_i485.AuthLocalDataSource>(),
          connectivity: gh<_i895.Connectivity>(),
        ));
    gh.factory<_i254.CategoriesViewModel>(() => _i254.CategoriesViewModel(
          gh<_i444.CategoriesUseCase>(),
          gh<_i319.SpecificCategoryUseCase>(),
          gh<_i228.AllSubCategoriesUseCase>(),
        ));
    gh.factory<_i450.AccountViewModel>(() => _i450.AccountViewModel(
          updateUserProfileUsecase: gh<_i475.UpdateUserProfileUsecase>(),
          updatePasswordUsecase: gh<_i632.UpdatePasswordUsecase>(),
        ));
    gh.factory<_i1024.ForgotPasswordUsecase>(
        () => _i1024.ForgotPasswordUsecase(gh<_i961.AuthRepository>()));
    gh.factory<_i950.LoginUsecase>(
        () => _i950.LoginUsecase(gh<_i961.AuthRepository>()));
    gh.factory<_i46.RegisterUsecase>(
        () => _i46.RegisterUsecase(gh<_i961.AuthRepository>()));
    gh.factory<_i578.ResetPasswordUsecase>(
        () => _i578.ResetPasswordUsecase(gh<_i961.AuthRepository>()));
    gh.factory<_i870.ResetCodeUsecase>(
        () => _i870.ResetCodeUsecase(gh<_i961.AuthRepository>()));
    gh.factory<_i526.LoginViewModel>(
        () => _i526.LoginViewModel(loginUsecase: gh<_i950.LoginUsecase>()));
    gh.factory<_i582.CartViewModel>(() => _i582.CartViewModel(
          gh<_i659.AddToCartUsecase>(),
          gh<_i355.RemoveFromCartUsecase>(),
          gh<_i179.GetCartUsecase>(),
          gh<_i240.ClearCartUsecase>(),
          gh<_i302.UpdateCartQuantityUsecase>(),
        ));
    gh.factory<_i290.ForgotPasswordViewModel>(() =>
        _i290.ForgotPasswordViewModel(
            forgotPasswordUsecase: gh<_i1024.ForgotPasswordUsecase>()));
    gh.factory<_i227.BrandsViewModel>(() => _i227.BrandsViewModel(
          gh<_i701.BrandsUseCase>(),
          gh<_i1021.SpecificBrandUseCase>(),
        ));
    gh.factory<_i292.RegisterViewModel>(() =>
        _i292.RegisterViewModel(registerUsecase: gh<_i46.RegisterUsecase>()));
    gh.factory<_i280.ResetCodeViewModel>(() => _i280.ResetCodeViewModel(
        resetCodeUsecase: gh<_i870.ResetCodeUsecase>()));
    gh.factory<_i903.ResetPasswordViewModel>(() => _i903.ResetPasswordViewModel(
        resetPasswordUsecase: gh<_i578.ResetPasswordUsecase>()));
    return this;
  }
}

class _$DioFactory extends _i1008.DioFactory {}

class _$AppModule extends _i273.AppModule {}
