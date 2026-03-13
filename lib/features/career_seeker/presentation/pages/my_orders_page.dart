import 'package:craft_climb/core/theme/app_pallete.dart';
import 'package:craft_climb/core/theme/app_text_style.dart';
import 'package:craft_climb/core/utils/app_bg.dart';
import 'package:craft_climb/core/widgets/secand_app_bar.dart';
import 'package:flutter/material.dart';

class MyOrdersPage extends StatelessWidget {
  static Route route() =>
      MaterialPageRoute(builder: (_) => const MyOrdersPage());
  const MyOrdersPage({super.key});

  final List<Map<String, String>> _orders = const [
    {
      'title': '12 Pics Tools Package',
      'deliveredOn': '26 October',
      'orderSummary': 'Pudding x1',
      'totalPrice': '\$16.98',
      'image':
          'https://images.unsplash.com/photo-1565958011703-44f9829ba187?w=200',
    },
    {
      'title': '12 Pics Tools Package',
      'deliveredOn': '26 October',
      'orderSummary': 'Pudding x1',
      'totalPrice': '\$16.98',
      'image':
          'https://images.unsplash.com/photo-1565958011703-44f9829ba187?w=200',
    },
    {
      'title': '12 Pics Tools Package',
      'deliveredOn': '26 October',
      'orderSummary': 'Pudding x1',
      'totalPrice': '\$16.98',
      'image':
          'https://images.unsplash.com/photo-1565958011703-44f9829ba187?w=200',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBg(
        child: Column(
          children: [
            SecandAppBar(title: 'My Orders'),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                itemCount: _orders.length,
                itemBuilder: (_, index) => _OrderCard(
                  title: _orders[index]['title']!,
                  deliveredOn: _orders[index]['deliveredOn']!,
                  orderSummary: _orders[index]['orderSummary']!,
                  totalPrice: _orders[index]['totalPrice']!,
                  imageUrl: _orders[index]['image']!,
                  onCancel: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Order Card ──
class _OrderCard extends StatelessWidget {
  final String title;
  final String deliveredOn;
  final String orderSummary;
  final String totalPrice;
  final String imageUrl;
  final VoidCallback onCancel;

  const _OrderCard({
    required this.title,
    required this.deliveredOn,
    required this.orderSummary,
    required this.totalPrice,
    required this.imageUrl,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppPallete.border),
        boxShadow: [
          BoxShadow(
            color: const Color(0x142E048E),
            blurRadius: 21,
            offset: const Offset(0, 11),
          ),
        ],
      ),
      child: Column(
        children: [
          // ── Top Row ──
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Image ──
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  imageUrl,
                  height: 96,
                  width: 84,
                  fit: BoxFit.cover,
                  errorBuilder: (_, _, _) => Container(
                    height: 96,
                    width: 84,
                    color: AppPallete.accent10,
                    child: Icon(Icons.image_outlined, color: AppPallete.accent),
                  ),
                ),
              ),
              const SizedBox(width: 12),

              // ── Info ──
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(
                      title,
                      style: AppTextStyle.s14w4i(
                        fontWeight: FontWeight.w700,
                        color: AppPallete.black,
                      ),
                    ),
                    const SizedBox(height: 6),

                    // Delivered on
                    _OrderInfoRow(label: 'Delivered on', value: deliveredOn),
                    const SizedBox(height: 3),

                    // Order summary
                    _OrderInfoRow(label: 'Order summary', value: orderSummary),
                    const SizedBox(height: 3),

                    // Total price
                    _OrderInfoRow(label: 'Total price paid', value: totalPrice),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // ── Cancel Button ──
          GestureDetector(
            onTap: onCancel,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppPallete.danger),
              ),
              child: Center(
                child: Text(
                  'Cancel Order',
                  style: AppTextStyle.s14w4i(
                    color: AppPallete.danger,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Order Info Row ──
class _OrderInfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _OrderInfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$label  ',
          style: AppTextStyle.s12w4i(color: AppPallete.extraAsh),
        ),
        Text(
          value,
          style: AppTextStyle.s12w4i(
            fontWeight: FontWeight.w700,
            color: AppPallete.black,
          ),
        ),
      ],
    );
  }
}
