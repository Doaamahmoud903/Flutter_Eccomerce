import 'package:eccomerce_app/features/auth/domain/entities/auth_response_entity.dart';

abstract class ResetCodeStates{}
class ResetCodeIntState extends ResetCodeStates{}
class ResetCodeLoadingState extends ResetCodeStates{}

class ResetCodeSuccessState extends ResetCodeStates{
  final AuthResponseEntity authResponseEntity;
  ResetCodeSuccessState(this.authResponseEntity);
}

class ResetCodeFailureState extends ResetCodeStates{
  final String errorMsg;
  ResetCodeFailureState(this.errorMsg);
}
