import 'package:craft_climb/core/constants/app_images.dart';
import 'package:craft_climb/core/theme/app_pallete.dart';
import 'package:craft_climb/core/theme/app_text_style.dart';
import 'package:craft_climb/core/utils/screen_size.dart';
import 'package:flutter/material.dart';

class PostDetailScreen extends StatefulWidget {
  final Map<String, dynamic> post;

  const PostDetailScreen({super.key, required this.post});

  @override
  State<PostDetailScreen> createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  final TextEditingController _commentController = TextEditingController();

  final List<Map<String, dynamic>> _comments = [
    {
      'name': 'Courtney Henry',
      'profile': AppImages.profile_image2,
      'text':
      'Wishing you all the confidence and self-love on your skincare journey! You\'ve got this — healing takes time, but every step forward counts. 🙌',
      'time': '20s',
      'isAccent': true,
    },
    {
      'name': 'Ronald Richards',
      'profile': AppImages.profile_image3,
      'text': 'Thank you so much, that really means a lot to me 🙏',
      'time': '6h',
      'isAccent': false,
    },
  ];

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.primary,
      body: Column(
        children: [

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image + Floating AppBar
                  Stack(
                    children: [
                      // Post Image
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          widget.post['image'],
                          width: double.infinity,
                          height: 220,
                          fit: BoxFit.cover,
                        ),
                      ),

                      // Floating AppBar
                      Positioned(
                        top: MediaQuery.of(context).padding.top + 8, // safe area
                        left: 16,
                        right: 16,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Back Button
                            GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: Container(
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(
                                  color: AppPallete.primary,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppPallete.dropShadow,
                                      blurRadius: 4,
                                    ),
                                  ],
                                ),
                                child: const Icon(Icons.arrow_back_ios_new,
                                    size: 14, color: AppPallete.bodyText),
                              ),
                            ),

                            // Notification / Bookmark
                            Container(
                              width: 32,
                              height: 32,
                              decoration: BoxDecoration(
                                color: AppPallete.primary,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: AppPallete.dropShadow,
                                    blurRadius: 4,
                                  ),
                                ],
                              ),
                              child: const Icon(Icons.notifications_none,
                                  size: 16, color: AppPallete.bodyText),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  // Post content below image
                  Padding(
                    padding: EdgeInsets.all(context.spacing16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title
                        Text(
                          widget.post['title'],
                          style: AppTextStyle.s16w4i(
                            color: AppPallete.bodyText,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: context.spacing8),

                        // Description
                        Text(
                          'Innovative Civil Engineering Solutions That Shape Stronger, Safer, And Smarter Infrastructure. Innovative Civil Engineering Solutions That Shape Stronger, Safer, And Smarter Infrastructure.',
                          style: AppTextStyle.s14w4i(
                            color: AppPallete.subTextColor,
                            fontSize: 13,
                          ),
                        ),
                        SizedBox(height: context.spacing8),
                        Text(
                          'Innovative Civil Engineering Solutions That Shape Stronger, Safer, And Smarter Infrastructure. Innovative Civil Engineering Solutions That Shape Stronger, Safer, And Smarter Infrastructure.',
                          style: AppTextStyle.s14w4i(
                            color: AppPallete.subTextColor,
                            fontSize: 13,
                          ),
                        ),

                        SizedBox(height: context.spacing16),
                        Divider(color: AppPallete.stroke),
                        SizedBox(height: context.spacing8),

                        // Comments
                        ..._comments.map((c) => _CommentTile(comment: c)),
                      ],
                    ),
                  ),
                ],
              )
            ),
          ),

          // Comment Input
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: context.spacing16,
              vertical: context.spacing12,
            ),
            decoration: BoxDecoration(
              color: AppPallete.primary,
              border: Border(
                  top: BorderSide(color: AppPallete.stroke)),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundImage: AssetImage(AppImages.profile_image1),
                ),
                SizedBox(width: context.spacing8),
                Expanded(
                  child: SizedBox(
                    height: 40, // ⭐ height control
                    child: TextField(
                      controller: _commentController,
                      style: AppTextStyle.s14w4i(
                        color: AppPallete.bodyText,
                        fontSize: 13,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Type here...',
                        hintStyle: AppTextStyle.s14w4i(
                          color: AppPallete.lighBlueGray,
                          fontSize: 13,
                        ),
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                      ),
                    ),
                  ),
                ),
                Icon(
                  Icons.send,
                  color: AppPallete.accent,
                  size: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: context.spacing16, vertical: context.spacing8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: AppPallete.primary,
                shape: BoxShape.circle,
                border: Border.all(color: AppPallete.border),
              ),
              child: const Icon(Icons.arrow_back_ios_new,
                  size: 14, color: AppPallete.bodyText),
            ),
          ),
          Text(
            'Checkout',
            style: AppTextStyle.s24w7i(
                color: AppPallete.bodyText, fontSize: 18),
          ),
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: AppPallete.primary,
              shape: BoxShape.circle,
              border: Border.all(color: AppPallete.border),
            ),
            child: const Icon(Icons.notifications_none,
                size: 16, color: AppPallete.extraAsh),
          ),
        ],
      ),
    );
  }
}

class _CommentTile extends StatelessWidget {
  final Map<String, dynamic> comment;

  const _CommentTile({required this.comment});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: context.spacing12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 16,
            backgroundImage: AssetImage(comment['profile']),
          ),
          SizedBox(width: context.spacing8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  comment['name'],
                  style: AppTextStyle.s14w4i(
                    color: comment['isAccent']
                        ? AppPallete.accent
                        : AppPallete.bodyText,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  comment['text'],
                  style: AppTextStyle.s14w4i(
                    color: AppPallete.subTextColor,
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Reply · ${comment['time']}',
                  style: AppTextStyle.s14w4i(
                    color: AppPallete.lighBlueGray,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}