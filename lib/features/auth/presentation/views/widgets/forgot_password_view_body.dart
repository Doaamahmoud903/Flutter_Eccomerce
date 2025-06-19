import 'package:eccomerce_app/core/di/di.dart';
import 'package:eccomerce_app/features/auth/presentation/manager/forgot_password/forgot_password_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/theming/color_manager.dart';
import '../../../../../core/theming/styles_manager.dart';
import '../../../../../core/utils/assets_manager.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../../../../l10n/app_localizations.dart';

class ForgotPasswordViewBody extends StatelessWidget {
   ForgotPasswordViewBody({super.key});
   ForgotPasswordViewModel forgotPasswordViewModel = getIt<ForgotPasswordViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    child: Text(AppLocalizations.of(context)!.email,
                      style: Theme.of(context).textTheme.displayLarge,),
                  ),
                  SizedBox(height: 20.h,),
                  CustomTextField(
                    controller: forgotPasswordViewModel.emailController,
                    prefixColor: ColorManager.textColorInTextField,
                    prefixIcon: AssetManager.email,
                    fillColor: ColorManager.whiteColor,
                    hintText: "enter your email",
                    hintColor: ColorManager.textColorInTextField,
                    borderRadius:15 ,

                  ),
                  SizedBox(height: 40.h,),
                  CustomButton(
                    btnName: AppLocalizations.of(context)!.verify_email,
                    onPressed: (){},
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
    );
  }
}
