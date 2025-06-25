import 'package:eccomerce_app/core/api/api_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/di/di.dart';
import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/theming/color_manager.dart';
import '../../../../../core/theming/styles_manager.dart';
import '../../../../../core/utils/assets_manager.dart';
import '../../../../../core/utils/toast_utils.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_loding_indicator.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../manager/reset_code/reset_code_states.dart';
import '../../manager/reset_code/reset_code_view_model.dart';

class ResetCodeViewBody extends StatelessWidget {
   ResetCodeViewBody({super.key});
   ResetCodeViewModel resetPasswordViewModel = getIt<ResetCodeViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<ResetCodeViewModel , ResetCodeStates>(
      listener: (context , state){
        if(state is ResetCodeLoadingState){
          const Center(child: CustomLoadingIndicator(),);
        }else if(state is ResetCodeFailureState){
          ToastUtils.showErrorToast(state.errorMsg);
          print(state.errorMsg);
        }else if(state is ResetCodeSuccessState){
          ToastUtils.showSuccessToast(state.authResponseEntity.message ?? "Reset code sent to your email");
          Navigator.pushReplacementNamed(context, AppRoutes.resetPasswordRoute);
        }
      },
      bloc: resetPasswordViewModel,
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [

                    Padding(padding: EdgeInsets.only(top: 24.h),
                      child: Text(AppLocalizations.of(context)!.code,
                        style: Theme.of(context).textTheme.displayLarge,),
                    ),
                    SizedBox(height: 20.h,),
                    CustomTextField(
                      controller: resetPasswordViewModel.resetController,
                      prefixColor: ColorManager.textColorInTextField,
                      prefixIcon: AssetManager.editIcon,
                      fillColor: ColorManager.whiteColor,
                      hintText: "enter your Reset Code",
                      hintColor: ColorManager.textColorInTextField,
                      borderRadius:15 ,

                    ),
                    SizedBox(height: 40.h,),
                    CustomButton(
                      btnName: AppLocalizations.of(context)!.verify_email,
                      onPressed: () => resetPasswordViewModel.resetPassword(),
                      bgColor: ColorManager.whiteColor,
                      fgColor: ColorManager.primaryColor,
                      textColor:  ColorManager.primaryColor,
                    ),
                    SizedBox(height: 20.h,),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutes.signupRoute);
                        },
                        child:  Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Text(
                                AppLocalizations.of(context)!.create_account,
                                style: Styles.semi16TextWhite
                            ),
                          ],
                        )
                    ),
                    Row(
                      children: [
                        Expanded(child: Divider(indent:100.w,color: ColorManager.orangeColor,)),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 5.w,
                          ),
                          child: Text(AppLocalizations.of(context)!.or,
                            style:  const TextStyle(
                                color: ColorManager.orangeColor,
                                fontSize: 15
                            ),),
                        ),
                        Expanded(child: Divider(endIndent: 100.w,color: ColorManager.orangeColor,)),
                      ],
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutes.loginRoute);
                        },
                        child:  Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                AppLocalizations.of(context)!.login,
                                style: Styles.semi16TextWhite
                            ),
                          ],
                        )
                    ),

                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
