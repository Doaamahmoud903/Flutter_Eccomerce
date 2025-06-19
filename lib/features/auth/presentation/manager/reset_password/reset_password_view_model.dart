// import 'package:eccomerce_app/features/auth/domain/usecases/forgot_password/forgot_password_usecase.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:injectable/injectable.dart';
// import 'package:eccomerce_app/features/auth/presentation/manager/reset_password/reset_password_states.dart';
//
// @injectable
// class ResetPasswordViewModel extends Cubit<ResetPasswordStates>{
//   final emailController = TextEditingController();
//   var formKey = GlobalKey<FormState>();
//   ForgotPasswordUsecase forgotPasswordUsecase;
//   ResetPasswordViewModel({required this.forgotPasswordUsecase}):super(ResetPasswordIntState());
//   Future<void>resetPassword( String email) async{
//     emit(ResetPasswordIntState());
//     emit(ResetPasswordLoadingState());
//
//     final response =await forgotPasswordUsecase.invoke(email);
//
//     response.fold(
//         (failure) => emit(ResetPasswordFailureState(failure.errorMessage)),
//           (user) => emit(ResetPasswordSuccessState(user))
//     );
//   }
// }