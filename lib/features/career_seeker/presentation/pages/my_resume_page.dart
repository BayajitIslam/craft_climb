import 'package:craft_climb/core/theme/app_pallete.dart';
import 'package:craft_climb/core/theme/app_text_style.dart';
import 'package:craft_climb/core/utils/app_bg.dart';
import 'package:craft_climb/core/widgets/secand_app_bar.dart';
import 'package:flutter/material.dart';

class MyResumePage extends StatefulWidget {
  static Route route() =>
      MaterialPageRoute(builder: (_) => const MyResumePage());
  const MyResumePage({super.key});

  @override
  State<MyResumePage> createState() => _MyResumePageState();
}

class _MyResumePageState extends State<MyResumePage> {
  String? _newFileName;

  // Mock previous resume
  final Map<String, String> _previousResume = {
    'name': 'Ovie_rahaman-CV.pdf',
    'date': '13 January 2025',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBg(
        child: Column(
          children: [
            SecandAppBar(title: 'My Resume'),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ── Previous Resume ──
                  Text(
                    'Previous Resume',
                    style: AppTextStyle.s16w4i(
                      color: AppPallete.indigoNavy,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 14,
                    ),
                    decoration: BoxDecoration(
                      color: AppPallete.primary,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppPallete.border),
                      boxShadow: [
                        BoxShadow(
                          color: AppPallete.dropShadow,
                          blurRadius: 21,
                          offset: const Offset(0, 11),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        // ── File Info ──
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _previousResume['name']!,
                                style: AppTextStyle.s14w4i(
                                  fontWeight: FontWeight.w600,
                                  color: AppPallete.bodyText,
                                ),
                              ),
                              const SizedBox(height: 3),
                              Text(
                                _previousResume['date']!,
                                style: AppTextStyle.s10w4i(
                                  color: AppPallete.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // ── Check Icon ──
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: AppPallete.accent),

                            shape: BoxShape.circle,
                          ),
                          padding: EdgeInsets.all(3),
                          child: Container(
                            height: 22,
                            width: 22,
                            decoration: BoxDecoration(
                              color: AppPallete.accent,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // ── Upload New Resume ──
                  Text(
                    'Upload New Resume',
                    style: AppTextStyle.s16w4i(
                      color: AppPallete.indigoNavy,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),

                  GestureDetector(
                    onTap: () => setState(() => _newFileName = 'resume.pdf'),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          // ── Choose Button ──
                          Container(
                            margin: const EdgeInsets.all(4),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: AppPallete.stroke,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              'Choose',
                              style: AppTextStyle.s14w4i(
                                color: Colors.grey.shade700,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),

                          // ── File Name ──
                          Text(
                            _newFileName ?? 'Choose image',
                            style: AppTextStyle.s14w4i(
                              color: AppPallete.lighBlueGray,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
