import 'package:auto_size_text/auto_size_text.dart';
import 'package:eccomerce_app/core/di/di.dart';
import 'package:eccomerce_app/core/utils/toast_utils.dart';
import 'package:eccomerce_app/core/widgets/custom_loding_indicator.dart';
import 'package:eccomerce_app/core/widgets/custom_text_field.dart';
import 'package:eccomerce_app/features/account/presentation/manager/account_states.dart';
import 'package:eccomerce_app/features/account/presentation/manager/account_view_model.dart';
import 'package:eccomerce_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/theming/color_manager.dart';
import '../../../../../core/theming/styles_manager.dart';
import '../../../../../core/utils/assets_manager.dart';
import '../../../../../core/utils/dialog_utils.dart';
import '../../../../auth/presentation/manager/login/login_view_model.dart';
import '../../../../wishlist/presentation/views/widgets/custom_elevated_button.dart';
class UpdatePassword extends StatelessWidget {
   UpdatePassword({super.key});
  AccountViewModel accountViewModel = getIt<AccountViewModel>();
   LoginViewModel logoutViewModel = getIt<LoginViewModel>();

  @override
  Widget build(BuildContext context) {


    return BlocListener<AccountViewModel , AccountStates>(
      listener: (context , state) async{
        if (state is UpdatePasswordLoading) {
          DialogUtils.showLoading(
            context: context,
            message: "Updating password...",
          );
        } else {
          DialogUtils.hideLoading(context);
        }

        if (state is UpdatePasswordFailure) {
          ToastUtils.showErrorToast(state.errorMessage);
        } else if (state is UpdatePasswordSuccess) {
          ToastUtils.showSuccessToast(
            state.authResponseEntity.message ?? "Password updated successfully",
          );
          await logoutViewModel.logout();
          Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.loginRoute, (route) => false);

        }
      },
      bloc: accountViewModel,
      child: Scaffold(
        backgroundColor: ColorManager.primaryColor,
        body: Padding( padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:  EdgeInsets.only(
                    top: 50.h,left: 97.w,right: 97.w,bottom: 87.h
                ),
                child: Image.asset(AssetManager.logo),
              ),
              CustomTextField(
                prefixColor: ColorManager.grey,
                prefixIcon: AssetManager.lock,
                fillColor: ColorManager.whiteColor,
                hintColor: ColorManager.grey,
                borderRadius:15 ,
                isPassword: true,
                suffixColor: ColorManager.grey,
                hintText: "Current password",
                keyboardType: TextInputType.visiblePassword,
                borderColor: ColorManager.primary30Opacity,
                suffixIcon: AssetManager.editIcon,
                controller: accountViewModel.currentPasswordController,
              ),
              SizedBox(height: 20.h,),
              CustomTextField(
                prefixColor: ColorManager.grey,
                prefixIcon: AssetManager.lock,
                fillColor: ColorManager.whiteColor,
                hintColor: ColorManager.grey,
                borderRadius:15 ,
                isPassword: true,
                suffixColor: ColorManager.grey,
                hintText: "New password",
                keyboardType: TextInputType.visiblePassword,
                borderColor: ColorManager.primary30Opacity,
                suffixIcon: AssetManager.editIcon,
                controller: accountViewModel.newPasswordController,
              ),
              SizedBox(height: 20.h,),
              CustomTextField(
                prefixColor: ColorManager.grey,
                prefixIcon: AssetManager.lock,
                fillColor: ColorManager.whiteColor,
                hintColor: ColorManager.grey,
                borderRadius:15 ,
                isPassword: true,
                suffixColor: ColorManager.grey,
                hintText: "Re-Password",
                keyboardType: TextInputType.visiblePassword,
                borderColor: ColorManager.primary30Opacity,
                suffixIcon: AssetManager.editIcon,
                controller: accountViewModel.rePasswordController,
              ),
              SizedBox(height: 25.h,),
              CustomElevatedButton(
                  text: AppLocalizations.of(context)!.reset_password,
                  onPressed: accountViewModel.updatePassword,
                  backgroundColor: ColorManager.greenColor,
                  textStyle: Styles.medium18White
              )
            ],
          ),
        ),),
      ),
    );
  }
}
