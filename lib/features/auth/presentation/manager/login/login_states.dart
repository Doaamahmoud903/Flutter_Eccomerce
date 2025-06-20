import 'package:eccomerce_app/features/auth/domain/entities/auth_response_entity.dart';

abstract class LoginStates{}
class LoginIntState extends LoginStates{}
class LoginLoadingState extends LoginStates{}

class LoginSuccessState extends LoginStates{
  final AuthResponseEntity authResponseEntity;
  LoginSuccessState(this.authResponseEntity);
}

class LoginFailureState extends LoginStates{
  final String errorMsg;
  LoginFailureState(this.errorMsg);
}
class LogoutLoading extends LoginStates {}
class LogoutSuccess extends LoginStates {}

class LogoutFailure extends LoginStates {
  final String error;
  LogoutFailure(this.error);
}
