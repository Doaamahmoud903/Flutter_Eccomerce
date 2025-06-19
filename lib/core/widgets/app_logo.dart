import 'package:flutter/material.dart';
import 'package:eccomerce_app/core/utils/assets_manager.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return SizedBox(
      child: Image.asset(
        AssetManager.logo,
        height: 72,
        width: 237,
        fit: BoxFit.contain,
      ),
    );
  }
}
