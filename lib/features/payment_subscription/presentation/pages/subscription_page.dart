import 'package:craft_climb/core/constants/app_images.dart';
import 'package:craft_climb/core/local_storage/local_storage.dart';
import 'package:craft_climb/core/router/role_router.dart';
import 'package:craft_climb/core/theme/app_pallete.dart';
import 'package:craft_climb/core/theme/app_text_style.dart';
import 'package:craft_climb/core/utils/app_bg.dart';
import 'package:craft_climb/core/utils/screen_size.dart';
import 'package:craft_climb/core/widgets/primary_button.dart';
import 'package:craft_climb/features/payment_subscription/presentation/widgets/description_row.dart';
import 'package:craft_climb/features/payment_subscription/presentation/widgets/subscription_card.dart';
import 'package:flutter/material.dart';

class SubscriptionPage extends StatefulWidget {
  static Route route() {
    return MaterialPageRoute(builder: (context) => SubscriptionPage());
  }

  const SubscriptionPage({super.key});

  @override
  State<SubscriptionPage> createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<SubscriptionPage> {
  final List<SubscriptionPlan> plans = [
    SubscriptionPlan(
      id: 'monthly',
      title: 'Monthly',
      priceUSD: '4.99',
      priceEUR: '4.99',
      description: 'Perfect to start using the app and discover your balance',
      icon: '⭐',
    ),
    SubscriptionPlan(
      id: 'quarterly',
      title: 'Quarterly',
      priceUSD: '13.99',
      priceEUR: '13.99',
      description: 'Stay consistent and save while building new habits',
      icon: '🏆',
    ),
    SubscriptionPlan(
      id: 'annual',
      title: 'Annual',
      priceUSD: '49.99',
      priceEUR: '49.99',
      description: 'For those serious about long-term results and balance',
      icon: '👑',
      isBestValue: true,
    ),
  ];

  List<DescriptionRow> descriptionText = [
    DescriptionRow(text: 'Advanced AI Insights'),
    DescriptionRow(text: 'Unlimited Access to All Tools'),
    DescriptionRow(text: 'Detailed Reports & Export Options'),
    DescriptionRow(text: 'Priority Support & Faster Responses'),
    DescriptionRow(text: 'Ad-Free, Distraction-Free Experience'),
  ];

  var selectedPlanId = 'monthly';

  void selectPlan(String planId) {
    setState(() {
      selectedPlanId = planId;
    });
  }

  bool isSelected(String planId) {
    return selectedPlanId == planId;
  }

  @override
  Widget build(BuildContext context) {
    // Responsive helpers
    final screenHeight = MediaQuery.of(context).size.height;
    final isSmallScreen = screenHeight < 700;

    return Scaffold(
      body: AppBg(
        child: SafeArea(
          child: Column(
            children: [
              // ── Scrollable content ──────────────────────────────
              Expanded(
                child: SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: context.spacing24,
                    ),
                    child: Column(
                      children: [
                        //<------- Skip / Close button ------->
                        Align(
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
                            onTap: () {
                              final role = LocalStorage.userRole;
                              RoleRouter.goToHome(context, role);
                            },
                            child: Container(
                              height: 48,
                              width: 48,
                              decoration: BoxDecoration(
                                color: AppPallete.transparent,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: AppPallete.white10,
                                    blurRadius: 14,
                                    offset: const Offset(0, 0),
                                  ),
                                ],
                                border: Border.symmetric(
                                  vertical: BorderSide(
                                    color: AppPallete.white30,
                                    width: 3,
                                  ),
                                ),
                              ),
                              child: Icon(
                                Icons.close,
                                color: AppPallete.bodyText,
                                size: 20,
                              ),
                            ),
                          ),
                        ),

                        //<------- Brand Logo ------->
                        Image.asset(
                          AppImages.appBennar,
                          // Shrink logo on small screens
                          width: isSmallScreen ? 180 : 256,
                          fit: BoxFit.cover,
                        ),

                        //<------- Description list ------->
                        SizedBox(height: context.spacing12),
                        Column(
                          spacing: isSmallScreen
                              ? context.spacing8
                              : context.spacing12,
                          children: descriptionText
                              .map((e) => DescriptionRow(text: e.text))
                              .toList(),
                        ),

                        SizedBox(
                          height: isSmallScreen
                              ? context.spacing24
                              : context.spacing32 * 2,
                        ),

                        //<------- Subscription Cards ------->
                        Column(
                          spacing: isSmallScreen
                              ? context.spacing12
                              : context.spacing24,
                          children: plans
                              .map(
                                (plan) => SubscriptionCard(
                                  plan: plan,
                                  isSelected: isSelected(plan.id),
                                  onTap: () => selectPlan(plan.id),
                                ),
                              )
                              .toList(),
                        ),

                        // Bottom padding so content clears the sticky footer
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ),
              ),

              // ── Sticky bottom section (never overlaps) ──────────
              Container(
                padding: EdgeInsets.fromLTRB(
                  context.spacing24,
                  12,
                  context.spacing24,
                  context.spacing16,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    //<------- Subscribe Button ------->
                    PrimaryButton(
                      borderRadius: 33,
                      onPressed: () {
                        final role = LocalStorage.userRole;
                        RoleRouter.goToHome(context, role);
                      },
                      buttonName: 'Subscribe',
                    ),

                    SizedBox(height: context.spacing4),
                    Text(
                      'Enjoy 3 days free, than \$4.99/month',
                      style: AppTextStyle.s14w4i(color: AppPallete.bodyText),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Subscription Plan model ──────────────────────────────────────────────────

class SubscriptionPlan {
  final String id;
  final String title;
  final String priceUSD;
  final String priceEUR;
  final String description;
  final String icon;
  final bool isBestValue;
  final String? dailyCost;

  SubscriptionPlan({
    required this.id,
    required this.title,
    required this.priceUSD,
    required this.priceEUR,
    required this.description,
    required this.icon,
    this.isBestValue = false,
    this.dailyCost,
  });

  String get displayPrice => '\$$priceUSD';
}
