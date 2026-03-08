import 'package:craft_climb/core/constants/app_images.dart';
import 'package:craft_climb/core/constants/app_strings.dart';
import 'package:craft_climb/core/theme/app_text_style.dart';
import 'package:craft_climb/core/utils/app_bg.dart';
import 'package:craft_climb/core/utils/screen_size.dart';
import 'package:craft_climb/core/widgets/primary_button.dart';
import 'package:craft_climb/features/auth/presentation/pages/login_and_signup_page.dart';
import 'package:craft_climb/features/auth/presentation/widgets/auth_field.dart';
import 'package:flutter/material.dart';

class ResetPasswordPage extends StatefulWidget {
  // ROUTE METHOD
  static Route route({required String email}) {
    return MaterialPageRoute(
      builder: (context) => ResetPasswordPage(email: email),
    );
  }

  //consutructor
  final String email;
  const ResetPasswordPage({super.key, required this.email});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  //controller
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBg(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(context.spacing24),
            child: Column(
              children: [
                //BENNAR
                SizedBox(height: 33),
                Image.asset(AppImages.appBennar, width: 256),

                //Text
                SizedBox(height: context.spacing32),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    AppStrings.resetYourPassword,
                    style: AppTextStyle.s24w7i(fontSize: 22),
                  ),
                ),

                //TextField
                SizedBox(height: context.spacing12),
                AuthField(
                  lebel: AppStrings.emailAddress,
                  isPassword: true,
                  isObscure: true,
                  controller: passwordController,
                  hintText: '********',
                ),

                //TextField
                SizedBox(height: context.spacing12),
                AuthField(
                  lebel: AppStrings.reTypePassword,
                  isPassword: true,
                  isObscure: true,
                  controller: confirmPasswordController,
                  hintText: '********',
                ),

                //Send Button
                SizedBox(height: context.spacing24),
                PrimaryButton(
                  buttonName: AppStrings.confirm,
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      LoginAndSignupPage.routeWith(initialTab: 0),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
