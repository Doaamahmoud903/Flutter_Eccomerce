import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eccomerce_app/core/functions/build_app.dart';
import 'package:eccomerce_app/core/localization/locale_cubit/locale_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EccomerceApp extends StatelessWidget {
  const EccomerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LocaleCubit(),
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return Builder(builder: (context) => buildAppRoot(context));
        },
      ),
    );
  }
}
