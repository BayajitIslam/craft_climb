import 'package:craft_climb/core/constants/app_images.dart';
import 'package:craft_climb/core/theme/app_pallete.dart';
import 'package:craft_climb/core/theme/app_text_style.dart';
import 'package:craft_climb/core/utils/screen_size.dart';
import 'package:flutter/material.dart';

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({super.key});

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  int _selectedTab = 0; // 0 = Current, 1 = Previous

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
                SizedBox(height: context.spacing12),
                _buildTabs(context),
                SizedBox(height: context.spacing16),
                Expanded(child: _buildOrderList(context)),
                _buildCloseButton(context),
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
            'My Orders',
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
                size: 18, color: AppPallete.extraAsh),
          ),
        ],
      ),
    );
  }

  Widget _buildTabs(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.spacing16),
      child: Container(
        height: 38,
        decoration: BoxDecoration(
          color: AppPallete.secondary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            _tabItem(context, 'Current', 0),
            _tabItem(context, 'Previous', 1),
          ],
        ),
      ),
    );
  }

  Widget _tabItem(BuildContext context, String label, int index) {
    final isSelected = _selectedTab == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _selectedTab = index),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            color: isSelected ? AppPallete.accent : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: AppTextStyle.s14w4i(
              color: isSelected ? AppPallete.primary : AppPallete.extraAsh,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOrderList(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: context.spacing16),
      children: [
        _OrderCard(
          orderId: 'Est. Delivery: 3/4/2024',
          itemName: 'Pepperoni Cheese Pizza x1',
          totalPrice: '\$34.82',
          status: 'Out for delivery',
          currentStep: 2,
          image: AppImages.drill_machine1,
          profileImage: AppImages.profile_image1,
        ),
      ],
    );
  }

  Widget _buildCloseButton(BuildContext context) {
    return Container(
      color: AppPallete.primary,
      padding: EdgeInsets.symmetric(
          horizontal: context.spacing16, vertical: context.spacing12),
      child: ElevatedButton(
        onPressed: () => Navigator.pop(context),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppPallete.accent,
          minimumSize: const Size.fromHeight(48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 0,
        ),
        child: Text(
          'Close',
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

class _OrderCard extends StatelessWidget {
  final String orderId;
  final String itemName;
  final String totalPrice;
  final String status;
  final int currentStep; // 0=placed, 1=processing, 2=on_going, 3=delivered
  final String image;
  final String profileImage;

  const _OrderCard({
    required this.orderId,
    required this.itemName,
    required this.totalPrice,
    required this.status,
    required this.currentStep,
    required this.image,
    required this.profileImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(context.spacing12),
      decoration: BoxDecoration(
        color: AppPallete.primary,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: AppPallete.dropShadow,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Order info row
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      image,
                      width: 64,
                      height: 64,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: context.spacing12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Status badge
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                            color: AppPallete.accentFB,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            status,
                            style: AppTextStyle.s14w4i(
                              color: AppPallete.accent,
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          orderId,
                          style: AppTextStyle.s14w4i(
                            color: AppPallete.subTextColor,
                            fontSize: 11,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          itemName,
                          style: AppTextStyle.s14w4i(
                            color: AppPallete.bodyText,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'Total price: $totalPrice',
                          style: AppTextStyle.s14w4i(
                            color: AppPallete.subTextColor,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: context.spacing16),

            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Order info row
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      image,
                      width: 34,
                      height: 34,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: context.spacing12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Status badge
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                            color: AppPallete.accentFB,
                            borderRadius: BorderRadius.circular(20),
                          ),

                        ),

                        Text(
                          'Total price paid: $totalPrice',
                          style: AppTextStyle.s14w4i(
                            color: AppPallete.subTextColor,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: context.spacing16),

              // Order Status Tracker
              _OrderStatusTracker(currentStep: currentStep),
            ],
          ),
        ],
      ),
    );
  }
}

class _OrderStatusTracker extends StatelessWidget {
  final int currentStep;

  const _OrderStatusTracker({required this.currentStep});

  static const List<String> _steps = [
    'Order\nPlace',
    'Processing',
    'On Going',
    'Delivered',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Progress line with dots
        Row(
          children: List.generate(_steps.length * 2 - 1, (i) {
            if (i.isOdd) {
              // Connector line
              final stepIndex = i ~/ 2;
              final isCompleted = stepIndex < currentStep;
              return Expanded(
                child: Container(
                  height: 3,
                  decoration: BoxDecoration(
                    color: isCompleted
                        ? AppPallete.accent
                        : AppPallete.secondary,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              );
            } else {
              // Step dot
              final stepIndex = i ~/ 2;
              final isCompleted = stepIndex <= currentStep;
              return Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: isCompleted
                      ? AppPallete.accent
                      : AppPallete.secondary,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  _stepIcon(stepIndex),
                  size: 14,
                  color: isCompleted
                      ? AppPallete.primary
                      : AppPallete.extraAsh,
                ),
              );
            }
          }),
        ),

        SizedBox(height: 6),

        // Step labels
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(_steps.length, (i) {
            final isCompleted = i <= currentStep;
            return SizedBox(
              width: 56,
              child: Text(
                _steps[i],
                textAlign: TextAlign.center,
                style: AppTextStyle.s14w4i(
                  color: isCompleted
                      ? AppPallete.accent
                      : AppPallete.extraAsh,
                  fontSize: 10,
                  fontWeight: isCompleted
                      ? FontWeight.w600
                      : FontWeight.w400,
                ),
              ),
            );
          }),
        ),
      ],
    );
  }

  IconData _stepIcon(int index) {
    switch (index) {
      case 0:
        return Icons.receipt_long_outlined;
      case 1:
        return Icons.sync;
      case 2:
        return Icons.local_shipping_outlined;
      case 3:
        return Icons.check_circle_outline;
      default:
        return Icons.circle_outlined;
    }
  }
}