import 'package:craft_climb/core/theme/app_pallete.dart';
import 'package:craft_climb/core/theme/app_text_style.dart';
import 'package:craft_climb/core/widgets/forward_arrow_button.dart';
import 'package:flutter/material.dart';

class JobCard extends StatelessWidget {
  final String title;
  final String location;
  final String daysLeft;
  final String salary;
  final VoidCallback onTap;

  const JobCard({
    super.key,
    required this.title,
    required this.location,
    required this.daysLeft,
    required this.salary,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(8),
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
            // Image
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                'https://images.unsplash.com/photo-1504307651254-35680f356dfd?w=200',
                height: 80,
                width: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),

            // Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyle.s14w4i(
                      fontWeight: FontWeight.w700,
                      color: AppPallete.bodyText,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    location,
                    style: AppTextStyle.s14w4i(
                      color: AppPallete.bodyText,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        size: 12,
                        color: AppPallete.accent,
                        fontWeight: FontWeight.w600,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        daysLeft,
                        style: AppTextStyle.s14w4i(
                          color: AppPallete.accent,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 12),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFF1F5F9),
                      borderRadius: BorderRadius.circular(2),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 4),
                    child: Text(
                      salary,
                      style: AppTextStyle.s14w4i(
                        color: AppPallete.bodyText,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Arrow
            ForwardArrowButton(),
          ],
        ),
      ),
    );
  }
}
