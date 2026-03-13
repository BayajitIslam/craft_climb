import 'package:flutter/material.dart';

import '../../../../core/theme/app_pallete.dart';
import '../../../../core/theme/app_text_style.dart';
import '../../../../core/utils/screen_size.dart';

class PostCard extends StatelessWidget {
  final Map<String, dynamic> post;
  final VoidCallback onLike;
  final VoidCallback onTap;

  const PostCard({
    Key? key,
    required this.post,
    required this.onLike,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppPallete.primary,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppPallete.dropShadow,
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: context.spacing12,
                  vertical: context.spacing8),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 18,
                    backgroundImage: AssetImage(post['profile']),
                  ),
                  SizedBox(width: context.spacing8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          post['name'],
                          style: AppTextStyle.s14w4i(
                            color: AppPallete.bodyText,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          post['time'],
                          style: AppTextStyle.s14w4i(
                            color: AppPallete.subTextColor,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(Icons.more_vert,
                      color: AppPallete.extraAsh, size: 18),
                ],
              ),
            ),

            // Post Image
            ClipRRect(
              child: Image.asset(
                post['image'],
                width: double.infinity,
                height: 170,
                fit: BoxFit.cover,
              ),
            ),

            // Content
            Padding(
              padding: EdgeInsets.all(context.spacing12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post['title'],
                    style: AppTextStyle.s14w4i(
                      color: AppPallete.bodyText,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    post['description'],
                    style: AppTextStyle.s14w4i(
                      color: AppPallete.subTextColor,
                      fontSize: 12,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: context.spacing8),

                  // Likes & Comments count
                  Row(
                    children: [
                      Icon(Icons.favorite_border,
                          size: 16, color: AppPallete.extraAsh),
                      SizedBox(width: 4),
                      Text(
                        '${post['likes']}',
                        style: AppTextStyle.s14w4i(
                          color: AppPallete.extraAsh,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(width: context.spacing16),
                      Icon(Icons.chat_bubble_outline,
                          size: 16, color: AppPallete.extraAsh),
                      SizedBox(width: 4),
                      Text(
                        '${post['comments']}',
                        style: AppTextStyle.s14w4i(
                          color: AppPallete.extraAsh,
                          fontSize: 12,
                        ),
                      ),
                    ],
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