import 'package:eccomerce_app/core/theming/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

OutlineInputBorder buildCustomBorder() {
  return OutlineInputBorder(
      borderSide: const BorderSide(
        color: ColorManager.primaryColor,
        width: 1,
      ),
      borderRadius: BorderRadius.circular(50.r));
}
