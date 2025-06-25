import 'package:eccomerce_app/features/auth/presentation/manager/reset_code/reset_code_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/usecases/reset_code/reset_code_usecase.dart';

@injectable
class ResetCodeViewModel extends Cubit<ResetCodeStates>{
  final resetController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  ResetCodeUsecase resetCodeUsecase;
  ResetCodeViewModel({required this.resetCodeUsecase}):super(ResetCodeIntState());
  Future<void>resetPassword() async{
    emit(ResetCodeLoadingState());

    final response =await resetCodeUsecase.invoke(resetController.text);

    response.fold(
        (failure) => emit(ResetCodeFailureState(failure.errMessage)),
          (user) => emit(ResetCodeSuccessState(user))
    );
  }
}