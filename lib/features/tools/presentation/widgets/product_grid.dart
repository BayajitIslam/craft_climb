import 'package:craft_climb/features/tools/presentation/pages/cart_page.dart';
import 'package:craft_climb/features/tools/presentation/pages/product_detail_page.dart';
import 'package:craft_climb/features/tools/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/screen_size.dart';

class ProductGrid extends StatelessWidget {
  final List<Map<String, dynamic>> products;

  const ProductGrid({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    // Dynamically compute a safe aspect ratio from actual card content
    // Card = image (cardWidth * 0.55) + text/button section (~110px)
    final double screenWidth = MediaQuery.of(context).size.width;
    final double spacing = context.spacing16 * 2 + 12; // h-padding + gap
    final double cardWidth = (screenWidth - spacing) / 2;
    final double imageHeight = cardWidth * 0.55;
    const double contentHeight = 110.0; // name + desc + button + padding
    final double cardHeight = imageHeight + contentHeight;
    final double aspectRatio = cardWidth / cardHeight;

    // Bottom padding = nav bar height + extra breathing room
    final double bottomPadding =
        MediaQuery.of(context).padding.bottom + context.spacing16;

    return GridView.builder(
      padding: EdgeInsets.only(
        left: context.spacing16,
        right: context.spacing16,
        top: context.spacing8,
        bottom: bottomPadding, // ← respects home bar / nav bar
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: aspectRatio, // ← computed, never breaks
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ProductCard(
          product: products[index],
          onAddToCart: () => Navigator.push(context, CartPage.route()),
          onTap: () => Navigator.push(
            context,
            ProductDetailPage.route(product: products[index]),
          ),
        );
      },
    );
  }
}
