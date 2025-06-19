import 'package:flutter/material.dart';
import 'package:eccomerce_app/features/layout/presentation/views/widgets/layout_view_body.dart';

class LayoutView extends StatelessWidget {
  static const String routeName = "HomeView";
  const LayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutViewBody();
  }
}
