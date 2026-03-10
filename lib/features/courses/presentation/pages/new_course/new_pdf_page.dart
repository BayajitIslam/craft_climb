import 'package:craft_climb/core/utils/app_bg.dart';
import 'package:craft_climb/core/utils/screen_size.dart';
import 'package:craft_climb/core/widgets/primary_button.dart';
import 'package:craft_climb/core/widgets/secand_app_bar.dart';
import 'package:craft_climb/features/courses/presentation/widgets/add_button.dart';
import 'package:craft_climb/features/courses/presentation/widgets/file_picker.dart';
import 'package:craft_climb/features/courses/presentation/widgets/form_field.dart';
import 'package:craft_climb/features/courses/presentation/widgets/form_label.dart';
import 'package:craft_climb/features/courses/presentation/widgets/outline_button.dart';
import 'package:flutter/material.dart';

class NewPdfPage extends StatelessWidget {
  static Route route() => MaterialPageRoute(builder: (context) => NewPdfPage());

  NewPdfPage({super.key});

  final pdfNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBg(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── AppBar ─────────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SecandAppBar(title: 'New PDF'),
            ),

            // ── SCROLLABLE body ──────────────────────────────────────────
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  // ── PDF Name ──
                  CourseFormLabel(label: 'PDF Name'),
                  CourseFormField(
                    controller: pdfNameController,
                    hint: 'Type here....',
                  ),
                  SizedBox(height: context.spacing16),

                  // ── Upload PDF ──
                  CourseFormLabel(label: 'Upload PDF'),
                  CourseFilePicker(hint: 'Choose your file', onTap: () {}),
                  SizedBox(height: 8),

                  // ── Add More ──
                  CourseAddButton(label: '+ Add Another PDF', onTap: () {}),
                  SizedBox(height: context.spacing24),

                  // ── Buttons ──
                  PrimaryButton(buttonName: 'Publish', onPressed: () {}),
                  SizedBox(height: context.spacing12),
                  CourseOutlineButton(label: 'Save & Exit', onPressed: () {}),
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
