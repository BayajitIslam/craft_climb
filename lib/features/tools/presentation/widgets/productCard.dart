import 'package:flutter/material.dart';
import '../../../../core/theme/app_pallete.dart';
import '../../../../core/theme/app_text_style.dart';

class ProductCard extends StatelessWidget {
  final Map<String, dynamic> product;
  final VoidCallback onTap;
  final VoidCallback? onAddToCart;

  const ProductCard({
    super.key,
    required this.product,
    required this.onTap,
    this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppPallete.primary,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: AppPallete.dropShadow,
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            Stack(
              children: [
                ClipRRect(
                  borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(12)),
                  child: Image.asset(
                    product['image'],
                    height: 120,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),

                // Price tag
                Positioned(
                  top: 6,
                  right: 6,
                  child: Container(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: AppPallete.accent,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      '\$${product['price']}',
                      style: AppTextStyle.s14w4i(
                        color: AppPallete.primary,
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product name
                  Text(
                    product['name'],
                    style: AppTextStyle.s14w4i(
                      color: AppPallete.bodyText,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),

                  const SizedBox(height: 2),

                  // Description
                  Text(
                    product['description'],
                    style: AppTextStyle.s14w4i(
                      color: AppPallete.subTextColor,
                      fontSize: 10,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),

                  const SizedBox(height: 6),

                  // Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed:
                      product['inStock'] ? onAddToCart : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: product['inStock']
                            ? AppPallete.accent
                            : AppPallete.secondary,
                        padding:
                        const EdgeInsets.symmetric(vertical: 6),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        minimumSize: Size.zero,
                        tapTargetSize:
                        MaterialTapTargetSize.shrinkWrap,
                        elevation: 0,
                      ),
                      child: Text(
                        product['inStock']
                            ? 'Add to Cart'
                            : 'Out of Stock',
                        style: AppTextStyle.s14w4i(
                          color: product['inStock']
                              ? AppPallete.primary
                              : AppPallete.extraAsh,
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}