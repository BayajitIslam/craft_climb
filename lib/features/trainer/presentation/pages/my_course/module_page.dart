import 'package:craft_climb/core/utils/app_bg.dart';
import 'package:craft_climb/core/utils/screen_size.dart';
import 'package:craft_climb/core/widgets/primary_button.dart';
import 'package:craft_climb/core/widgets/secand_app_bar.dart';
import 'package:craft_climb/features/trainer/presentation/widgets/add_button.dart';
import 'package:craft_climb/features/trainer/presentation/widgets/form_field.dart';
import 'package:craft_climb/features/trainer/presentation/widgets/form_label.dart';
import 'package:craft_climb/features/trainer/presentation/widgets/lecture_tile.dart';
import 'package:craft_climb/features/trainer/presentation/widgets/outline_button.dart';
import 'package:flutter/material.dart';

class ModulePage extends StatelessWidget {
  static Route route() => MaterialPageRoute(builder: (context) => ModulePage());
  ModulePage({super.key});

  final moduleTitleController = TextEditingController();
  final moduleDescriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBg(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── FIXED AppBar ─────────────────────────────────────────────
            SecandAppBar(title: 'Edit Module'),

            // ── SCROLLABLE body ──────────────────────────────────────────
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  // ── Module Title ──
                  TrainerFormLabel(label: 'Module Title'),
                  TrainerFormField(
                    controller: moduleTitleController,
                    hint: 'Type here....',
                  ),

                  SizedBox(height: context.spacing16),

                  // ── Module Description ──
                  TrainerFormLabel(label: 'Module Description'),
                  TrainerFormField(
                    controller: moduleDescriptionController,
                    hint: 'Type here....',
                    maxLines: 4,
                  ),

                  SizedBox(height: context.spacing24),

                  // ── Lectures ──
                  ...List.generate(
                    9,
                    (index) =>
                        TrainerLectureTile(title: 'Lecture ${index + 1}'),
                  ),

                  // ── Add Lecture ──
                  SizedBox(height: context.spacing16),
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
