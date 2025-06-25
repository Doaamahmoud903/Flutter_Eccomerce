import 'dart:convert';
import 'package:device_preview/device_preview.dart';
import 'package:eccomerce_app/features/account/presentation/views/widgets/update_password.dart';
import 'package:eccomerce_app/features/auth/presentation/views/reset_code_view.dart';
import 'package:eccomerce_app/features/auth/presentation/views/reset_password_view.dart';
import 'package:eccomerce_app/features/brands/presentation/views/brands_view.dart';
import 'package:eccomerce_app/features/cart/presentation/views/cart_view.dart';
import 'package:eccomerce_app/features/products/presentation/views/products_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:eccomerce_app/features/auth/presentation/views/forgot_password_view.dart';
import 'package:eccomerce_app/features/auth/presentation/views/login_view.dart';
import 'package:eccomerce_app/features/auth/presentation/views/signup_view.dart';
import 'package:eccomerce_app/features/layout/presentation/views/layout_view.dart';
import 'package:eccomerce_app/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/layout/presentation/manager/layout_cubit.dart';
import '../../l10n/app_localizations.dart';
import '../cach_helper/cach_helper.dart';
import '../localization/locale_cubit/locale_cubit.dart';
import '../routes/app_routes.dart';
import '../theming/app_theme.dart';
import '../theming/theme/theme_cubit.dart';


Widget buildAppRoot(BuildContext context) {
  final token = CacheHelper().getData("token");
  print("access TOKEN >>><<<<< $token");


  return MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => LocaleCubit()),
      BlocProvider(create: (_) => ThemeCubit()),
      BlocProvider(create: (_) => LayoutCubit()),
    ],
    child: Builder(
      builder: (context) {
        final localeState = context.watch<LocaleCubit>().state;
        final themeState = context.watch<ThemeCubit>().state;

        return ScreenUtilInit(
          designSize: const Size(430, 932),
          minTextAdapt: true,
          splitScreenMode: true,
          child: DevicePreview(
            enabled: false,
            builder: (context) {
              return MaterialApp(
                locale:
                    (localeState is ChangeLocaleState)
                        ? localeState.locale
                        : const Locale('en'),
                supportedLocales: const [Locale("en"), Locale("ar")],
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                debugShowCheckedModeBanner: false,
                theme: appTheme(),
                //darkTheme: darkTheme(),
                themeMode: themeState.themeMode,
                initialRoute: token != null
                    ? AppRoutes.loginRoute
                    : AppRoutes.layoutRoute,
                routes: {
                  AppRoutes.layoutRoute: (context) => const LayoutView(),
                  AppRoutes.homeRoute: (context) => const HomeView(),
                  AppRoutes.onboardingRoute: (context) => const OnboardingView(),
                  AppRoutes.forgotPasswordRoute:
                      (context) => const ForgotPasswordView(),
                  AppRoutes.loginRoute: (context) => const LoginView(),
                  AppRoutes.signupRoute: (context) => const SignupView(),
                  AppRoutes.cartRoute: (context) => const CartView(),
                  AppRoutes.brandsRoute:(context) => const BrandsView(),
                  AppRoutes.productsRoute:(context)=> const ProductsView(),
                  AppRoutes.updatePassword:(context)=> const UpdatePassword(),
                  AppRoutes.resetCodeRoute:(context) =>const ResetCodeView(),
                  AppRoutes.resetPasswordRoute:(context) =>const ResetPasswordView()
                  //AppRoutes.productDetailsRoute:(context)=> const ProductDetailsView(),
                },
              );
            },
          ),
        );
      },
    ),
  );
}
