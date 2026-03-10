import 'package:craft_climb/core/utils/app_bg.dart';
import 'package:craft_climb/core/utils/screen_size.dart';
import 'package:craft_climb/core/widgets/primary_button.dart';
import 'package:craft_climb/core/widgets/secand_app_bar.dart';
import 'package:craft_climb/features/trainer/presentation/pages/my_course/lecture_page.dart';
import 'package:craft_climb/features/trainer/presentation/pages/my_course/module_page.dart';
import 'package:craft_climb/features/trainer/presentation/widgets/add_button.dart';
import 'package:craft_climb/features/trainer/presentation/widgets/file_picker.dart';
import 'package:craft_climb/features/trainer/presentation/widgets/form_field.dart';
import 'package:craft_climb/features/trainer/presentation/widgets/form_label.dart';
import 'package:craft_climb/features/trainer/presentation/widgets/module_tile.dart';
import 'package:craft_climb/features/trainer/presentation/widgets/outline_button.dart';
import 'package:craft_climb/features/trainer/presentation/widgets/price_field.dart';
import 'package:flutter/material.dart';

class EditCoursePage extends StatelessWidget {
  static Route route() =>
      MaterialPageRoute(builder: (context) => EditCoursePage());

  EditCoursePage({super.key});

  final courseNameController = TextEditingController();
  final courseSummaryController = TextEditingController();
  final coursePriceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBg(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── FIXED AppBar ─────────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SecandAppBar(title: 'Edit Course'),
            ),

            // ── SCROLLABLE body ──────────────────────────────────────────
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  // ── Course Name ──
                  TrainerFormLabel(label: 'Course Name'),
                  TrainerFormField(
                    controller: courseNameController,
                    hint: 'Type here....',
                  ),

                  SizedBox(height: context.spacing16),

                  // ── Course Summary ──
                  TrainerFormLabel(label: 'Course Summary'),
                  TrainerFormField(
                    controller: courseSummaryController,
                    hint: 'Type here....',
                  ),

                  SizedBox(height: context.spacing16),

                  // ── Course Image ──
                  TrainerFormLabel(label: 'Course Image'),
                  TrainerFilePicker(hint: 'Choose your image', onTap: () {}),

                  SizedBox(height: context.spacing16),

                  // ── Course Price ──
                  TrainerFormLabel(label: 'Course Price'),
                  TrainerPriceField(controller: coursePriceController),

                  SizedBox(height: context.spacing24),

                  // ── Modules ──
                  ...List.generate(
                    3,
                    (index) => TrainerModuleTile(
                      title: 'Module ${index + 1}',
                      showEdit: false,

                      viewModulePress: () {
                        Navigator.push(context, ModulePage.route());
                      },
                    ),
                  ),

                  TrianerAddButton(label: '+ Add Next Module', onTap: () {}),

                  SizedBox(height: context.spacing24),

                  // ── Buttons ──
                  PrimaryButton(
                    buttonName: 'Publish',
                    onPressed: () {
                      Navigator.push(context, LecturePage.route());
                    },
                  ),
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
