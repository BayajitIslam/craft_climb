import 'package:craft_climb/core/utils/app_bg.dart';
import 'package:craft_climb/core/widgets/primary_button.dart';
import 'package:craft_climb/core/widgets/secand_app_bar.dart';
import 'package:craft_climb/features/auth/presentation/widgets/auth_field.dart';
import 'package:flutter/material.dart';

class ChangePasswordPage extends StatefulWidget {
  static Route route() =>
      MaterialPageRoute(builder: (_) => const ChangePasswordPage());
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _reTypePasswordController = TextEditingController();

  @override
  void dispose() {
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _reTypePasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: AppBg(
        child: Column(
          children: [
            // ── AppBar ──
            SecandAppBar(title: 'Change Password'),

            Expanded(
              child: Stack(
                //  Stack use
                children: [
                  // ── Scrollable fields ──
                  SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8),

                        // ── Old Password ──
                        AuthField(
                          lebel: 'Old Password',
                          hintText: '********',
                          controller: _oldPasswordController,
                          isObscure: true,
                          isPassword: true,
                        ),
                        const SizedBox(height: 16),

                        // ── New Password ──
                        AuthField(
                          lebel: 'New Password',
                          hintText: '********',
                          controller: _newPasswordController,
                          isObscure: true,
                          isPassword: true,
                        ),
                        const SizedBox(height: 16),

                        // ── Re Type Password ──
                        AuthField(
                          lebel: 'Re Type Password',
                          hintText: '********',
                          controller: _reTypePasswordController,
                          isObscure: true,
                          isPassword: true,
                        ),

                        const SizedBox(height: 80),
                      ],
                    ),
                  ),

                  // ── Floating Save Button ──
                  Positioned(
                    bottom: 0,
                    left: 16,
                    right: 16,
                    child: Container(
                      color: Colors.transparent,
                      padding: const EdgeInsets.only(bottom: 16),
                      child: PrimaryButton(
                        buttonName: 'Save',
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
