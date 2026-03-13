import 'package:craft_climb/core/theme/app_pallete.dart';
import 'package:craft_climb/core/theme/app_text_style.dart';
import 'package:craft_climb/core/utils/app_bg.dart';
import 'package:craft_climb/core/widgets/primary_button.dart';
import 'package:craft_climb/core/widgets/secand_app_bar.dart';
import 'package:craft_climb/features/profile/presentation/widgets/profile_add_more_button.dart';
import 'package:craft_climb/features/profile/presentation/widgets/profile_file_picker.dart';
import 'package:craft_climb/features/profile/presentation/widgets/profile_form_field.dart';
import 'package:craft_climb/features/profile/presentation/widgets/profile_section_title.dart';
import 'package:flutter/material.dart';

class CSProfileEditPage extends StatefulWidget {
  static Route route() =>
      MaterialPageRoute(builder: (_) => const CSProfileEditPage());
  const CSProfileEditPage({super.key});

  @override
  State<CSProfileEditPage> createState() => _CSProfileEditPageState();
}

class _CSProfileEditPageState extends State<CSProfileEditPage> {
  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final linkedinController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final summaryController = TextEditingController();
  final skillController = TextEditingController();
  final salaryController = TextEditingController();
  final instituteController = TextEditingController();
  final examController = TextEditingController();
  final resultController = TextEditingController();
  final passingYearController = TextEditingController();
  final companyController = TextEditingController();
  final roleController = TextEditingController();
  final durationStartController = TextEditingController();
  final durationEndController = TextEditingController();
  final jobResponsibilityController = TextEditingController();

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
    instituteController.dispose();
    examController.dispose();
    resultController.dispose();
    passingYearController.dispose();
    companyController.dispose();
    roleController.dispose();
    durationStartController.dispose();
    durationEndController.dispose();
    jobResponsibilityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBg(
        child: Column(
          children: [
            // ── App Bar ──
            SecandAppBar(title: 'Profile Update'),
            // ── Body ──
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProfileFormField(
                      label: 'Name',
                      hint: 'Full Name',
                      controller: nameController,
                    ),
                    const SizedBox(height: 14),

                    ProfileFormField(
                      label: 'Address',
                      hint: 'Type here....',
                      controller: addressController,
                    ),
                    const SizedBox(height: 14),

                    ProfileFormField(
                      label: 'Linkedin',
                      hint: 'Type here....',
                      controller: linkedinController,
                    ),
                    const SizedBox(height: 14),

                    ProfileFormField(
                      label: 'Contact Email',
                      hint: 'Type here....',
                      controller: emailController,
                    ),
                    const SizedBox(height: 14),

                    ProfileFormField(
                      label: 'Contact Phone Number',
                      hint: 'Type here....',
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                    ),
                    const SizedBox(height: 14),

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
                    const SizedBox(height: 6),

                    // ── Salary ──
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: ProfileFormField(
                            label: 'Salary Expectations',
                            hint: '120k',
                            controller: salaryController,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 14,
                          ),
                          decoration: BoxDecoration(
                            color: AppPallete.primary,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: AppPallete.accent10),
                          ),
                          child: Text(
                            '\$',
                            style: AppTextStyle.s14w4i(
                              color: AppPallete.accent,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),

                    // ── Upload Image ──
                    ProfileFilePicker(label: 'Upload Image', hint: 'Choose your image', onTap: () {  },),
                    const SizedBox(height: 14),

                    // ── Educational Background ──
                    ProfileSectionTitle(title: 'Educational Background'),
                    ProfileFormField(
                      label: 'Institute Name',
                      hint: 'Type here....',
                      controller: instituteController,
                    ),
                    const SizedBox(height: 10),
                    ProfileFormField(
                      label: 'Exam Name',
                      hint: 'Type here....',
                      controller: examController,
                    ),
                    const SizedBox(height: 10),
                    ProfileFormField(
                      label: 'Result',
                      hint: 'Type here....',
                      controller: resultController,
                    ),
                    const SizedBox(height: 10),
                    ProfileFormField(
                      label: 'Passing Year',
                      hint: 'Type here....',
                      controller: passingYearController,
                    ),
                    const SizedBox(height: 10),
                    ProfileAddMoreButton(onTap: () {}),
                    const SizedBox(height: 14),

                    // ── Job Experience ──
                    ProfileSectionTitle(title: 'Job Experience'),
                    ProfileFormField(
                      label: 'Company Name',
                      hint: 'Type here....',
                      controller: companyController,
                    ),
                    const SizedBox(height: 10),
                    ProfileFormField(
                      label: 'Role',
                      hint: 'Type here....',
                      controller: roleController,
                    ),
                    const SizedBox(height: 10),

                    // Duration
                    Text(
                      'Experience Duration',
                      style: AppTextStyle.s12w4i(
                        color: Colors.grey.shade500,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Start Date',
                                style: AppTextStyle.s10w4i(
                                  color: Colors.grey.shade500,
                                ),
                              ),
                              const SizedBox(height: 4),
                              _DatePickerField(
                                controller: durationStartController,
                                hint: '02 January 2022',
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'End Date',
                                style: AppTextStyle.s10w4i(
                                  color: Colors.grey.shade500,
                                ),
                              ),
                              const SizedBox(height: 4),
                              _DatePickerField(
                                controller: durationEndController,
                                hint: '02 January 2024',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),

                    // Currently working checkbox
                    Row(
                      children: [
                        Checkbox(
                          value: false,
                          onChanged: (_) {},
                          activeColor: AppPallete.accent,
                        ),
                        Text(
                          'Currently I am working here',
                          style: AppTextStyle.s12w4i(
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),

                    ProfileFormField(
                      label: 'Job Responsibility',
                      hint: 'Type here....',
                      controller: jobResponsibilityController,
                      maxLines: 3,
                    ),
                    const SizedBox(height: 10),
                    ProfileAddMoreButton(onTap: () {}),
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

// ── Date Picker Field ──
class _DatePickerField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;

  const _DatePickerField({required this.controller, required this.hint});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final date = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2030),
        );
        if (date != null) {
          controller.text = '${date.day} ${_month(date.month)} ${date.year}';
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                controller.text.isEmpty ? hint : controller.text,
                style: AppTextStyle.s12w4i(color: Colors.grey.shade400),
              ),
            ),
            Icon(
              Icons.calendar_today_outlined,
              size: 14,
              color: Colors.grey.shade400,
            ),
          ],
        ),
      ),
    );
  }

  String _month(int m) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return months[m - 1];
  }
}
