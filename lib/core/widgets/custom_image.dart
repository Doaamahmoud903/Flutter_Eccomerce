import 'package:eccomerce_app/core/theming/color_manager.dart';
import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({super.key, required this.imagePath, this.h, this.w, this.fit});

  final String imagePath;
  final double? h, w;
  final BoxFit? fit;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorManager.textColorInTextField,
        child: Image.asset(imagePath, width: w, height: h, fit: fit,));
  }
}