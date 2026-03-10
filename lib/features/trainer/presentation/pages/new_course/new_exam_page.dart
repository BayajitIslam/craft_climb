import 'package:craft_climb/core/theme/app_pallete.dart';
import 'package:craft_climb/core/theme/app_text_style.dart';
import 'package:craft_climb/core/utils/app_bg.dart';
import 'package:craft_climb/core/utils/screen_size.dart';
import 'package:craft_climb/core/widgets/primary_button.dart';
import 'package:craft_climb/core/widgets/secand_app_bar.dart';
import 'package:craft_climb/features/trainer/presentation/widgets/add_button.dart';
import 'package:craft_climb/features/trainer/presentation/widgets/form_field.dart';
import 'package:craft_climb/features/trainer/presentation/widgets/form_label.dart';
import 'package:craft_climb/features/trainer/presentation/widgets/outline_button.dart';
import 'package:flutter/material.dart';

class NewExamPage extends StatefulWidget {
  static Route route() =>
      MaterialPageRoute(builder: (context) => NewExamPage());

  const NewExamPage({super.key});

  @override
  State<NewExamPage> createState() => _NewExamPageState();
}

class _NewExamPageState extends State<NewExamPage> {
  final List<Map<String, dynamic>> questions = [
    {
      'question': TextEditingController(),
      'options': [TextEditingController()],
    },
  ];

  void addQuestion() {
    setState(() {
      questions.add({
        'question': TextEditingController(),
        'options': [TextEditingController()],
      });
    });
  }

  void addOption(int qIndex) {
    setState(() {
      questions[qIndex]['options'].add(TextEditingController());
    });
  }

  @override
  void dispose() {
    for (final q in questions) {
      (q['question'] as TextEditingController).dispose();
      for (final o in q['options'] as List) {
        (o as TextEditingController).dispose();
      }
    }
    super.dispose();
  }

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
              child: SecandAppBar(title: 'New Exam'),
            ),

            // ── SCROLLABLE body ──────────────────────────────────────────
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  TrainerFormLabel(label: 'Questions'),
                  SizedBox(height: 8),

                  // ── Questions List ──
                  ...List.generate(questions.length, (qIndex) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Question Field
                        Row(
                          children: [
                            Text('${qIndex + 1}.'),
                            SizedBox(width: 8),
                            Expanded(
                              child: TrainerFormField(
                                controller: questions[qIndex]['question'],
                                hint: 'Type here....',
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),

                        // Options
                        ...List.generate(
                          questions[qIndex]['options'].length,
                          (oIndex) => Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TrainerFormField(
                                    controller:
                                        questions[qIndex]['options'][oIndex],
                                    hint: 'Option ${oIndex + 1}',
                                  ),
                                ),
                                SizedBox(width: 8),
                                if (oIndex ==
                                    questions[qIndex]['options'].length - 1)
                                  GestureDetector(
                                    onTap: () => addOption(qIndex),
                                    child: Text(
                                      '+ Add Options',
                                      style: AppTextStyle.s14w4i(
                                        color: AppPallete.accent,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),

                        SizedBox(height: 8),
                      ],
                    );
                  }),

                  // ── Add Question ──
                  TrianerAddButton(
                    label: '+ Add Next Question',
                    onTap: addQuestion,
                  ),
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
