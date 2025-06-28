import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:eccomerce_app/core/routes/app_routes.dart';
import 'package:eccomerce_app/features/auth/presentation/manager/login/login_states.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../core/api/api_constant.dart';
import '../../../../../core/cach_helper/cach_helper.dart';
import '../../../../../core/utils/toast_utils.dart';
import '../../../../../core/utils/validators.dart';
import '../../../domain/usecases/login/login_usecase.dart';


@injectable
class LoginViewModel extends Cubit<LoginStates> {
  LoginUsecase loginUsecase;
  LoginViewModel({required this.loginUsecase}) :super(LoginIntState());
  final emailController = TextEditingController(text: "dodaaa@gmail.com");
  final passwordController = TextEditingController(text: "Dondon0123@");
  var formKey = GlobalKey<FormState>();

  Future<void> login() async {
    if (formKey.currentState?.validate() == true) {
      emit(LoginLoadingState());
      final emailError = Validators.validateEmail(emailController.text);
      final passwordError = Validators.validatePassword(
          passwordController.text);
      if (emailError != null) {
        ToastUtils.showErrorToast(emailError);
      } else if (passwordError != null) {
        ToastUtils.showErrorToast(passwordError);
      }
      else {
        final response = await loginUsecase.invoke(
          emailController.text,
          passwordController.text,
        );
        print(response);
        response.fold(
              (failure) => emit(LoginFailureState(failure.errMessage)),
              (user) async {
            await CacheHelper().saveData("token", user.token ?? '');
            final prefs = await SharedPreferences.getInstance();
            await prefs.setString("email", user.user!.email);


            emit(LoginSuccessState(user));
          },
        );

      }
    }
  }

  Future<void> signInWithGoogle(BuildContext context) async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
    await googleUser?.authentication;

    if (googleAuth == null) {
      ToastUtils.showErrorToast("Google authentication failed.");
      return;
    }

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    try {
      final userCredential =
      await FirebaseAuth.instance.signInWithCredential(credential);
      final user = userCredential.user;

      if (user == null) {
        ToastUtils.showErrorToast("Google sign-in failed: User is null.");
        return;
      }


      ToastUtils.showSuccessToast("Login with Google successful");
      await CacheHelper().saveData("token", googleAuth.idToken);

      Navigator.of(context).pushNamed(AppRoutes.homeRoute);
    } catch (e) {
      ToastUtils.showErrorToast("Google sign-in error: $e");
    }
  }

  Future<void> logout() async {
    emit(LogoutLoading());
    try {
      await CacheHelper().removeData('token');
      emit(LogoutSuccess());
    } catch (error) {
      emit(LogoutFailure(error.toString()));
    }
  }
}