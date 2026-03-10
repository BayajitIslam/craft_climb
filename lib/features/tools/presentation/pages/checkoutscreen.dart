import 'package:craft_climb/core/constants/app_images.dart';
import 'package:craft_climb/core/theme/app_pallete.dart';
import 'package:craft_climb/core/theme/app_text_style.dart';
import 'package:craft_climb/core/utils/screen_size.dart';
import 'package:flutter/material.dart';

import 'ordersscreen.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  final List<Map<String, dynamic>> _items = const [
    {'name': 'Drill Machine', 'price': 25.00, 'qty': 1, 'image': AppImages.drill_machine1},
    {'name': 'Drill Machine', 'price': 28.00, 'qty': 2, 'image': AppImages.hammer3},
    {'name': 'Drill Machine', 'price': 28.00, 'qty': 2, 'image': AppImages.rangs4},
    {'name': 'Drill Machine', 'price': 29.00, 'qty': 3, 'image': AppImages.picstools5},
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
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(
                        horizontal: context.spacing16,
                        vertical: context.spacing8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildItemList(context),
                        SizedBox(height: context.spacing16),
                        _buildDeliverTo(context),
                        SizedBox(height: context.spacing16),
                        _buildPriceSummary(context),
                      ],
                    ),
                  ),
                ),
                _buildSubmitButton(context),
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
            'Checkout',
            style: AppTextStyle.s24w7i(
                color: AppPallete.bodyText, fontSize: 18),
          ),
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: AppPallete.primary,
              shape: BoxShape.circle,
              border: Border.all(color: AppPallete.border),
            ),
            child: const Icon(Icons.notifications_none,
                size: 16, color: AppPallete.extraAsh),
          ),
        ],
      ),
    );
  }

  Widget _buildItemList(BuildContext context) {
    return Column(
      children: _items
          .map((item) => _CheckoutItemTile(item: item))
          .toList(),
    );
  }

  Widget _buildDeliverTo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Deliver to:',
          style: AppTextStyle.s14w4i(
            color: AppPallete.bodyText,
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: context.spacing8),
        Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: context.spacing12,
              vertical: context.spacing12,
            ),
            decoration: BoxDecoration(
              color: AppPallete.primary,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppPallete.border),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Address 1",
                  style: AppTextStyle.s14w4i(
                  color: AppPallete.bodyText,
                  fontSize: 13,
                ),),
                SizedBox(height: 8,),
                Row(
                  children: [
                    Icon(Icons.location_on_outlined,
                        size: 18, color: AppPallete.extraAsh),
                    SizedBox(width: context.spacing8),
                    Expanded(
                      child: Text(
                        'Home - 123 Main St, Apt 4B',
                        style: AppTextStyle.s14w4i(
                          color: AppPallete.bodyText,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    Icon(Icons.chevron_right,
                        size: 18, color: AppPallete.extraAsh),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

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
          _priceRow(context, 'Subtotal', '\$6.37'),
          SizedBox(height: context.spacing8),
          _priceRow(context, 'Delivery Charges', '+\$9.99'),
          SizedBox(height: context.spacing12),
          Divider(color: AppPallete.stroke),
          SizedBox(height: context.spacing8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                style: AppTextStyle.s14w4i(
                  color: AppPallete.bodyText,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                '\$60.28',
                style: AppTextStyle.s16w4i(
                  color: AppPallete.bodyText,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _priceRow(BuildContext context, String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: AppTextStyle.s14w4i(
            color: AppPallete.subTextColor,
            fontSize: 13,
          ),
        ),
        Text(
          value,
          style: AppTextStyle.s14w4i(
            color: AppPallete.bodyText,
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _buildSubmitButton(BuildContext context) {
    return Container(
      color: AppPallete.primary,
      padding: EdgeInsets.symmetric(
          horizontal: context.spacing16, vertical: context.spacing12),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const MyOrdersScreen()),
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
          'Submit',
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
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              item['image'],
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: context.spacing12),
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
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          // Qty display
          Row(
            children: [
              Container(
                width: 26,
                height: 26,
                decoration: BoxDecoration(
                  color: AppPallete.extraAsh,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Icon(Icons.remove,
                    color: AppPallete.primary, size: 14),
              ),
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
              Container(
                width: 26,
                height: 26,
                decoration: BoxDecoration(
                  color: AppPallete.extraAsh,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Icon(Icons.add,
                    color: AppPallete.primary, size: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }
}