import 'package:eccomerce_app/features/product_details/presentation/views/widgets/product_details_view_body.dart';
import 'package:flutter/material.dart';

import '../../../products/domain/entities/products_response_entity.dart';

class ProductDetailsView extends StatelessWidget {
  final Product product;
  const ProductDetailsView({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return ProductDetailsViewBody(product: product);
  }
}
