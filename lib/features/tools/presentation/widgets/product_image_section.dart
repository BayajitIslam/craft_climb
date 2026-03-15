import 'package:flutter/material.dart';

import '../../../../core/theme/app_pallete.dart';
import '../../../../core/utils/screen_size.dart';

class ProductImageSection extends StatelessWidget {
  final Map<String, dynamic> product;
  final VoidCallback? onBack;
  final VoidCallback? onBookmark;
  final Widget? quantityControl;

  const ProductImageSection({
    super.key,
    required this.product,
    this.onBack,
    this.onBookmark,
    this.quantityControl,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Product image
        Container(
          width: double.infinity,
          height: context.heightPercentage(38),
          color: AppPallete.secondary,
          child: Image.asset(
            product['image'],
            fit: BoxFit.contain,
          ),
        ),

        // Back button
        Positioned(
          top: context.spacing12,
          left: context.spacing16,
          child: GestureDetector(
            onTap: onBack ?? () => Navigator.pop(context),
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: AppPallete.primary,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppPallete.dropShadow,
                    blurRadius: 4,
                  ),
                ],
              ),
              child: const Icon(Icons.arrow_back_ios_new,
                  size: 14, color: AppPallete.bodyText),
            ),
          ),
        ),

        // Bookmark button
        Positioned(
          top: context.spacing12,
          right: context.spacing16,
          child: GestureDetector(
            onTap: onBookmark,
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: AppPallete.primary,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppPallete.dropShadow,
                    blurRadius: 4,
                  ),
                ],
              ),
              child: const Icon(Icons.bookmark_border,
                  size: 16, color: AppPallete.bodyText),
            ),
          ),
        ),

        // Quantity controls
        if (quantityControl != null)
          Positioned(
            bottom: context.spacing12,
            right: context.spacing16,
            child: quantityControl!,
          ),
      ],
    );
  }
}