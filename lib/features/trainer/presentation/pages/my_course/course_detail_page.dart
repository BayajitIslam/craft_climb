import 'package:craft_climb/core/theme/app_pallete.dart';
import 'package:craft_climb/core/theme/app_text_style.dart';
import 'package:craft_climb/core/utils/app_bg.dart';
import 'package:craft_climb/core/utils/screen_size.dart';
import 'package:craft_climb/core/widgets/primary_button.dart';
import 'package:craft_climb/core/widgets/secand_app_bar.dart';
import 'package:craft_climb/features/trainer/presentation/pages/my_course/edit_course_page.dart';
import 'package:craft_climb/features/trainer/presentation/pages/my_course/module_page.dart';
import 'package:craft_climb/features/trainer/presentation/widgets/module_tile.dart';
import 'package:flutter/material.dart';

class CourseDetailPage extends StatelessWidget {
  //ROUTE
  static Route route() =>
      MaterialPageRoute(builder: (context) => CourseDetailPage());

  const CourseDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBg(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero Image + AppBar ──────────────────────────────
            Stack(
              children: [
                Container(
                  height: 256,
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  width: double.infinity,
                  child: Image.network(
                    'https://images.unsplash.com/photo-1504307651254-35680f356dfd?q=80&w=2076&auto=format&fit=crop',
                    fit: BoxFit.cover,
                    errorBuilder: (_, _, _) => Container(
                      color: AppPallete.accentFB,
                      child: const Icon(
                        Icons.image_outlined,
                        color: AppPallete.indigoNavy,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: SecandAppBar(
                    title: 'Course Detail',
                    color: AppPallete.primary,
                  ),
                ),
              ],
            ),

            //  Title + Summary ───────────────────────────────────
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Construction Visit & Guidance',
                    maxLines: 2,
                    style: AppTextStyle.s24w7i(fontSize: 18),
                  ),
                  SizedBox(height: context.spacing12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Course Summary',
                        style: AppTextStyle.s16w4i(
                          fontWeight: FontWeight.w700,
                          color: AppPallete.bodyText,
                        ),
                      ),
                      Text(
                        '\$20',
                        style: AppTextStyle.s16w4i(
                          color: AppPallete.accent,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 6),
                  Text(
                    'To obtain a challenging position in a growth-oriented organization where I can apply my skills, contribute to meaningful projects, and continue developing professionally.',
                    style: AppTextStyle.s16w4i(color: AppPallete.extraAsh),
                  ),
                  SizedBox(height: context.spacing16),
                  Text('Modules', style: AppTextStyle.s24w7i(fontSize: 16)),
                  SizedBox(height: 8),
                ],
              ),
            ),

            // ── SCROLLABLE: Modules list ─────────────────────────────────
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: 4,
                itemBuilder: (context, index) => TrainerModuleTile(
                  title: 'Module ${index + 1}',
                  showEdit: true,
                  viewModulePress: () {
                    Navigator.push(context, ModulePage.route());
                  },
                  editPress: () {
                    Navigator.push(context, EditCoursePage.route());
                  },
                ),
              ),
            ),

            // Button pinned at bottom ───────────────────────────
            Padding(
              padding: EdgeInsets.fromLTRB(
                16,
                12,
                16,
                context.spacing16 + MediaQuery.of(context).padding.bottom,
              ),
              child: PrimaryButton(
                buttonName: 'Boost Course',
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
