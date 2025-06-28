import 'package:eccomerce_app/core/cach_helper/cach_helper.dart';
import 'package:eccomerce_app/features/account/domain/usecases/update_password_usecase.dart';
import 'package:eccomerce_app/features/account/domain/usecases/update_user_profile_usecase.dart';
import 'package:eccomerce_app/features/account/presentation/manager/account_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/api/api_constant.dart';
import '../../../../core/utils/toast_utils.dart';
import '../../../auth/domain/entities/auth_response_entity.dart';


@injectable
class AccountViewModel extends Cubit<AccountStates> {
  final UpdateUserProfileUsecase updateUserProfileUsecase;
  final UpdatePasswordUsecase updatePasswordUsecase;

  AccountViewModel({
    required this.updateUserProfileUsecase,
    required this.updatePasswordUsecase,
  }) : super(AccountInitialState());

  final formKey = GlobalKey<FormState>();

  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final mobileController = TextEditingController();
  final addressController = TextEditingController();

  bool fullNameReadOnly = true;
  bool emailReadOnly = true;
  bool passwordReadOnly = true;
  bool mobileReadOnly = true;
  bool addressReadOnly = true;

  bool isViewingProfile = false;

  Future<void> loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final email = prefs.getString("email");
    if (email == null) return;

    var box = await Hive.openBox(ApiConstant.authBox);
    final userData = box.get(email);
    if (userData != null && userData is AuthResponseEntity) {
      fullNameController.text = userData.user?.name ?? '';
      emailController.text = userData.user?.email ?? '';
      passwordController.text = '**********';
      emit(AccountDataLoaded());
    }
  }

  void toggleFullNameEdit() {
    fullNameReadOnly = !fullNameReadOnly;
    emit(AccountEditState());
  }

  void toggleEmailEdit() {
    emailReadOnly = !emailReadOnly;
    emit(AccountEditState());
  }

  void viewProfile() {
    emit(AccountProfileState(isViewingProfile: true));
  }

  Future<void> updateUserData() async {
    final String token = await CacheHelper().getData('token');

    if (!formKey.currentState!.validate()) return;

    emit(AccountLoading());

    final response = await updateUserProfileUsecase.invoke(
      fullNameController.text,
      emailController.text,
      token,
    );

    response.fold(
          (failure) => emit(AccountUpdateFailure(failure.errMessage)),
          (user) => emit(AccountUpdateSuccess(user))
    );
  }


  @override
  Future<void> close() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    mobileController.dispose();
    addressController.dispose();
    return super.close();
  }

  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();

  Future<void> updatePassword() async {
    final String token = await CacheHelper().getData('token');
    if (newPasswordController.text != rePasswordController.text) {
      ToastUtils.showErrorToast("Passwords do not match");
      return;
    }

    emit(UpdatePasswordLoading());

    final response = await updatePasswordUsecase.invoke(
      currentPasswordController.text,
      newPasswordController.text,
      rePasswordController.text,
      token,
    );

    response.fold(
            (failure) => emit(UpdatePasswordFailure(failure.errMessage)),
            (user) => emit(UpdatePasswordSuccess(user))
    );
  }
}