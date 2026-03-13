import 'package:craft_climb/core/theme/app_pallete.dart';
import 'package:craft_climb/core/theme/app_text_style.dart';
import 'package:craft_climb/core/utils/app_bg.dart';
import 'package:craft_climb/core/widgets/primary_button.dart';
import 'package:craft_climb/core/widgets/secand_app_bar.dart';
import 'package:flutter/material.dart';

class DesirePositionPage extends StatefulWidget {
  static Route route() =>
      MaterialPageRoute(builder: (_) => const DesirePositionPage());
  const DesirePositionPage({super.key});

  @override
  State<DesirePositionPage> createState() => _DesirePositionPageState();
}

class _DesirePositionPageState extends State<DesirePositionPage> {
  final TextEditingController _searchController = TextEditingController();
  String _query = '';

  final List<String> _allPositions = [
    'UI/UX',
    'UI/UX Designer',
    'UI Designer',
    'UI Designer Website',
    'UI Designer App',
    'Front End Engineer',
    'Back End Engineer',
    'Mobile Developer',
    'Project Manager',
    'Civil Engineer',
  ];

  List<String> get _filtered => _query.isEmpty
      ? []
      : _allPositions
            .where((p) => p.toLowerCase().contains(_query.toLowerCase()))
            .toList();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBg(
        child: Column(
          children: [
            SecandAppBar(title: 'Desire Position'),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ── Label ──
                    Text(
                      'Position',
                      style: AppTextStyle.s16w4i(
                        color: AppPallete.black75,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 6),

                    // ── Search Field ──
                    TextField(
                      controller: _searchController,
                      onChanged: (v) => setState(() => _query = v),
                      decoration: InputDecoration(
                        hintText: 'Type Here...',
                        hintStyle: AppTextStyle.s14w4i(
                          color: Colors.grey.shade400,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 12,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: _filtered.isEmpty
                              ? BorderRadius.circular(12)
                              : const BorderRadius.vertical(
                                  top: Radius.circular(12),
                                ),
                          borderSide: BorderSide(color: Colors.grey.shade200),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: _filtered.isEmpty
                              ? BorderRadius.circular(12)
                              : const BorderRadius.vertical(
                                  top: Radius.circular(12),
                                ),
                          borderSide: BorderSide(color: Colors.grey.shade200),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: _filtered.isEmpty
                              ? BorderRadius.circular(12)
                              : const BorderRadius.vertical(
                                  top: Radius.circular(12),
                                ),
                          borderSide: BorderSide(color: AppPallete.accent),
                        ),
                      ),
                    ),

                    // ── Dropdown suggestions ──
                    if (_filtered.isNotEmpty)
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.vertical(
                            bottom: Radius.circular(12),
                          ),
                          border: Border.all(color: Colors.grey.shade200),
                        ),
                        child: Column(
                          children: _filtered.map((pos) {
                            final isLast = pos == _filtered.last;
                            return Column(
                              children: [
                                GestureDetector(
                                  onTap: () => setState(() {
                                    _searchController.text = pos;
                                    _query = '';
                                  }),
                                  child: Container(
                                    color: Colors.transparent,
                                    width: double.infinity,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 14,
                                      vertical: 12,
                                    ),
                                    child: Text(
                                      pos,
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

                    const Spacer(),

                    // ── Save Button ──
                    PrimaryButton(
                      buttonName: 'Save',
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
