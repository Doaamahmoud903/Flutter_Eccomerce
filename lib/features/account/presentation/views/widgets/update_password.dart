import 'package:auto_size_text/auto_size_text.dart';
import 'package:eccomerce_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theming/color_manager.dart';
import '../../../../../core/theming/styles_manager.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../wishlist/presentation/views/widgets/custom_elevated_button.dart';
class UpdatePassword extends StatelessWidget {
  const UpdatePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.reset_password , style: Styles.semi20Primary,),
        centerTitle: true,
      ),
      body: Padding( padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AutoSizeText(
              "Current password",
              style: Styles.medium18Header,
            ),
            CustomTextFormField(
              isObscureText: true,
              isPassword: false,
              keyboardType: TextInputType.visiblePassword,
              //controller: passwordController,
              borderColor: ColorManager.primary30Opacity,
              suffixIcon:const Icon(Icons.edit),
            ),
            AutoSizeText(
              "New password",
              style: Styles.medium18Header,
            ),
            CustomTextFormField(
              isObscureText: true,
              isPassword: false,
              keyboardType: TextInputType.visiblePassword,
              //controller: passwordController,
              borderColor: ColorManager.primary30Opacity,
              suffixIcon:const Icon(Icons.edit),
            ),
            AutoSizeText(
              "Confirm password",
              style: Styles.medium18Header,
            ),
            CustomTextFormField(
              isObscureText: true,
              isPassword: false,
              keyboardType: TextInputType.visiblePassword,
              //controller: passwordController,
              borderColor: ColorManager.primary30Opacity,
              suffixIcon:const Icon(Icons.edit),
            ),
            SizedBox(height: 16.h,),
            CustomElevatedButton(
                text: AppLocalizations.of(context)!.reset_password,
                onPressed: (){},
                backgroundColor: ColorManager.greenColor,
                textStyle: Styles.medium18White
            )
          ],
        ),
      ),),
    );
  }
}
