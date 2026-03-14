import 'package:craft_climb/core/constants/app_images.dart';
import 'package:craft_climb/core/theme/app_pallete.dart';
import 'package:craft_climb/core/theme/app_text_style.dart';
import 'package:craft_climb/core/utils/screen_size.dart';
import 'package:flutter/material.dart';

import 'checkoutscreen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<Map<String, dynamic>> _cartItems = [
    {
      'name': 'Drill Machine',
      'price': 25.00,
      'image': AppImages.drill_machine1,
      'qty': 1,
    },
    {
      'name': 'Drill Machine',
      'price': 28.00,
      'image': AppImages.hammer3,
      'qty': 2,
    },
    {
      'name': 'Drill Machine',
      'price': 28.00,
      'image': AppImages.rangs4,
      'qty': 2,
    },
    {
      'name': 'Drill Machine',
      'price': 29.00,
      'image': AppImages.picstools5,
      'qty': 3,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(AppImages.appBackground, fit: BoxFit.cover),
          ),
          SafeArea(
            child: Column(
              children: [
                _buildAppBar(context),
                Expanded(child: _buildCartList(context)),
                _buildBottomButton(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: context.spacing16, vertical: context.spacing8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: AppPallete.primary,
                shape: BoxShape.circle,
                border: Border.all(color: AppPallete.border),
              ),
              child: const Icon(Icons.arrow_back_ios_new,
                  size: 14, color: AppPallete.bodyText),
            ),
          ),
          Text(
            'Cart(${_cartItems.length})',
            style: AppTextStyle.s24w7i(
                color: AppPallete.bodyText, fontSize: 18),
          ),
          Positioned(
            top: context.spacing12,
            right: context.spacing16,
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
              child: const Icon(Icons.notifications_none,
                  size: 16, color: AppPallete.bodyText),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCartList(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(
          horizontal: context.spacing16, vertical: context.spacing8),
      itemCount: _cartItems.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        return _CartItemTile(
          item: _cartItems[index],
          onIncrease: () => setState(() => _cartItems[index]['qty']++),
          onDecrease: () {
            if (_cartItems[index]['qty'] > 1) {
              setState(() => _cartItems[index]['qty']--);
            } else {
              setState(() => _cartItems.removeAt(index));
            }
          },
        );
      },
    );
  }

  Widget _buildBottomButton(BuildContext context) {
    return Container(
      color: AppPallete.primary,
      padding: EdgeInsets.symmetric(
          horizontal: context.spacing16, vertical: context.spacing12),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const CheckoutScreen()),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppPallete.accent,
          minimumSize: const Size.fromHeight(48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 0,
        ),
        child: Text(
          'Next',
          style: AppTextStyle.s16w4i(
            color: AppPallete.primary,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class _CartItemTile extends StatelessWidget {
  final Map<String, dynamic> item;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;

  const _CartItemTile({
    required this.item,
    required this.onIncrease,
    required this.onDecrease,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(context.spacing8),
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
      child: Row(
        children: [
          // Product image
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              item['image'],
              width: 70,
              height: 70,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: context.spacing12),

          // Name & Price
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item['name'],
                  style: AppTextStyle.s14w4i(
                    color: AppPallete.bodyText,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  '\$${item['price'].toStringAsFixed(2)}',
                  style: AppTextStyle.s14w4i(
                    color: AppPallete.bodyText,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),

          // Quantity control
          Row(
            children: [
              _qtyBtn(Icons.remove, onDecrease),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  '${item['qty']}',
                  style: AppTextStyle.s14w4i(
                    color: AppPallete.bodyText,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              _qtyBtn(Icons.add, onIncrease),
            ],
          ),
        ],
      ),
    );
  }

  Widget _qtyBtn(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 26,
        height: 26,
        decoration: BoxDecoration(
          color: AppPallete.extraAsh,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Icon(icon, color: AppPallete.primary, size: 14),
      ),
    );
  }
}