import 'package:craft_climb/core/theme/app_pallete.dart';
import 'package:craft_climb/core/theme/app_text_style.dart';
import 'package:craft_climb/core/utils/app_bg.dart';
import 'package:craft_climb/core/utils/screen_size.dart';
import 'package:craft_climb/core/widgets/primary_button.dart';
import 'package:craft_climb/core/widgets/secand_app_bar.dart';
import 'package:craft_climb/features/career_seeker/presentation/pages/my_orders_page.dart';
import 'package:flutter/material.dart';

class CheckoutPage extends StatelessWidget {
  static Route route() =>
      MaterialPageRoute(builder: (_) => const CheckoutPage());
  const CheckoutPage({super.key});

  final List<Map<String, dynamic>> _items = const [
    {
      'name': 'Drill Machine',
      'price': 25.00,
      'qty': 1,
      'image':
          'https://images.unsplash.com/photo-1504148455328-c376907d081c?w=400',
    },
    {
      'name': 'Hammer Red with Pin',
      'price': 28.00,
      'qty': 2,
      'image':
          'https://images.unsplash.com/photo-1585771724684-38269d6639fd?w=400',
    },
    {
      'name': 'Rangs',
      'price': 28.00,
      'qty': 2,
      'image':
          'https://images.unsplash.com/photo-1572981779307-38b8cabb2407?w=400',
    },
    {
      'name': '12 Pics Tools Package',
      'price': 29.00,
      'qty': 3,
      'image':
          'https://images.unsplash.com/photo-1530124566582-a618bc2615dc?w=400',
    },
    {
      'name': 'Drill Machine',
      'price': 25.00,
      'qty': 1,
      'image':
          'https://images.unsplash.com/photo-1504148455328-c376907d081c?w=400',
    },
    {
      'name': 'Hammer Red with Pin',
      'price': 28.00,
      'qty': 2,
      'image':
          'https://images.unsplash.com/photo-1585771724684-38269d6639fd?w=400',
    },
    {
      'name': 'Rangs',
      'price': 28.00,
      'qty': 2,
      'image':
          'https://images.unsplash.com/photo-1572981779307-38b8cabb2407?w=400',
    },
    {
      'name': '12 Pics Tools Package',
      'price': 29.00,
      'qty': 3,
      'image':
          'https://images.unsplash.com/photo-1530124566582-a618bc2615dc?w=400',
    },
  ];

  // calculate subtotal from items
  double get _subtotal =>
      _items.fold(0, (sum, item) => sum + (item['price'] * item['qty']));

  double get _deliveryCharge => 9.99;
  double get _total => _subtotal + _deliveryCharge;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBg(
        child: SafeArea(
          top: false,
          child: Column(
            children: [
              // app bar
              SecandAppBar(title: 'Checkout'),
              // checkout form
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.spacing16,
                    vertical: context.spacing8,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // order items list
                      _buildItemList(),
                      SizedBox(height: context.spacing16),

                      // delivery address section
                      _buildDeliverTo(context),
                      SizedBox(height: context.spacing16),

                      // price breakdown summary
                      _buildPriceSummary(context),
                      SizedBox(height: context.spacing8),
                    ],
                  ),
                ),
              ),

              // submit order button
              _buildSubmitButton(context),
            ],
          ),
        ),
      ),
    );
  }

  // list of checkout item tiles
  Widget _buildItemList() {
    return Column(
      children: _items.map((item) => _CheckoutItemTile(item: item)).toList(),
    );
  }

  // delivery address card
  Widget _buildDeliverTo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Deliver to:',
          style: AppTextStyle.s14w4i(fontWeight: FontWeight.w600),
        ),
        SizedBox(height: context.spacing8),
        Container(
          padding: EdgeInsets.all(context.spacing12),
          decoration: BoxDecoration(
            color: AppPallete.primary,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade200),
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
              Text(
                'Address 1',
                style: AppTextStyle.s14w4i(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    size: 18,
                    color: Colors.grey.shade400,
                  ),
                  SizedBox(width: context.spacing8),
                  Expanded(
                    child: Text(
                      'Home - 123 Main St, Apt 4B',
                      style: AppTextStyle.s14w4i(
                        color: Colors.grey.shade600,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.chevron_right,
                    size: 18,
                    color: Colors.grey.shade400,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  // subtotal, delivery charge, and total summary card
  Widget _buildPriceSummary(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(context.spacing16),
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
        children: [
          _PriceRow(
            label: 'Subtotal',
            value: '\$${_subtotal.toStringAsFixed(2)}',
          ),
          SizedBox(height: context.spacing8),
          _PriceRow(
            label: 'Delivery Charges',
            value: '+\$${_deliveryCharge.toStringAsFixed(2)}',
          ),
          SizedBox(height: context.spacing12),
          Divider(color: Colors.grey.shade200),
          SizedBox(height: context.spacing8),

          // total row with bold styling
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                style: AppTextStyle.s14w4i(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                '\$${_total.toStringAsFixed(2)}',
                style: AppTextStyle.s16w4i(
                  color: AppPallete.accent,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // submit order sticky button
  Widget _buildSubmitButton(BuildContext context) {
    return Container(
      color: AppPallete.primary,
      padding: EdgeInsets.symmetric(
        horizontal: context.spacing16,
        vertical: context.spacing12,
      ),
      child: PrimaryButton(
        buttonName: 'Submit Order',
        onPressed: () => Navigator.push(context, MyOrdersPage.route()),
      ),
    );
  }
}

// single item tile shown in checkout list
class _CheckoutItemTile extends StatelessWidget {
  final Map<String, dynamic> item;

  const _CheckoutItemTile({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
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
              children: [
                Text(
                  item['name'],
                  style: AppTextStyle.s14w4i(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '\$${item['price'].toStringAsFixed(2)}',
                  style: AppTextStyle.s14w4i(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),

          // quantity display only — no controls in checkout
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AppPallete.accent10,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              'x${item['qty']}',
              style: AppTextStyle.s12w4i(
                color: AppPallete.accent,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// reusable label and value row for price summary
class _PriceRow extends StatelessWidget {
  final String label;
  final String value;

  const _PriceRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: AppTextStyle.s14w4i(color: Colors.grey.shade500, fontSize: 13),
        ),
        Text(
          value,
          style: AppTextStyle.s14w4i(fontSize: 13, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
