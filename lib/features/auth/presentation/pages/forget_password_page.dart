import 'package:craft_climb/core/constants/app_images.dart';
import 'package:craft_climb/core/constants/app_strings.dart';
import 'package:craft_climb/core/theme/app_text_style.dart';
import 'package:craft_climb/core/utils/app_bg.dart';
import 'package:craft_climb/core/utils/screen_size.dart';
import 'package:craft_climb/core/widgets/primary_button.dart';
import 'package:craft_climb/features/auth/presentation/pages/otp_page.dart';
import 'package:craft_climb/features/auth/presentation/widgets/auth_field.dart';
import 'package:flutter/material.dart';

class ForgetPasswordPage extends StatefulWidget {
  // ROUTE METHOD
  static Route route() {
    return MaterialPageRoute(builder: (context) => ForgetPasswordPage());
  }

  //consutructor
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  //controller
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
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
                    AppStrings.forgetPassword,
                    style: AppTextStyle.s24w7i(fontSize: 22),
                  ),
                ),

                //TextField
                SizedBox(height: context.spacing12),
                AuthField(
                  lebel: AppStrings.emailAddress,
                  controller: emailController,
                  hintText: 'example@gmail.com',
                ),

                //Send Button
                SizedBox(height: context.spacing24),
                PrimaryButton(
                  buttonName: AppStrings.sendOtp,
                  onPressed: () {
                    Navigator.push(
                      context,
                      OtpPage.route(isForgetPassword: true),
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
