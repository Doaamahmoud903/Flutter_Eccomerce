import 'package:eccomerce_app/features/orders/presentation/views/widgets/order_view_body.dart';
import 'package:flutter/material.dart';

class OrderView extends StatelessWidget {
  final String? cartId;
  const OrderView({super.key,  this.cartId});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    final String? cartId = args is String ? args : null;

    return  OrderViewBody(cartId,);
  }
}