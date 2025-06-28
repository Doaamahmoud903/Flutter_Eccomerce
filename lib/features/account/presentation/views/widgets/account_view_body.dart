import 'package:auto_size_text/auto_size_text.dart';
import 'package:eccomerce_app/core/api/api_constant.dart';
import 'package:eccomerce_app/core/di/di.dart';
import 'package:eccomerce_app/core/theming/color_manager.dart';
import 'package:eccomerce_app/core/theming/styles_manager.dart';
import 'package:eccomerce_app/features/account/presentation/manager/account_states.dart';
import 'package:eccomerce_app/features/account/presentation/manager/account_view_model.dart';
import 'package:eccomerce_app/features/account/presentation/views/widgets/show_dialog_logout.dart';
import 'package:eccomerce_app/features/account/presentation/views/widgets/update_password.dart';
import 'package:eccomerce_app/features/wishlist/presentation/views/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/assets_manager.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../l10n/app_localizations.dart';

class AccountViewBody extends StatefulWidget {
   AccountViewBody({super.key});

  @override
  State<AccountViewBody> createState() => _AccountViewBodyState();
}
class _AccountViewBodyState extends State<AccountViewBody> {



  @override
  Widget build(BuildContext context) {
    final accountViewModel = context.watch<AccountViewModel>();
    return BlocBuilder<AccountViewModel, AccountStates>(
        builder: (context, state) {
          if (state is AccountUpdateFailure) {
           print(state.errorMessage);
            return Text(state.errorMessage);
          }
          else if (state is AccountProfileState) {
            return  UpdatePassword();
          }
    else {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   AutoSizeText(
                     "Welcome, ${accountViewModel.fullNameController.text}",
                     style: Styles.medium18Header,
                     textAlign: TextAlign.left,
                   ),
                   AutoSizeText(
                     accountViewModel.emailController.text,
                     style: Styles.medium14LightPrimary,
                     textAlign: TextAlign.left,
                   ),
                 ],
               ),
               Form(
                 key: accountViewModel.formKey,
                 child: Column(
                   children: [
                     SizedBox(
                       width: 135.w,
                       height: 56.h,
                       child: CustomButton(
                         btnName: '', // Empty button name
                         onPressed: () => showLogoutDialog(context),
                         bgColor: ColorManager.redColor,
                         fgColor: ColorManager.redColor,
                         textColor: ColorManager.whiteColor,
                         logo: AssetManager.exitLogo,
                         borderSideColor: ColorManager.redColor,
                       ),
                     )
                   ],
                 ),
               )
             ],
           ),
            SizedBox(height: 40.h,),
            AutoSizeText(
              "Your full name",
              style: Styles.medium18Header,
            ),
            CustomTextFormField(
              isPassword: false,
              readonly: accountViewModel.fullNameReadOnly,
              keyboardType: TextInputType.name,
              controller: accountViewModel.fullNameController,
              borderColor: ColorManager.primary30Opacity,
              suffixIcon: IconButton( onPressed: () => accountViewModel.toggleFullNameEdit(), icon: const Icon(Icons.edit)),
              textStyle: Styles.medium14PrimaryDark,
            ),
            AutoSizeText(
              "Your E-mail",
              style: Styles.medium18Header,
            ),
            CustomTextFormField(
              readonly: accountViewModel.emailReadOnly,
              isPassword: false,
              keyboardType: TextInputType.emailAddress,
              controller: accountViewModel.emailController,
              borderColor: ColorManager.primary30Opacity,
              suffixIcon: IconButton(
                  onPressed: () => accountViewModel.toggleEmailEdit(),
                  icon: const Icon(Icons.edit)),
              textStyle: Styles.medium14PrimaryDark,
            ),
            AutoSizeText(
              "Your Password",
              style: Styles.medium18Header,
            ),
            CustomTextFormField(
              readonly: accountViewModel.passwordReadOnly,
              isPassword: false,
              keyboardType: TextInputType.visiblePassword,
              controller: accountViewModel.passwordController,
              borderColor: ColorManager.primary30Opacity,
              suffixIcon: IconButton(onPressed: () {
                accountViewModel.passwordReadOnly = false;
                BlocProvider.of<AccountViewModel>(context).viewProfile();
                // setState(() {});
              }, icon: const Icon(Icons.edit)),
              textStyle: Styles.medium14PrimaryDark,
            ),

            CustomElevatedButton(
                  text: state is AccountLoading
                    ? "updating ..."
                    : AppLocalizations.of(context)!.update_data,
                onPressed: accountViewModel.updateUserData,
                backgroundColor: ColorManager.greenColor,
                textStyle: Styles.medium18White
            )
          ],
        ),
      ),
    );
    }}
          );
  }
}
