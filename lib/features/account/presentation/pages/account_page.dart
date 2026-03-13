import 'package:craft_climb/core/utils/app_bg.dart';
import 'package:craft_climb/core/utils/screen_size.dart';
import 'package:craft_climb/core/widgets/secand_app_bar.dart';
import 'package:craft_climb/features/account/presentation/pages/faqs_page.dart';
import 'package:craft_climb/features/account/presentation/pages/privacy_policy_page.dart';
import 'package:craft_climb/features/account/presentation/pages/terms_and_conditions_page.dart';
import 'package:craft_climb/features/account/presentation/widgets/account_menu_section.dart';
import 'package:craft_climb/features/account/presentation/widgets/account_premium_banner.dart';
import 'package:craft_climb/features/account/presentation/widgets/account_progress_card.dart';
import 'package:craft_climb/features/account/presentation/widgets/account_user_card.dart';
import 'package:craft_climb/features/auth/presentation/pages/change_password_page.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  final String userName;
  final String userEmail;
  final String? userImage;
  final int careerProgress;
  final bool disableProgress;
  final List<AccountMenuItem> profileItems;

  const AccountPage({
    super.key,
    required this.userName,
    required this.userEmail,
    required this.profileItems,
    this.userImage,
    this.careerProgress = 80,
    this.disableProgress = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBg(
        child: Column(
          children: [
            // ── FIXED AppBar ──
            SecandAppBar(title: 'Account'),

            // ── SCROLLABLE Content ──
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: context.spacing16,
                  vertical: context.spacing12,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AccountUserCard(
                      name: userName,
                      email: userEmail,
                      imageUrl: userImage,
                      onTap: () {},
                    ),
                    const SizedBox(height: 10),

                    AccountPremiumBanner(onTap: () {}),
                    const SizedBox(height: 10),

                    disableProgress
                        ? SizedBox.shrink()
                        : AccountProgressCard(
                            progress: careerProgress,
                            onTap: () {},
                          ),
                    disableProgress
                        ? SizedBox.shrink()
                        : const SizedBox(height: 20),

                    AccountMenuSection(
                      sectionTitle: 'Profile',
                      items: profileItems,
                    ),
                    const SizedBox(height: 16),

                    AccountMenuSection(
                      sectionTitle: 'Account',
                      items: [
                        AccountMenuItem(
                          title: 'Change Password',
                          onTap: () {
                            Navigator.push(context, ChangePasswordPage.route());
                          },
                        ),
                        AccountMenuItem(title: 'Delete Account', onTap: () {}),
                      ],
                    ),
                    const SizedBox(height: 16),

                    AccountMenuSection(
                      sectionTitle: 'More',
                      items: [
                        AccountMenuItem(
                          title: 'Terms & Conditions',
                          onTap: () {
                            Navigator.push(
                              context,
                              TermsAndConditionsPage.route(),
                            );
                          },
                        ),
                        AccountMenuItem(
                          title: 'Privacy Policy',
                          onTap: () {
                            Navigator.push(context, PrivacyPolicyPage.route());
                          },
                        ),
                        AccountMenuItem(
                          title: "Faq's",
                          onTap: () {
                            Navigator.push(context, FaqsPage.route());
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
