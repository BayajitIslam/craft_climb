import 'package:craft_climb/core/theme/app_pallete.dart';
import 'package:craft_climb/core/theme/app_text_style.dart';
import 'package:craft_climb/core/utils/app_bg.dart';
import 'package:craft_climb/core/widgets/primary_button.dart';
import 'package:craft_climb/core/widgets/secand_app_bar.dart';
import 'package:craft_climb/features/profile/presentation/widgets/profile_file_picker.dart';
import 'package:craft_climb/features/profile/presentation/widgets/profile_form_field.dart';
import 'package:flutter/material.dart';

class TrainerProfileEditPage extends StatefulWidget {
  static Route route() =>
      MaterialPageRoute(builder: (_) => const TrainerProfileEditPage());
  const TrainerProfileEditPage({super.key});

  @override
  State<TrainerProfileEditPage> createState() => _TrainerProfileEditPageState();
}

class _TrainerProfileEditPageState extends State<TrainerProfileEditPage> {
  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final linkedinController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final summaryController = TextEditingController();
  final skillController = TextEditingController();
  final salaryController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    addressController.dispose();
    linkedinController.dispose();
    emailController.dispose();
    phoneController.dispose();
    summaryController.dispose();
    skillController.dispose();
    salaryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBg(
        child: Column(
          children: [
            //App Bar
            SecandAppBar(title: 'Profile Update'),
            // ── Body ──
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ── Name ──
                    ProfileFormField(
                      label: 'Name',
                      hint: 'Full Name',
                      controller: nameController,
                    ),
                    const SizedBox(height: 14),

                    // ── Address ──
                    ProfileFormField(
                      label: 'Address',
                      hint: 'Type here....',
                      controller: addressController,
                    ),
                    const SizedBox(height: 14),

                    // ── Linkedin ──
                    ProfileFormField(
                      label: 'Linkedin',
                      hint: 'Type here....',
                      controller: linkedinController,
                    ),
                    const SizedBox(height: 14),

                    // ── Contact Email ──
                    ProfileFormField(
                      label: 'Contact Email',
                      hint: 'Type here....',
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 14),

                    // ── Phone ──
                    ProfileFormField(
                      label: 'Contact Phone Number',
                      hint: 'Type here....',
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                    ),
                    const SizedBox(height: 14),

                    // ── Summary ──
                    ProfileFormField(
                      label: 'Professional Summary',
                      hint: 'Type here....',
                      controller: summaryController,
                      maxLines: 3,
                    ),
                    const SizedBox(height: 14),

                    // ── Skills ──
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: ProfileFormField(
                            label: 'Skills',
                            hint: 'UI',
                            controller: skillController,
                          ),
                        ),
                        SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(color: AppPallete.border),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 14,
                            ),

                            child: Text(
                              '+ Add',
                              style: AppTextStyle.s12w4i(
                                color: AppPallete.subTextColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 14),

                    ProfileFormField(
                      label: 'Experience',
                      hint: 'Type here....',
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 14),

                    // ── Upload Image ──
                    ProfileFilePicker(
                      label: 'Upload Image',
                      hint: 'Choose your file',
                      onTap: () {},
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),

            // ── Save Button ──
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
              child: PrimaryButton(
                buttonName: 'Save',
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
