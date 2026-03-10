import 'package:craft_climb/core/utils/app_bg.dart';
import 'package:craft_climb/core/utils/screen_size.dart';
import 'package:craft_climb/core/widgets/primary_button.dart';
import 'package:craft_climb/core/widgets/secand_app_bar.dart';
import 'package:craft_climb/features/courses/presentation/pages/new_course/new_exam_page.dart';
import 'package:craft_climb/features/courses/presentation/pages/new_course/new_lecture_page.dart';
import 'package:craft_climb/features/courses/presentation/pages/new_course/new_pdf_page.dart';
import 'package:craft_climb/features/courses/presentation/widgets/add_button.dart';
import 'package:craft_climb/features/courses/presentation/widgets/file_picker.dart';
import 'package:craft_climb/features/courses/presentation/widgets/form_field.dart';
import 'package:craft_climb/features/courses/presentation/widgets/form_label.dart';
import 'package:craft_climb/features/courses/presentation/widgets/outline_button.dart';
import 'package:craft_climb/features/courses/presentation/widgets/price_field.dart';
import 'package:flutter/material.dart';

class NewCoursePage extends StatelessWidget {
  static Route route() =>
      MaterialPageRoute(builder: (context) => NewCoursePage());

  NewCoursePage({super.key});

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
            // ── AppBar ─────────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SecandAppBar(title: 'New Course Upload'),
            ),

            // ── SCROLLABLE body ──────────────────────────────────────────
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  // ── Course Name ──
                  CourseFormLabel(label: 'Course Name'),
                  CourseFormField(
                    controller: courseNameController,
                    hint: 'Type here....',
                  ),
                  SizedBox(height: context.spacing16),

                  // ── Course Summary ──
                  CourseFormLabel(label: 'Course Summary'),
                  CourseFormField(
                    controller: courseSummaryController,
                    hint: 'Type here....',
                  ),
                  SizedBox(height: context.spacing16),

                  // ── Course Image ──
                  CourseFormLabel(label: 'Course Image'),
                  CourseFilePicker(hint: 'Choose your image', onTap: () {}),
                  SizedBox(height: context.spacing16),

                  // ── Course Price ──
                  CourseFormLabel(label: 'Course Price'),
                  CoursePriceField(controller: coursePriceController),
                  SizedBox(height: context.spacing24),

                  // ── Course Content ──
                  CourseFormLabel(label: 'Course Content'),
                  SizedBox(height: 8),
                  CourseAddButton(
                    label: '+ Add Next Lecture',
                    onTap: () =>
                        Navigator.push(context, NewLecturePage.route()),
                  ),
                  SizedBox(height: 8),
                  CourseAddButton(
                    label: '+ Add PDF',
                    onTap: () => Navigator.push(context, NewPdfPage.route()),
                  ),
                  SizedBox(height: 8),
                  CourseAddButton(
                    label: '+ Add Exam',
                    onTap: () => Navigator.push(context, NewExamPage.route()),
                  ),

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
