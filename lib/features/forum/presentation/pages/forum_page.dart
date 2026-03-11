
import 'package:craft_climb/core/constants/app_images.dart';
import 'package:craft_climb/core/theme/app_pallete.dart';
import 'package:craft_climb/core/theme/app_text_style.dart';
import 'package:craft_climb/core/utils/screen_size.dart';
import 'package:craft_climb/features/forum/presentation/pages/postdetail_page.dart';
import 'package:flutter/material.dart';

import '../widgets/postcard.dart';
import 'createpost_page.dart';

class ForumScreen extends StatefulWidget {
  const ForumScreen({super.key});

  @override
  State<ForumScreen> createState() => _ForumScreenState();
}

class _ForumScreenState extends State<ForumScreen> {
  final List<Map<String, dynamic>> _posts = [
    {
      'name': 'Nure Jannat Kashfi',
      'time': '2 min ago',
      'image': AppImages.post_image1,
      'profile': AppImages.profile_image1,
      'title': 'Building the Future with Smart Engineering',
      'description':
      'Innovative Civil Engineering Solutions That Shape Stronger, Safer, And Smarter Infrastructure. See More...',
      'liked': true,
      'likes': 12,
      'comments': 4,
    },
    {
      'name': 'Nure Jannat Kashfi',
      'time': '2 min ago',
      'image': AppImages.post_image2,
      'profile': AppImages.profile_image2,
      'title': 'Engineering Tomorrow\'s Infrastructure Today',
      'description':
      'From Planning To Execution, We Turn Ideas Into Lasting Structures.',
      'liked': false,
      'likes': 12,
      'comments': 4,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent, // transparent background
        leadingWidth: 56,
        leading: Padding(
          padding: EdgeInsets.only(left: context.spacing12),
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: Colors.white, // circular background
                shape: BoxShape.circle,
                border: Border.all(color: AppPallete.primary),
                boxShadow: [
                  BoxShadow(
                    color: AppPallete.dropShadow,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: const Icon(
                Icons.arrow_back_ios_new,
                size: 14,
                color: AppPallete.bodyText,
              ),
            ),
          ),
        ),
        title: Text(
          'Forum',
          style: AppTextStyle.s24w7i(
            color: AppPallete.bodyText,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: context.spacing16),
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const CreatePostScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppPallete.accent,
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              icon: const Icon(Icons.add, color: AppPallete.primary, size: 14),
              label: Text(
                'Create Post',
                style: AppTextStyle.s14w4i(
                  color: AppPallete.primary,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              AppImages.appBackground,
              fit: BoxFit.cover,
            ),
          ),

          // Foreground ListView
          ListView.separated(
            padding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16 + kToolbarHeight, // toolbar height offset
            ),
            itemCount: _posts.length,
            separatorBuilder: (_, __) => SizedBox(height: 16),
            itemBuilder: (context, index) {
              final post = _posts[index];
              return PostCard(
                post: post,
                onLike: () {
                  setState(() {
                    _posts[index]['liked'] = !_posts[index]['liked'];
                  });
                },
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => PostDetailScreen(post: post),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
