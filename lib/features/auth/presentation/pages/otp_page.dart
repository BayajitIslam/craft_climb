import 'package:craft_climb/core/constants/app_images.dart';
import 'package:craft_climb/core/constants/app_strings.dart';
import 'package:craft_climb/core/theme/app_pallete.dart';
import 'package:craft_climb/core/theme/app_text_style.dart';
import 'package:craft_climb/core/utils/app_bg.dart';
import 'package:craft_climb/core/utils/debug_console.dart';
import 'package:craft_climb/core/utils/screen_size.dart';
import 'package:craft_climb/core/widgets/primary_button.dart';
import 'package:craft_climb/features/auth/presentation/pages/login_and_signup_page.dart';
import 'package:craft_climb/features/auth/presentation/pages/reset_password_page.dart';
import 'package:craft_climb/features/auth/presentation/widgets/otp_field.dart';
import 'package:flutter/material.dart';

class OtpPage extends StatelessWidget {
  //route
  static Route route({required bool isForgetPassword}) {
    return MaterialPageRoute(
      builder: (context) => OtpPage(isForgetPassword: isForgetPassword),
    );
  }

  final bool isForgetPassword;
  const OtpPage({super.key, required this.isForgetPassword});

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
                    AppStrings.forgetPassword,
                    style: AppTextStyle.s24w7i(fontSize: 22),
                  ),
                ),

                //Text
                SizedBox(height: context.spacing12),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    AppStrings.enterCode,
                    style: AppTextStyle.s16w4i(
                      fontWeight: FontWeight.w700,
                      color: AppPallete.black75,
                    ),
                  ),
                ),

                //TextField
                SizedBox(height: context.spacing12),
                OtpField(
                  otpLength: 5,
                  onCompleted: (otp) {
                    DebugConsole.ui('OTP: $otp');
                    // call verify api
                  },
                ),

                //Send Button
                SizedBox(height: context.spacing24),
                PrimaryButton(
                  buttonName: AppStrings.sendOtp,
                  onPressed: () {
                    isForgetPassword
                        ? Navigator.push(
                            context,
                            ResetPasswordPage.route(email: 'email'),
                          )
                        : Navigator.push(
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
