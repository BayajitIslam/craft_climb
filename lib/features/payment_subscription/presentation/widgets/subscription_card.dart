import 'package:craft_climb/core/theme/app_pallete.dart';
import 'package:craft_climb/core/theme/app_text_style.dart';
import 'package:craft_climb/features/payment_subscription/presentation/pages/subscription_page.dart';
import 'package:flutter/material.dart';

class SubscriptionCard extends StatelessWidget {
  final SubscriptionPlan plan;
  final bool isSelected;
  final VoidCallback onTap;
  final bool isCurrentPlan;
  final bool showRecommended;

  const SubscriptionCard({
    super.key,
    required this.plan,
    required this.isSelected,
    required this.onTap,
    this.isCurrentPlan = false,
    this.showRecommended = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppPallete.accentFB,
          borderRadius: BorderRadius.circular(16),
          border: isSelected
              ? Border.all(color: AppPallete.accent, width: 4)
              : null,
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: AppPallete.dropShadow,
                    blurRadius: 12,
                    offset: Offset(0, 4),
                  ),
                ]
              : [],
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // Main Content
            Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Icon
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: AppPallete.primary,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: AppPallete.dropShadow,
                          blurRadius: 6,
                          offset: Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(plan.icon, style: TextStyle(fontSize: 28)),
                    ),
                  ),

                  SizedBox(width: 16),

                  // Content
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title and Price
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              plan.title,
                              style: AppTextStyle.s16w4i(
                                fontWeight: FontWeight.w700,
                                color: AppPallete.bodyText,
                              ),
                            ),
                            Text(
                              plan.displayPrice,
                              style: AppTextStyle.s16w4i(
                                fontWeight: FontWeight.w700,
                                color: AppPallete.accent,
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 8),

                        // Description
                        Text(
                          plan.description,
                          style: AppTextStyle.s14w4i(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: AppPallete.subTextColor,
                          ),
                        ),

                        SizedBox(height: 2),

                        // Daily Cost (if available)
                        if (plan.dailyCost != null) ...[
                          SizedBox(height: 2),
                          Text(
                            plan.dailyCost!,
                            style: AppTextStyle.s14w4i(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: AppPallete.subTextColor,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Current Plan Badge (Priority: Shows when user has active subscription)
            if (isCurrentPlan)
              Positioned(
                top: -10,
                right: 8,
                child: Container(
                  decoration: BoxDecoration(
                    // gradient: AppPallete.primary,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: AppPallete.accent10,
                        blurRadius: 8,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  child: Text(
                    'Your current plan',
                    style: AppTextStyle.s14w4i(
                      color: AppPallete.primary,
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),

            // Recommended Badge (Only shows for first time users)
            if (!isCurrentPlan && plan.isBestValue && showRecommended)
              Positioned(
                top: -10,
                right: 8,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppPallete.primary,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: AppPallete.accent10,
                        blurRadius: 10,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  child: Text(
                    'Save 30%',
                    style: AppTextStyle.s14w4i(
                      color: AppPallete.accent,
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
