import 'package:eccomerce_app/features/cart/presentation/views/widgets/cart_view_body.dart';
import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  static const String routeName = "BrowseView";
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return  CartViewBody();
  }
}
