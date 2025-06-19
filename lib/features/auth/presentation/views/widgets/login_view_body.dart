import 'package:eccomerce_app/core/di/di.dart';
import 'package:eccomerce_app/features/auth/presentation/manager/login/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/theming/color_manager.dart';
import '../../../../../core/theming/styles_manager.dart';
import '../../../../../core/utils/assets_manager.dart';
import '../../../../../core/utils/toast_utils.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_loding_indicator.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../manager/login/login_states.dart';

class LoginViewBody extends StatelessWidget {
   LoginViewBody({super.key});
   LoginViewModel loginViewModel = getIt<LoginViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      listener: (context , state){
        if(state is LoginLoadingState){
          const Center(child: CustomLoadingIndicator(),);
        }else if(state is LoginFailureState){
          ToastUtils.showErrorToast(state.errorMsg);
        }else if(state is LoginSuccessState){
          ToastUtils.showSuccessToast(AppLocalizations.of(context)!.login);
          Navigator.of(context).pushNamed(AppRoutes.layoutRoute);
        }
      },
      bloc: loginViewModel,
      child: Scaffold(
        backgroundColor: ColorManager.primaryColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:  EdgeInsets.only(
                    top: 91.h,left: 97.w,right: 97.w,bottom: 87.h
                ),
                child: Image.asset(AssetManager.logo),
              ),
              Padding(
                padding:  EdgeInsets.only(
                    left: 16.w,right: 16.w
                ),
                child: Form(
                  key: loginViewModel.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(AppLocalizations.of(context)!.welcome_back,
                        style: Theme.of(context).textTheme.headlineLarge,),
                      const SizedBox(height: 5,),
                      Text(AppLocalizations.of(context)!.login_msg,
                          style: Styles.light16White),
                      Padding(padding: EdgeInsets.only(top: 24.h),
                        child: Text(AppLocalizations.of(context)!.email,
                          style: Theme.of(context).textTheme.displayLarge,),
                      ),
                      SizedBox(height: 20.h,),
                      CustomTextField(
                        controller: loginViewModel.emailController,
                        prefixColor: ColorManager.textColorInTextField,
                        prefixIcon: AssetManager.email,
                        fillColor: ColorManager.whiteColor,
                        hintText: "enter your email",
                        hintColor: ColorManager.textColorInTextField,
                        borderRadius:15 ,

                      ),
                      Padding(padding: EdgeInsets.only(top: 24.h),
                        child: Text(AppLocalizations.of(context)!.password,
                          style: Theme.of(context).textTheme.displayLarge,),
                      ),
                      SizedBox(height: 20.h,),
                      CustomTextField(
                        controller: loginViewModel.passwordController,
                        prefixColor: ColorManager.textColorInTextField,
                        prefixIcon: AssetManager.email,
                        fillColor: ColorManager.whiteColor,
                        hintText: "enter your password",
                        hintColor: ColorManager.textColorInTextField,
                        borderRadius:15 ,
                        isPassword: true,
                        suffixColor: ColorManager.textColorInTextField,

                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, AppRoutes.forgotPasswordRoute);
                          },
                          child:  Text(
                              AppLocalizations.of(context)!.forget_password_ques,
                              style: Theme.of(context).textTheme  .displayLarge
                          ),
                        ),
                      ),
                      SizedBox(height: 40.h,),
                      CustomButton(
                        btnName: AppLocalizations.of(context)!.login,
                        onPressed: loginViewModel.login,
                        bgColor: ColorManager.whiteColor,
                        fgColor: ColorManager.primaryColor,
                        textColor:  ColorManager.primaryColor,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, AppRoutes.signupRoute);
                          },
                          child:  Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(AppLocalizations.of(context)!.dont_have_account
                                ,style:Theme.of(context).textTheme.bodyLarge,

                              ),
                              Text(
                                AppLocalizations.of(context)!.create_account,
                                style: Styles.semi16TextWhite.copyWith(color: ColorManager.orangeColor)
                              ),
                            ],
                          )
                      ),

                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
