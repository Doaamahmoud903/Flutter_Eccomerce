import 'package:eccomerce_app/features/auth/presentation/reset_password/reset_password_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/usecases/reset_password/reset_password_usecase.dart';

@injectable
class ResetPasswordViewModel extends Cubit<ResetPasswordStates>{
  final emailController = TextEditingController(text: "doaamahmoud903@gmail.com");
  final passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  ResetPasswordUsecase resetPasswordUsecase;
  ResetPasswordViewModel({required this.resetPasswordUsecase}):super(ResetPasswordIntState());
  Future<void>resetPassword() async{
    emit(ResetPasswordIntState());
    emit(ResetPasswordLoadingState());

    final response =await resetPasswordUsecase.invoke(emailController.text , passwordController.text);

    response.fold(
        (failure) => emit(ResetPasswordFailureState(failure.errMessage)),
          (user) => emit(ResetPasswordSuccessState(user))
    );
  }
}