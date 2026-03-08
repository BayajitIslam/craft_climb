import 'package:craft_climb/core/constants/app_images.dart';
import 'package:craft_climb/core/constants/app_strings.dart';
import 'package:craft_climb/core/theme/app_pallete.dart';
import 'package:craft_climb/core/theme/app_text_style.dart';
import 'package:craft_climb/core/utils/app_bg.dart';
import 'package:craft_climb/core/utils/screen_size.dart';
import 'package:craft_climb/core/widgets/primary_button.dart';
import 'package:craft_climb/features/auth/presentation/pages/otp_page.dart';
import 'package:craft_climb/features/auth/presentation/widgets/auth_field.dart';
import 'package:craft_climb/features/auth/presentation/widgets/auth_tab_switcher.dart';
import 'package:craft_climb/features/auth/presentation/widgets/or.dart';
import 'package:craft_climb/features/auth/presentation/widgets/social_button.dart';
import 'package:craft_climb/features/payment_subscription/presentation/pages/subscription_page.dart';
import 'package:flutter/material.dart';

class LoginAndSignupPage extends StatefulWidget {
  //route
  static MaterialPageRoute routeWith({int initialTab = 0}) {
    return MaterialPageRoute(
      builder: (context) => LoginAndSignupPage(initialTab: initialTab),
    );
  }

  final int initialTab;
  const LoginAndSignupPage({super.key, this.initialTab = 0});

  @override
  State<LoginAndSignupPage> createState() => _LoginAndSignupPageState();
}

class _LoginAndSignupPageState extends State<LoginAndSignupPage> {
  // selected tab
  late int selectedTab;

  // controller
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    selectedTab = widget.initialTab;
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBg(
        child: SafeArea(
          maintainBottomViewPadding: true,
          child: Padding(
            padding: EdgeInsets.all(context.spacing24),
            child: Column(
              children: [
                //Bennar
                SizedBox(height: 33),
                Image.asset(AppImages.appBennar, width: 256),

                //login or sign up
                SizedBox(height: context.spacing32),
                AuthTabSwitcher(
                  selectedIndex: selectedTab,
                  onTap: (index) => setState(() => selectedTab = index),
                ),

                //TextField
                SizedBox(height: context.spacing24),
                AuthField(
                  lebel: AppStrings.emailAddress,
                  controller: emailController,
                  hintText: 'example@gmail.com',
                ),
                SizedBox(height: context.spacing16),
                AuthField(
                  lebel: AppStrings.password,
                  controller: passwordController,
                  isObscure: true,
                  isPassword: true,
                  isForgotPassword: selectedTab == 0 ? true : false,
                  hintText: '**********',
                ),

                SizedBox(height: context.spacing16),
                selectedTab == 1
                    ? AuthField(
                        lebel: AppStrings.reTypePassword,
                        controller: confirmPasswordController,
                        isObscure: true,
                        isPassword: true,
                        hintText: '**********',
                      )
                    : SizedBox.shrink(),
                //error

                //Button
                SizedBox(height: context.spacing24),
                PrimaryButton(
                  buttonName: selectedTab == 0
                      ? AppStrings.login
                      : AppStrings.signUp,
                  onPressed: () {
                    //is login succes go home page
                    selectedTab == 0
                        ? Navigator.push(context, SubscriptionPage.route())
                        : Navigator.push(
                            context,
                            OtpPage.route(isForgetPassword: false),
                          );
                  },
                ),

                //only signup text
                SizedBox(height: context.spacing12),
                selectedTab == 1
                    ? Text(
                        AppStrings.termsSignUp,
                        style: AppTextStyle.s16w4i(
                          color: AppPallete.bodyText,
                        ).copyWith(fontSize: 12, fontWeight: FontWeight.w800),
                      )
                    : SizedBox.shrink(),

                //or
                SizedBox(height: context.spacing32),
                Or(),

                //Social login
                SizedBox(height: context.spacing24),
                SocialButton(buttonName: AppStrings.continueWithGoogle),

                //only login
                Spacer(),
                selectedTab == 0
                    ? Text(
                        AppStrings.termsSignUp,
                        style: AppTextStyle.s16w4i(
                          color: AppPallete.bodyText,
                        ).copyWith(fontSize: 12, fontWeight: FontWeight.w800),
                      )
                    : SizedBox.shrink(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
