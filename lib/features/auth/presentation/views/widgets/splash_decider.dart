import 'package:eccomerce_app/features/layout/presentation/views/layout_view.dart';
import 'package:flutter/material.dart';

import '../../../../../core/cach_helper/cach_helper.dart';
import '../login_view.dart';

class SplashDecider extends StatelessWidget {
  const SplashDecider({super.key});

  Future<bool> _hasToken() async {
    final token = await CacheHelper().getData('token');
    return token != null && token.toString().isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _hasToken(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.data == true) {
          return const LayoutView(); // الصفحة الرئيسية
        } else {
          return const LoginView(); // صفحة تسجيل الدخول
        }
      },
    );
  }
}