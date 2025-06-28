import 'package:eccomerce_app/features/auth/domain/entities/auth_response_entity.dart';

abstract class AccountStates {}
class AccountInitialState extends AccountStates {}
class AccountLoading extends AccountStates {}
class AccountUpdateFailure extends AccountStates {
  final String errorMessage;
  AccountUpdateFailure(this.errorMessage);
}
class AccountUpdateSuccess extends AccountStates {
  final AuthResponseEntity authResponseEntity;
  AccountUpdateSuccess(this.authResponseEntity);
}
class AccountProfileState extends AccountStates {
  final bool isViewingProfile;
  AccountProfileState({required this.isViewingProfile});
}
class AccountEditState extends AccountStates {}

class AccountDataLoaded extends AccountStates {}


// Update Password
class UpdatePasswordLoading extends AccountStates {}
class UpdatePasswordFailure extends AccountStates {
  final String errorMessage;
  UpdatePasswordFailure(this.errorMessage);
}
class UpdatePasswordSuccess extends AccountStates {
  final AuthResponseEntity authResponseEntity;
  UpdatePasswordSuccess(this.authResponseEntity);
}