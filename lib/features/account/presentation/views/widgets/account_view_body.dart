import 'package:auto_size_text/auto_size_text.dart';
import 'package:eccomerce_app/core/api/api_constant.dart';
import 'package:eccomerce_app/core/cach_helper/cach_helper.dart';
import 'package:eccomerce_app/core/theming/color_manager.dart';
import 'package:eccomerce_app/core/theming/styles_manager.dart';
import 'package:eccomerce_app/features/account/presentation/views/widgets/show_dialog_logout.dart';
import 'package:eccomerce_app/features/wishlist/presentation/views/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/utils/assets_manager.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../auth/domain/entities/auth_response_entity.dart';

class AccountViewBody extends StatefulWidget {
  const AccountViewBody({super.key});

  @override
  State<AccountViewBody> createState() => _AccountViewBodyState();
}

class _AccountViewBodyState extends State<AccountViewBody> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  bool fullNameReadOnly = true;
  bool emailReadOnly = true;
  bool passwordReadOnly = true;
  bool mobileReadOnly = true;
  bool addressReadOnly = true;
  @override
  void initState() {
    super.initState();
    loadUserDataFromHive();
  }

  Future<void> loadUserDataFromHive() async {
    final prefs = await SharedPreferences.getInstance();
    final email = prefs.getString("email");
    print("Email from SharedPreferences: $email");


    if (email != null) {
      var box = await Hive.openBox(ApiConstant.authBox);
      final userData = box.get(email);

      print("Email from SharedPreferences: $email");
      print("User Data from Hive: $userData");


      if (userData != null && userData is AuthResponseEntity) {
      fullNameController.text = userData.user?.name ?? '';
      emailController.text = userData.user?.email ?? '';
      passwordController.text = '**********';
      mobileController.text = '';
      addressController.text = '';
      setState(() {});
    }}
  }

  @override
  Widget build(BuildContext context) {
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
                 children: [
                   AutoSizeText(
                     "Welcome, Mohamed",
                     style: Styles.medium18Header,
                   ),
                   AutoSizeText(
                     "mohamed.N@gmail.com",
                     style: Styles.medium14LightPrimary,
                   ),
                 ],
               ),
               Column(
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
              readonly: fullNameReadOnly,
              keyboardType: TextInputType.name,
              controller: fullNameController,
              borderColor: ColorManager.primary30Opacity,
              suffixIcon: IconButton(onPressed: () {
                fullNameReadOnly = false;
                setState(() {});
              }, icon: const Icon(Icons.edit)),
              textStyle: Styles.medium14PrimaryDark,
            ),
            AutoSizeText(
              "Your E-mail",
              style: Styles.medium18Header,
            ),
            CustomTextFormField(
              readonly: emailReadOnly,
              isPassword: false,
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
              borderColor: ColorManager.primary30Opacity,
              suffixIcon: IconButton(onPressed: () {
                emailReadOnly = false;
                setState(() {});
              }, icon: const Icon(Icons.edit)),
              textStyle: Styles.medium14PrimaryDark,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.updatePassword);
                },
                child:  Text(
                    AppLocalizations.of(context)!.reset_password,
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(color: Colors.red)
                ),
              ),
            ),
            CustomElevatedButton(
                text: AppLocalizations.of(context)!.update_data,
                onPressed: (){},
                backgroundColor: ColorManager.greenColor,
                textStyle: Styles.medium18White
            )
            // AutoSizeText(
            //   "Your mobile number",
            //   style: Styles.medium18Header,
            // ),
            // CustomTextFormField(
            //   isPassword: false,
            //   readonly: mobileReadOnly,
            //   keyboardType: TextInputType.phone,
            //   controller: mobileController,
            //   borderColor: ColorManager.primary30Opacity,
            //   suffixIcon: IconButton(onPressed: () {
            //     mobileReadOnly = false;
            //     setState(() {});
            //   }, icon: const Icon(Icons.edit)),
            //   textStyle: Styles.medium14PrimaryDark,
            // ),
            // AutoSizeText(
            //   "Your Address",
            //   style: Styles.medium18Header,
            // ),
            // CustomTextFormField(
            //   isPassword: false,
            //   readonly: addressReadOnly,
            //   keyboardType: TextInputType.streetAddress,
            //   controller: addressController,
            //   borderColor: ColorManager.primary30Opacity,
            //   suffixIcon: IconButton(onPressed: () {
            //     addressReadOnly = false;
            //     setState(() {});
            //   }, icon: const Icon(Icons.edit)),
            //   textStyle: Styles.medium14PrimaryDark,
            // ),
          ],
        ),
      ),
    );
  }
}
