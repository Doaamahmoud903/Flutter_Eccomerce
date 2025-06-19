import 'package:eccomerce_app/features/categories/presentation/views/widgets/categories_view_body.dart';
import 'package:flutter/material.dart';

class CategoriesView extends StatelessWidget {
  static const String routeName = "BrowseView";
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return  CategoriesViewBody();
  }
}
