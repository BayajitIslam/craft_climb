import 'package:craft_climb/features/tools/presentation/widgets/productCard.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/screen_size.dart';
import '../pages/productdetails.dart';

class ProductGrid extends StatelessWidget {
  final List<Map<String, dynamic>> products;

  const ProductGrid({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: context.spacing16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.72,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ProductCard(
          product: products[index],
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) =>
                    ProductDetailScreen(product: products[index]),
              ),
            );
          },
        );
      },
    );
  }
}