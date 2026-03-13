import 'package:craft_climb/core/utils/app_bg.dart';
import 'package:craft_climb/core/widgets/primary_button.dart';
import 'package:craft_climb/core/widgets/secand_app_bar.dart';
import 'package:craft_climb/features/profile/presentation/widgets/profile_file_picker.dart';
import 'package:craft_climb/features/profile/presentation/widgets/profile_form_field.dart';
import 'package:flutter/material.dart';

class EmployerProfileEditPage extends StatefulWidget {
  static Route route() =>
      MaterialPageRoute(builder: (_) => const EmployerProfileEditPage());
  const EmployerProfileEditPage({super.key});

  @override
  State<EmployerProfileEditPage> createState() =>
      _EmployerProfileEditPageState();
}

class _EmployerProfileEditPageState extends State<EmployerProfileEditPage> {
  final companyNameController = TextEditingController();
  final addressController = TextEditingController();
  final linkedinController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  void dispose() {
    companyNameController.dispose();
    addressController.dispose();
    linkedinController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBg(
        child: Column(
          children: [
            // ── AppBar ─────────────────────────────────────────────
            SecandAppBar(title: 'Profile Update'),
            // ── Body ─────────────────────────────────────────────
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    ProfileFormField(
                      label: 'Company Name',
                      hint: 'Full Name',
                      controller: companyNameController,
                    ),
                    const SizedBox(height: 14),
                    ProfileFilePicker(
                      label: 'Company Logo',
                      hint: 'Choose your file ',
                      onTap: () {},
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
                      label: 'Company Description',
                      hint: 'Type here....',
                      controller: descriptionController,
                      maxLines: 4,
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
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
