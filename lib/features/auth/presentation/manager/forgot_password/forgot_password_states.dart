import 'package:eccomerce_app/features/auth/domain/entities/auth_response_entity.dart';

abstract class ForgotPasswordStates{}
class ForgotPasswordIntState extends ForgotPasswordStates{}
class ForgotPasswordLoadingState extends ForgotPasswordStates{}

class ForgotPasswordSuccessState extends ForgotPasswordStates{
  final AuthResponseEntity authResponseEntity;
  ForgotPasswordSuccessState(this.authResponseEntity);
}

class ForgotPasswordFailureState extends ForgotPasswordStates{
  final String errorMsg;
  ForgotPasswordFailureState(this.errorMsg);
}
