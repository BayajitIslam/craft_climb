import 'package:craft_climb/core/theme/app_pallete.dart';
import 'package:craft_climb/core/theme/app_text_style.dart';
import 'package:craft_climb/core/utils/app_bg.dart';
import 'package:craft_climb/core/utils/screen_size.dart';
import 'package:craft_climb/core/widgets/primary_button.dart';
import 'package:craft_climb/core/widgets/secand_app_bar.dart';
import 'package:craft_climb/features/courses/presentation/widgets/file_picker.dart';
import 'package:craft_climb/features/courses/presentation/widgets/outline_button.dart';
import 'package:flutter/material.dart';

class LecturePage extends StatelessWidget {
  static Route route() =>
      MaterialPageRoute(builder: (context) => LecturePage());

  const LecturePage({super.key});

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
              child: SecandAppBar(title: 'Lecture 1'),
            ),

            // ── SCROLLABLE body ──────────────────────────────────────────
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  // ── Upload Video ──
                  Text(
                    'Upload Video',
                    style: AppTextStyle.s16w4i(
                      fontWeight: FontWeight.w500,
                      color: AppPallete.bodyText,
                    ),
                  ),
                  SizedBox(height: 8),
                  CourseFilePicker(hint: 'lecturevideo1.mp4', onTap: () {}),

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
