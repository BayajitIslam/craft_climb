import 'package:craft_climb/core/constants/app_images.dart';
import 'package:craft_climb/core/theme/app_pallete.dart';
import 'package:craft_climb/core/theme/app_text_style.dart';
import 'package:craft_climb/core/utils/screen_size.dart';
import 'package:craft_climb/features/forum/presentation/pages/postdetail_page.dart';
import 'package:flutter/material.dart';

import 'createpost_page.dart';

class MyForumPostScreen extends StatefulWidget {
  const MyForumPostScreen({super.key});

  @override
  State<MyForumPostScreen> createState() => _MyForumPostScreenState();
}

class _MyForumPostScreenState extends State<MyForumPostScreen> {
  int _selectedNavIndex = 3; // Forum tab active

  final List<Map<String, dynamic>> _myPosts = [
    {
      'name': 'Nure Jannat Kashfi',
      'time': '2 min ago',
      'image': AppImages.post_image1,
      'profile': AppImages.profile_image1,
      'title': 'Building the Future with Smart Engineering',
      'description':
      'Innovative Civil Engineering Solutions That Shape Stronger, Safer, And Smarter Infrastructure. See More...',
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
      'likes': 12,
      'comments': 4,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.primary,
      appBar: _buildAppBar(context),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(
          horizontal: context.spacing16,
          vertical: context.spacing12,
        ),
        itemCount: _myPosts.length,
        separatorBuilder: (_, __) => SizedBox(height: context.spacing16),
        itemBuilder: (context, index) {
          final post = _myPosts[index];
          return _MyPostCard(
            post: post,
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
      bottomNavigationBar: _buildBottomNav(context),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppPallete.primary,
      elevation: 0,
      leading: Padding(
        padding: EdgeInsets.only(left: context.spacing12),
        child: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppPallete.border),
            ),
            child: const Icon(Icons.arrow_back_ios_new,
                size: 14, color: AppPallete.bodyText),
          ),
        ),
      ),
      title: Text(
        'My Forum Post',
        style: AppTextStyle.s24w7i(color: AppPallete.bodyText, fontSize: 18),
      ),
      centerTitle: true,
      actions: [
        Padding(
          padding: EdgeInsets.only(right: context.spacing16),
          child: ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => CreatePostScreen()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppPallete.accent,
              padding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
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
    );
  }

  Widget _buildBottomNav(BuildContext context) {
    final List<Map<String, dynamic>> navItems = [
      {'icon': Icons.home_outlined, 'activeIcon': Icons.home, 'label': 'Home'},
      {
        'icon': Icons.work_outline,
        'activeIcon': Icons.work,
        'label': 'Jobs'
      },
      {
        'icon': Icons.build_outlined,
        'activeIcon': Icons.build,
        'label': 'Tools'
      },
      {
        'icon': Icons.forum_outlined,
        'activeIcon': Icons.forum,
        'label': 'Forum'
      },
      {
        'icon': Icons.track_changes_outlined,
        'activeIcon': Icons.track_changes,
        'label': 'Career Hub'
      },
      {
        'icon': Icons.person_outline,
        'activeIcon': Icons.person,
        'label': 'Account'
      },
    ];

    return Container(
      decoration: BoxDecoration(
        color: AppPallete.primary,
        boxShadow: [
          BoxShadow(
            color: AppPallete.dropShadow,
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(navItems.length, (index) {
              final item = navItems[index];
              final isSelected = _selectedNavIndex == index;
              return GestureDetector(
                onTap: () {
                  setState(() => _selectedNavIndex = index);
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      isSelected ? item['activeIcon'] : item['icon'],
                      color: isSelected
                          ? AppPallete.accent
                          : AppPallete.extraAsh,
                      size: 22,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      item['label'],
                      style: AppTextStyle.s14w4i(
                        color: isSelected
                            ? AppPallete.accent
                            : AppPallete.extraAsh,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

class _MyPostCard extends StatelessWidget {
  final Map<String, dynamic> post;
  final VoidCallback onTap;

  const _MyPostCard({required this.post, required this.onTap});

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