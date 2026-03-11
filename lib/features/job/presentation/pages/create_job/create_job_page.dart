import 'package:craft_climb/core/theme/app_pallete.dart';
import 'package:craft_climb/core/theme/app_text_style.dart';
import 'package:craft_climb/core/utils/app_bg.dart';
import 'package:craft_climb/core/utils/screen_size.dart';
import 'package:craft_climb/core/widgets/primary_button.dart';
import 'package:craft_climb/core/widgets/secand_app_bar.dart';
import 'package:craft_climb/features/job/presentation/widgets/file_picker.dart';
import 'package:craft_climb/features/job/presentation/widgets/job_dropdown.dart';
import 'package:flutter/material.dart';

class CreateJobPage extends StatefulWidget {
  final bool isEdit;

  static Route route({bool isEdit = false}) =>
      MaterialPageRoute(builder: (_) => CreateJobPage(isEdit: isEdit));
  const CreateJobPage({super.key, this.isEdit = false});

  @override
  State<CreateJobPage> createState() => _CreateJobPageState();
}

class _CreateJobPageState extends State<CreateJobPage> {
  final titleController = TextEditingController();
  final summaryController = TextEditingController();
  final responsibilitiesController = TextEditingController();
  final requirementsController = TextEditingController();
  final locationController = TextEditingController();
  final salaryController = TextEditingController();
  final deadlineController = TextEditingController();

  String? selectedDepartment;
  String? selectedEmploymentType;
  String? selectedJobType;
  String? selectedExperience;
  String? fileName;

  final departments = ['Civil Engineering', 'Electrical', 'Mechanical'];
  final employmentTypes = ['Full Time', 'Part Time', 'Contract'];
  final jobTypes = ['On-site', 'Remote', 'Hybrid'];
  final experiences = ['1 Year', '2 Years', '3+ Years'];

  @override
  void dispose() {
    titleController.dispose();
    summaryController.dispose();
    responsibilitiesController.dispose();
    requirementsController.dispose();
    locationController.dispose();
    salaryController.dispose();
    deadlineController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBg(
        child: Column(
          children: [
            // ── AppBar ─────────────────────────────────────────────
            SecandAppBar(title: widget.isEdit ? 'Update Job' : 'Create Job'),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  // ── Job Title ──
                  _JobFormLabel(label: 'Job Title'),
                  _JobFormField(
                    controller: titleController,
                    hint: 'Type here....',
                  ),
                  SizedBox(height: context.spacing16),

                  // ── Department ──
                  _JobFormLabel(label: 'Department / Category'),
                  JobDropdown(
                    value: selectedDepartment,
                    items: departments,
                    hint: 'Civil Engineering',
                    onChanged: (v) => setState(() => selectedDepartment = v),
                  ),
                  SizedBox(height: context.spacing16),

                  // ── Employment Type ──
                  _JobFormLabel(label: 'Employment Type'),
                  JobDropdown(
                    value: selectedEmploymentType,
                    items: employmentTypes,
                    hint: 'Full Time',
                    onChanged: (v) =>
                        setState(() => selectedEmploymentType = v),
                  ),
                  SizedBox(height: context.spacing16),

                  // ── Job Type ──
                  _JobFormLabel(label: 'Job Type'),
                  JobDropdown(
                    value: selectedJobType,
                    items: jobTypes,
                    hint: 'On-site',
                    onChanged: (v) => setState(() => selectedJobType = v),
                  ),
                  SizedBox(height: context.spacing16),

                  // ── Job Summary ──
                  _JobFormLabel(label: 'Job Summary'),
                  _JobFormField(
                    controller: summaryController,
                    hint: 'Type here....',
                    maxLines: 3,
                  ),
                  SizedBox(height: context.spacing16),

                  // ── Key Responsibilities ──
                  _JobFormLabel(label: 'Key Responsibilities'),
                  _JobFormField(
                    controller: responsibilitiesController,
                    hint: 'Type here....',
                    maxLines: 3,
                  ),
                  SizedBox(height: context.spacing16),

                  // ── Job Requirements ──
                  _JobFormLabel(label: 'Job Requirements'),
                  _JobFormField(
                    controller: requirementsController,
                    hint: 'Type here....',
                    maxLines: 3,
                  ),
                  SizedBox(height: context.spacing16),

                  // ── Job Location ──
                  _JobFormLabel(label: 'Job Location'),
                  _JobFormField(
                    controller: locationController,
                    hint: 'Type here....',
                  ),
                  SizedBox(height: context.spacing16),

                  // ── Salary Range ──
                  _JobFormLabel(label: 'Salary Range'),
                  Row(
                    children: [
                      Expanded(
                        child: _JobFormField(
                          controller: salaryController,
                          hint: '120k - 130k',
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
                          style: AppTextStyle.s14w4i(color: AppPallete.accent),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: context.spacing16),

                  // ── Minimum Experience ──
                  _JobFormLabel(label: 'Minimum Experience'),
                  JobDropdown(
                    value: selectedExperience,
                    items: experiences,
                    hint: 'Type here....',
                    onChanged: (v) => setState(() => selectedExperience = v),
                  ),
                  SizedBox(height: context.spacing16),

                  // ── Deadline ──
                  _JobFormLabel(label: 'Deadline'),
                  GestureDetector(
                    onTap: () async {
                      final date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2030),
                      );
                      if (date != null) {
                        deadlineController.text =
                            '${date.day}/${date.month}/${date.year}';
                      }
                    },
                    child: _JobFormField(
                      controller: deadlineController,
                      hint: 'Type here....',
                      enabled: false,
                    ),
                  ),
                  SizedBox(height: context.spacing16),

                  // ── Job Banner ──
                  _JobFormLabel(label: 'Job Banner'),
                  JobFilePicker(hint: 'Choose you image', onTap: () {}),

                  SizedBox(height: context.spacing24),

                  // ── Save Button ──
                  PrimaryButton(
                    buttonName: widget.isEdit ? 'Update' : 'Save',
                    onPressed: () {},
                  ),
                  SizedBox(height: context.spacing16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Form Label ──
class _JobFormLabel extends StatelessWidget {
  final String label;
  const _JobFormLabel({required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(
        label,
        style: AppTextStyle.s14w4i(
          fontWeight: FontWeight.w500,
          color: AppPallete.bodyText,
        ),
      ),
    );
  }
}

// ── Form Field ──
class _JobFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final int maxLines;
  final bool enabled;
  final TextInputType keyboardType;

  const _JobFormField({
    required this.controller,
    required this.hint,
    this.maxLines = 1,
    this.enabled = true,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      enabled: enabled,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: AppTextStyle.s14w4i(color: AppPallete.bodyText),
        filled: true,
        fillColor: AppPallete.primary,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppPallete.accent10),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppPallete.accent10),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppPallete.accent),
        ),
      ),
    );
  }
}
