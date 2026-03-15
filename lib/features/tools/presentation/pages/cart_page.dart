import 'package:craft_climb/core/theme/app_pallete.dart';
import 'package:craft_climb/core/theme/app_text_style.dart';
import 'package:craft_climb/core/utils/app_bg.dart';
import 'package:craft_climb/core/utils/screen_size.dart';
import 'package:craft_climb/core/widgets/primary_button.dart';
import 'package:craft_climb/core/widgets/secand_app_bar.dart';
import 'package:craft_climb/features/tools/presentation/pages/check_out_page.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  static Route route() => MaterialPageRoute(builder: (_) => const CartPage());
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final List<Map<String, dynamic>> _cartItems = [
    {
      'name': 'Drill Machine',
      'price': 25.00,
      'image':
          'https://images.unsplash.com/photo-1504148455328-c376907d081c?w=400',
      'qty': 1,
    },
    {
      'name': 'Hammer Red with Pin',
      'price': 28.00,
      'image':
          'https://images.unsplash.com/photo-1585771724684-38269d6639fd?w=400',
      'qty': 2,
    },
    {
      'name': 'Rangs',
      'price': 28.00,
      'image':
          'https://images.unsplash.com/photo-1572981779307-38b8cabb2407?w=400',
      'qty': 2,
    },
    {
      'name': '12 Pics Tools Package',
      'price': 29.00,
      'image':
          'https://images.unsplash.com/photo-1530124566582-a618bc2615dc?w=400',
      'qty': 3,
    },
  ];

  // total price calculated from all items
  double get _totalPrice =>
      _cartItems.fold(0, (sum, item) => sum + (item['price'] * item['qty']));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBg(
        child: SafeArea(
          top: false,
          child: Column(
            children: [
              // app bar
              SecandAppBar(title: 'Cart (${_cartItems.length})'),
              // cart items list
              Expanded(child: _buildCartList(context)),

              // total price row
              _buildTotalRow(context),

              // checkout button
              _buildBottomButton(context),
            ],
          ),
        ),
      ),
    );
  }

  // scrollable list of cart item tiles
  Widget _buildCartList(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(
        horizontal: context.spacing16,
        vertical: context.spacing8,
      ),
      itemCount: _cartItems.length,
      separatorBuilder: (_, _) => const SizedBox(height: 12),
      itemBuilder: (_, index) {
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

  // total price summary row above checkout button
  Widget _buildTotalRow(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.spacing16,
        vertical: context.spacing12,
      ),
      decoration: BoxDecoration(
        color: AppPallete.primary,
        border: Border(top: BorderSide(color: Colors.grey.shade200)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Total',
            style: AppTextStyle.s14w4i(fontWeight: FontWeight.w600),
          ),
          Text(
            '\$${_totalPrice.toStringAsFixed(2)}',
            style: AppTextStyle.s16w4i(
              color: AppPallete.accent,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  // checkout sticky button at bottom
  Widget _buildBottomButton(BuildContext context) {
    return Container(
      color: AppPallete.primary,
      padding: EdgeInsets.symmetric(
        horizontal: context.spacing16,
        vertical: context.spacing12,
      ),
      child: PrimaryButton(
        buttonName: 'Checkout',
        onPressed: () => Navigator.push(context, CheckoutPage.route()),
      ),
    );
  }
}

// single cart item tile with quantity controls
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
      height: 80,
      padding: EdgeInsets.only(
        left: context.spacing4,
        right: context.spacing12,
        top: context.spacing4,
        bottom: context.spacing4,
      ),
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
          // product image
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              item['image'],
              width: 100,
              height: 70,
              fit: BoxFit.cover,
              errorBuilder: (_, _, _) => Container(
                width: 100,
                height: 70,
                color: AppPallete.accent10,
                child: Icon(Icons.image_outlined, color: AppPallete.accent),
              ),
            ),
          ),
          SizedBox(width: context.spacing12),

          // product name and price
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  item['name'],
                  style: AppTextStyle.s14w4i(
                    fontSize: 13,
                    color: AppPallete.extraAsh,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                Text(
                  '\$${item['price'].toStringAsFixed(2)}',
                  style: AppTextStyle.s14w4i(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),

          // quantity increase and decrease controls
          Row(
            children: [
              _QtyButton(icon: Icons.remove, onTap: onDecrease),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  '${item['qty']}',
                  style: AppTextStyle.s14w4i(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              _QtyButton(icon: Icons.add, onTap: onIncrease),
            ],
          ),
        ],
      ),
    );
  }
}

// quantity control button used for increase and decrease
class _QtyButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _QtyButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 26,
        height: 26,
        decoration: BoxDecoration(
          color: AppPallete.accent,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Icon(icon, color: Colors.white, size: 14),
      ),
    );
  }
}
