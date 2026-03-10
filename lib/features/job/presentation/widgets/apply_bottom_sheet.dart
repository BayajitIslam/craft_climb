import 'package:craft_climb/core/theme/app_pallete.dart';
import 'package:craft_climb/core/theme/app_text_style.dart';
import 'package:craft_climb/core/widgets/primary_button.dart';
import 'package:craft_climb/features/job/presentation/widgets/jobs_textfield.dart';
import 'package:flutter/material.dart';

class ApplyBottomSheet extends StatefulWidget {
  const ApplyBottomSheet({super.key});

  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => const ApplyBottomSheet(),
    );
  }

  @override
  State<ApplyBottomSheet> createState() => _ApplyBottomSheetState();
}

class _ApplyBottomSheetState extends State<ApplyBottomSheet> {
  String? _fileName;
  final TextEditingController _salaryController = TextEditingController(
    text: '\$38000',
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        20,
        12,
        20,
        MediaQuery.of(context).viewInsets.bottom + 28,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFEAF2FF), Colors.white],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Drag Handle ──
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 14),

          // ── Header ──
          Stack(
            alignment: Alignment.center,
            children: [
              Center(
                child: Text(
                  'Apply online for this role',
                  style: AppTextStyle.s24w7i(fontSize: 20),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    height: 22,
                    width: 22,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.close,
                      size: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // ── Previous Resume ──
          Text(
            'Previous Resume',
            style: AppTextStyle.s16w4i(
              fontWeight: FontWeight.w500,
              color: AppPallete.black75,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ovie_rahaman-CV.pdf',
                        style: AppTextStyle.s14w4i(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        '13 January 2025',
                        style: AppTextStyle.s14w4i(
                          color: AppPallete.bodyText,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: AppPallete.accent,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.check, color: Colors.white, size: 18),
                ),
              ],
            ),
          ),

          const SizedBox(height: 18),

          // ── Upload New Resume ──
          Text(
            'Upload New Resume',
            style: AppTextStyle.s16w4i(
              fontWeight: FontWeight.w500,
              color: AppPallete.black75,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: AppPallete.primary,
              border: Border.all(color: AppPallete.border),
            ),
            padding: EdgeInsets.all(4),
            child: Container(
              decoration: BoxDecoration(
                color: AppPallete.primary,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      // TODO: integrate file picker
                      setState(() => _fileName = 'MyResume.pdf');
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        'Choose',
                        style: AppTextStyle.s14w4i(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    _fileName ?? 'Choose file',
                    style: AppTextStyle.s14w4i(
                      color: _fileName != null
                          ? AppPallete.bodyText
                          : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 18),

          // ── Expected Salary ──
          Text(
            'Expected Salary',
            style: AppTextStyle.s16w4i(
              fontWeight: FontWeight.w500,
              color: AppPallete.black75,
            ),
          ),
          const SizedBox(height: 8),
          JobTextField(controller: _salaryController, hint: 'Expected salary'),

          const SizedBox(height: 24),

          // ── Submit ──
          PrimaryButton(buttonName: 'Submit', onPressed: () {}),
        ],
      ),
    );
  }
}
