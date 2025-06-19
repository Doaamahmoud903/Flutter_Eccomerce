import 'package:eccomerce_app/features/auth/domain/usecases/forgot_password/forgot_password_usecase.dart';
import 'package:eccomerce_app/features/auth/presentation/manager/forgot_password/forgot_password_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ForgotPasswordViewModel extends Cubit<ForgotPasswordStates> {
  final emailController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  ForgotPasswordUsecase forgotPasswordUsecase;
  ForgotPasswordViewModel({required this.forgotPasswordUsecase})
    : super(ForgotPasswordIntState());
  Future<void> resetPassword(String email) async {
    emit(ForgotPasswordLoadingState());

    final response = await forgotPasswordUsecase.invoke(email);

    response.fold(
      (failure) => emit(ForgotPasswordFailureState(failure.errorMessage)),
      (user) => emit(ForgotPasswordSuccessState(user)),
    );
  }
}
