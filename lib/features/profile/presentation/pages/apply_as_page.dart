import 'package:craft_climb/core/theme/app_pallete.dart';
import 'package:craft_climb/core/theme/app_text_style.dart';
import 'package:craft_climb/core/utils/app_bg.dart';
import 'package:craft_climb/core/widgets/primary_button.dart';
import 'package:craft_climb/core/widgets/secand_app_bar.dart';
import 'package:flutter/material.dart';

class ApplyAsPage extends StatefulWidget {
  //Route
  static Route route({required String applyfor}) =>
      MaterialPageRoute(builder: (_) => ApplyAsPage(applyfor: applyfor));
  final String applyfor;
  const ApplyAsPage({super.key, required this.applyfor});

  @override
  State<ApplyAsPage> createState() => _ApplyAsPageState();
}

class _ApplyAsPageState extends State<ApplyAsPage> {
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _applicationController = TextEditingController();

  final List<String> _suggestions = [
    'Apply for the trainer profile',
    'I want to become a trainer',
    'I have 2 years exp. so i want to become trainer',
  ];

  bool _showSuggestions = false;

  @override
  void dispose() {
    _subjectController.dispose();
    _applicationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBg(
        child: Column(
          children: [
            SecandAppBar(title: 'Apply as a ${widget.applyfor}   '),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ── Subject Label ──
                    Text(
                      'Subject',
                      style: AppTextStyle.s16w4i(
                        color: AppPallete.black75,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 6),

                    // ── Subject Field + Suggestions ──
                    TextField(
                      controller: _subjectController,
                      onTap: () => setState(() => _showSuggestions = true),
                      onChanged: (_) => setState(() => _showSuggestions = true),
                      decoration: InputDecoration(
                        hintText: 'Type Here......',
                        hintStyle: AppTextStyle.s16w4i(
                          color: AppPallete.black75,
                          fontWeight: FontWeight.w500,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 12,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: _showSuggestions
                              ? const BorderRadius.vertical(
                                  top: Radius.circular(12),
                                )
                              : BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.grey.shade200),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: _showSuggestions
                              ? const BorderRadius.vertical(
                                  top: Radius.circular(12),
                                )
                              : BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.grey.shade200),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: _showSuggestions
                              ? const BorderRadius.vertical(
                                  top: Radius.circular(12),
                                )
                              : BorderRadius.circular(12),
                          borderSide: BorderSide(color: AppPallete.accent),
                        ),
                      ),
                    ),

                    // ── Suggestions Below ──
                    if (_showSuggestions)
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.vertical(
                            bottom: Radius.circular(12),
                          ),
                          border: Border.all(color: Colors.grey.shade200),
                        ),
                        child: Column(
                          children: _suggestions.map((s) {
                            final isLast = s == _suggestions.last;
                            return Column(
                              children: [
                                GestureDetector(
                                  onTap: () => setState(() {
                                    _subjectController.text = s;
                                    _showSuggestions = false;
                                  }),
                                  child: Container(
                                    color: Colors.transparent,
                                    width: double.infinity,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 14,
                                      vertical: 12,
                                    ),
                                    child: Text(
                                      s,
                                      style: AppTextStyle.s14w4i(),
                                    ),
                                  ),
                                ),
                                if (!isLast)
                                  Divider(
                                    height: 1,
                                    color: Colors.grey.shade100,
                                    indent: 14,
                                    endIndent: 14,
                                  ),
                              ],
                            );
                          }).toList(),
                        ),
                      ),
                    const SizedBox(height: 16),

                    // ── Application Label ──
                    Text(
                      'Application',
                      style: AppTextStyle.s16w4i(
                        color: AppPallete.black75,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 6),

                    // ── Application Field ──
                    Expanded(
                      child: TextField(
                        controller: _applicationController,
                        maxLines: null,
                        expands: true,
                        textAlignVertical: TextAlignVertical.top,
                        onTap: () => setState(() => _showSuggestions = false),
                        decoration: InputDecoration(
                          hintText: 'Type Here......',
                          hintStyle: AppTextStyle.s16w4i(
                            color: AppPallete.black75,
                            fontWeight: FontWeight.w500,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.all(14),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.grey.shade200),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.grey.shade200),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: AppPallete.accent),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // ── Send Button ──
                    PrimaryButton(
                      buttonName: 'Send',
                      onPressed: () => Navigator.pop(context),
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
