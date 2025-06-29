import 'package:eccomerce_app/features/auth/domain/entities/auth_response_entity.dart';
import 'package:eccomerce_app/features/cart/presentation/manager/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:eccomerce_app/core/cach_helper/cach_helper.dart';
import 'core/di/di.dart';
import 'core/state_management/bloc_observer.dart';
import 'eccomerce_app.dart';
import 'features/cart/domain/entities/get_cart_response_entity.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(AuthResponseEntityAdapter());
  Hive.registerAdapter(UserAdapter());

  Hive.registerAdapter(GetCartResponseEntityAdapter());
  Hive.registerAdapter(GetCartDataEntityAdapter());
  Hive.registerAdapter(GetCartProductsEntityAdapter());
  Hive.registerAdapter(GetBrandEntityAdapter());
  Hive.registerAdapter(GetCategoryEntityAdapter());
  Hive.registerAdapter(GetSubcategoryEntityAdapter());

  await CacheHelper().initPrefs();
  Bloc.observer = MyBlocObserver();
  configureDependencies();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>getIt<CartViewModel>()),
    ], child:
    const EccomerceApp(),));

}

