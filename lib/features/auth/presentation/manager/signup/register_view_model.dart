import 'package:eccomerce_app/features/auth/domain/usecases/register/register_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:eccomerce_app/core/utils/toast_utils.dart';
import 'package:eccomerce_app/core/utils/validators.dart';
import 'package:eccomerce_app/features/auth/presentation/manager/signup/register_states.dart';

@injectable
class RegisterViewModel extends Cubit<RegisterStates>{
  RegisterUsecase registerUsecase;
  RegisterViewModel({required this.registerUsecase}):super(RegisterIntState());
  final emailController = TextEditingController(text: "dodoo@gmail.com");
  final passwordController = TextEditingController(text: "Dodo0123@");
  final rePasswordController = TextEditingController(text: "Dodo0123@");
  final nameController = TextEditingController(text: "Dodo");
  final phoneController = TextEditingController(text: "+201141209334");
  var formKey = GlobalKey<FormState>();

  Future<void> signUp() async{
    if(formKey.currentState?.validate() == true){
       emit(RegisterLoadingState());
      final nameError = Validators.validateName(nameController.text);
      final emailError = Validators.validateEmail(emailController.text);
      final passwordError = Validators.validatePassword(passwordController.text);
      final rePasswordError = Validators.validateConfirmPassword(rePasswordController.text,
          passwordController.text);
      final phoneError = Validators.validatePhone(phoneController.text);
      if (nameError != null) {
        ToastUtils.showErrorToast(nameError);
      } else if (emailError != null) {
        ToastUtils.showErrorToast(emailError);
      } else if (passwordError != null) {
        ToastUtils.showErrorToast(passwordError);
      } else if (rePasswordError != null) {
        ToastUtils.showErrorToast(rePasswordError);
       }
        else if (phoneError != null) {
        ToastUtils.showErrorToast(phoneError);
      }
       else {
        final response = await registerUsecase.invoke(
            nameController.text,
            emailController.text,
            passwordController.text,
            rePasswordController.text,
            phoneController.text,
           );
        print(response);
        response.fold(
              (failure) => emit(RegisterFailureState(failure.errMessage)),
              (user) => emit(RegisterSuccessState(user)),
        );

      }
    
    
    }}
}