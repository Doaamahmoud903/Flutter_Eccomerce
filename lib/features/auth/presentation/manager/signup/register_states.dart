import 'package:eccomerce_app/features/auth/domain/entities/auth_response_entity.dart';

abstract class RegisterStates{}
class RegisterIntState extends RegisterStates{}
class RegisterLoadingState extends RegisterStates{}

class RegisterSuccessState extends RegisterStates{
  final AuthResponseEntity authResponseEntity;
  RegisterSuccessState(this.authResponseEntity);
}

class RegisterFailureState extends RegisterStates{
  final String errorMsg;
  RegisterFailureState(this.errorMsg);
}
