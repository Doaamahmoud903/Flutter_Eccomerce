import 'package:auto_size_text/auto_size_text.dart';
import 'package:eccomerce_app/core/theming/color_manager.dart';
import 'package:eccomerce_app/core/theming/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';

class AccountViewBody extends StatefulWidget {
  const AccountViewBody({super.key});

  @override
  State<AccountViewBody> createState() => _AccountViewBodyState();
}

class _AccountViewBodyState extends State<AccountViewBody> {
  TextEditingController fullNameController = TextEditingController(text: "Mohamed Mohamed Nabil");
  TextEditingController emailController = TextEditingController(text: "mohamed.N@gmail.com");
  TextEditingController passwordController = TextEditingController(text: "**********");
  TextEditingController mobileController = TextEditingController(text: "01122118855");
  TextEditingController addressController = TextEditingController(text: "6th October, street 11.....");
  bool fullNameReadOnly = true;
  bool emailReadOnly = true;
  bool passwordReadOnly = true;
  bool mobileReadOnly = true;
  bool addressReadOnly = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AutoSizeText(
              "Welcome, Mohamed",
              style: Styles.medium18Header,
            ),
            AutoSizeText(
              "mohamed.N@gmail.com",
              style: Styles.medium14LightPrimary,
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
            AutoSizeText(
              "Your password",
              style: Styles.medium18Header,
            ),
            CustomTextFormField(
              isObscureText: true,
              readonly: passwordReadOnly,
              isPassword: false,
              keyboardType: TextInputType.visiblePassword,
              controller: passwordController,
              borderColor: ColorManager.primary30Opacity,
              suffixIcon: IconButton(onPressed: () {
                passwordReadOnly = false;
                setState(() {});
              }, icon: const Icon(Icons.edit)),
              textStyle: Styles.medium14PrimaryDark,
            ),
            AutoSizeText(
              "Your mobile number",
              style: Styles.medium18Header,
            ),
            CustomTextFormField(
              isPassword: false,
              readonly: mobileReadOnly,
              keyboardType: TextInputType.phone,
              controller: mobileController,
              borderColor: ColorManager.primary30Opacity,
              suffixIcon: IconButton(onPressed: () {
                mobileReadOnly = false;
                setState(() {});
              }, icon: const Icon(Icons.edit)),
              textStyle: Styles.medium14PrimaryDark,
            ),
            AutoSizeText(
              "Your Address",
              style: Styles.medium18Header,
            ),
            CustomTextFormField(
              isPassword: false,
              readonly: addressReadOnly,
              keyboardType: TextInputType.streetAddress,
              controller: addressController,
              borderColor: ColorManager.primary30Opacity,
              suffixIcon: IconButton(onPressed: () {
                addressReadOnly = false;
                setState(() {});
              }, icon: const Icon(Icons.edit)),
              textStyle: Styles.medium14PrimaryDark,
            ),
          ],
        ),
      ),
    );
  }
}
