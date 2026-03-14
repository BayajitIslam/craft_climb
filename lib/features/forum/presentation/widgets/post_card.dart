import 'package:craft_climb/core/theme/app_pallete.dart';
import 'package:craft_climb/core/theme/app_text_style.dart';
import 'package:craft_climb/core/utils/screen_size.dart';
import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final Map<String, dynamic> post;
  final VoidCallback onLike;
  final VoidCallback onTap;

  const PostCard({
    super.key,
    required this.post,
    required this.onLike,
    required this.onTap,
  });

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
            // header
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.spacing12,
                vertical: context.spacing8,
              ),
              child: Row(
                children: [
                  //  NetworkImage
                  CircleAvatar(
                    radius: 18,
                    backgroundImage: NetworkImage(post['profile']),
                    backgroundColor: AppPallete.accent10,
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
                            color: Colors.grey.shade500,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(Icons.more_vert,
                      color: Colors.grey.shade400, size: 18),
                ],
              ),
            ),

            // Network post image
            ClipRRect(
              child: Image.network(
                post['image'],
                width: double.infinity,
                height: 170,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  height: 170,
                  color: AppPallete.accent10,
                  child: Icon(
                    Icons.image_outlined,
                    color: AppPallete.accent,
                    size: 40,
                  ),
                ),
              ),
            ),

            // content
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
                  const SizedBox(height: 4),
                  Text(
                    post['description'],
                    style: AppTextStyle.s14w4i(
                      color: Colors.grey.shade600,
                      fontSize: 12,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: context.spacing8),

                  // likes and comments row
                  Row(
                    children: [
                      GestureDetector(
                        onTap: onLike,
                        child: Icon(
                          post['liked'] == true
                              ? Icons.favorite
                              : Icons.favorite_border,
                          size: 16,
                          color: post['liked'] == true
                              ? Colors.red
                              : Colors.grey.shade400,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${post['likes']}',
                        style: AppTextStyle.s14w4i(
                          color: Colors.grey.shade400,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(width: context.spacing16),
                      Icon(Icons.chat_bubble_outline,
                          size: 16, color: Colors.grey.shade400),
                      const SizedBox(width: 4),
                      Text(
                        '${post['comments']}',
                        style: AppTextStyle.s14w4i(
                          color: Colors.grey.shade400,
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