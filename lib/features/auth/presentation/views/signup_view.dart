import 'package:flutter/material.dart';
import 'package:eccomerce_app/features/auth/presentation/views/widgets/signup_view_body.dart';

class SignupView extends StatelessWidget {
  static const String routeName = "SignupView";
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return  SignupViewBody();
  }
}
