import 'package:craft_climb/core/utils/app_bg.dart';
import 'package:craft_climb/core/utils/screen_size.dart';
import 'package:craft_climb/core/widgets/primary_button.dart';
import 'package:craft_climb/core/widgets/secand_app_bar.dart';
import 'package:craft_climb/features/trainer/presentation/widgets/add_button.dart';
import 'package:craft_climb/features/trainer/presentation/widgets/file_picker.dart';
import 'package:craft_climb/features/trainer/presentation/widgets/form_field.dart';
import 'package:craft_climb/features/trainer/presentation/widgets/form_label.dart';
import 'package:craft_climb/features/trainer/presentation/widgets/outline_button.dart';
import 'package:flutter/material.dart';

class NewLecturePage extends StatelessWidget {
  static Route route() =>
      MaterialPageRoute(builder: (context) => NewLecturePage());

  NewLecturePage({super.key});

  final lectureNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBg(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ──  AppBar ─────────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SecandAppBar(title: 'New Lecture'),
            ),

            // ── SCROLLABLE body ──────────────────────────────────────────
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  // ── Lecture Name ──
                  TrainerFormLabel(label: 'Lecture Name'),
                  TrainerFormField(
                    controller: lectureNameController,
                    hint: 'Type here....',
                  ),
                  SizedBox(height: context.spacing16),

                  // ── Upload Video ──
                  TrainerFormLabel(label: 'Upload Video'),
                  TrainerFilePicker(hint: 'Choose your file', onTap: () {}),
                  SizedBox(height: 8),

                  // ── Add More ──
                  TrianerAddButton(label: '+ Add Next Lecture', onTap: () {}),
                  SizedBox(height: context.spacing24),

                  // ── Buttons ──
                  PrimaryButton(buttonName: 'Publish', onPressed: () {}),
                  SizedBox(height: context.spacing12),
                  TrainerOutlineButton(label: 'Save & Exit', onPressed: () {}),
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
