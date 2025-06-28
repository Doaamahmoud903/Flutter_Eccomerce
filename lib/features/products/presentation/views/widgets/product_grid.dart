import 'package:eccomerce_app/features/products/presentation/views/widgets/product_tab_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../product_details/presentation/views/product_details_view.dart';
import '../../../domain/entities/products_response_entity.dart';
class ProductGrid extends StatelessWidget {
  final int itemCount;
  final List<Product> productItem;
  const ProductGrid({super.key, required this.itemCount, required this.productItem});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 3.2.h,
                crossAxisSpacing: 16.w,
                mainAxisSpacing: 16.h,
              ),
              itemCount: itemCount,
              itemBuilder: (context, index) {
                final product = productItem;
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            ProductDetailsView(product: product[index]),
                      ),
                    );
                  },
                  child: ProductTabItem(product: product[index]),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
