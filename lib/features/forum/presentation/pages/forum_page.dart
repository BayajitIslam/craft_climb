import 'package:craft_climb/core/theme/app_pallete.dart';
import 'package:craft_climb/core/theme/app_text_style.dart';
import 'package:craft_climb/core/utils/app_bg.dart';
import 'package:craft_climb/core/utils/screen_size.dart';
import 'package:craft_climb/core/widgets/secand_app_bar.dart';
import 'package:craft_climb/features/forum/presentation/pages/create_post_page.dart';
import 'package:craft_climb/features/forum/presentation/pages/post_detail_page.dart';
import 'package:craft_climb/features/forum/presentation/widgets/post_card.dart';
import 'package:flutter/material.dart';

class ForumPage extends StatefulWidget {
  static Route route() => MaterialPageRoute(builder: (_) => const ForumPage());
  const ForumPage({super.key});

  @override
  State<ForumPage> createState() => _ForumPageState();
}

class _ForumPageState extends State<ForumPage> {
  final List<Map<String, dynamic>> _posts = [
    // ── pure VIDEO post ──────────────────────────────────────────
    {
      'type': 'video',
      'username': 'joshua_l',
      'location': 'Tokyo, Japan',
      'verified': true,
      'profile':
          'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=100',
      'thumbnail': 'https://www.pexels.com/download/video/4430419/',
      'duration': '0:42',
      'likedBy': 'craig_love',
      'likes': 7,
      'caption': 'Climbing session highlights from Tokyo!',
      'date': 'September 19',
      'liked': false,
      'saved': false,
    },

    // ── MIXED post (images + videos) ────────────────────────────
    {
      'type': 'mixed',
      'username': 'nure_j',
      'location': 'Dhaka, Bangladesh',
      'verified': false,
      'profile':
          'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=100',
      'media': [
        {
          'url':
              'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=400',
          'isVideo': false,
        },
        {
          'url': 'https://www.pexels.com/download/video/4430419/',
          'isVideo': true,
          'duration': '1:15',
        },
        {
          'url':
              'https://images.unsplash.com/photo-1541888946425-d81bb19240f5?w=400',
          'isVideo': false,
        },
        {
          'url': 'https://www.pexels.com/download/video/4430419/',
          'isVideo': true,
          'duration': '0:30',
        },
      ],
      'likedBy': 'raham_alam',
      'likes': 1240,
      'caption': 'Building the Future with Smart Engineering solutions.',
      'date': 'September 20',
      'liked': true,
      'saved': false,
    },

    // ── JOB post ────────────────────────────────────────────────
    {
      'type': 'job',
      'username': 'RockCraft Co.',
      'location': 'Hiring · Remote',
      'verified': true,
      'profile':
          'https://images.unsplash.com/photo-1560179707-f14e90ef3623?w=100',
      'job': {
        'title': 'Senior Flutter Developer',
        'location': 'Remote',
        'jobType': 'Full-time',
        'salary': '\$80k–\$120k',
        'skills': ['Flutter', 'Dart', 'Firebase'],
        'applicants': 47,
        'postedAt': '3 days ago',
      },
      'likedBy': 'alex_dev',
      'likes': 23,
      'caption': "We're hiring! Join our team and build something amazing.",
      'date': 'September 21',
      'liked': false,
      'saved': false,
    },

    // ── pure IMAGE post (unchanged) ─────────────────────────────
    {
      'type': 'image',
      'username': 'joshua_l',
      'location': 'Tokyo, Japan',
      'verified': true,
      'profile':
          'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=100',
      'images': [
        'https://images.unsplash.com/photo-1504307651254-35680f356dfd?w=400',
        'https://images.unsplash.com/photo-1541888946425-d81bb19240f5?w=400',
        'https://images.unsplash.com/photo-1590674899484-d5640e854abe?w=400',
      ],
      'likedBy': 'craig_love',
      'likes': 7,
      'caption': 'The game in Japan was amazing!',
      'date': 'September 19',
      'liked': false,
      'saved': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: AppBg(
        child: Column(
          children: [
            // top appbar
            SecandAppBar(title: 'Forum'),

            // create post input bar
            _CreatePostBar(
              onTap: () => Navigator.push(context, CreatePostPage.route()),
            ),

            Divider(height: 1, color: Colors.grey.shade200),

            // posts feed
            Expanded(
              child: ListView.separated(
                // padding: EdgeInsets.symmetric(horizontal: context.spacing16),
                itemCount: _posts.length,
                separatorBuilder: (_, _) =>
                    Divider(height: 1, color: Colors.grey.shade200),
                itemBuilder: (_, index) {
                  final post = _posts[index];
                  return PostCard(
                    post: post,
                    onLike: () => setState(() {
                      _posts[index]['liked'] = !_posts[index]['liked'];
                      _posts[index]['likes'] += _posts[index]['liked'] ? 1 : -1;
                    }),
                    onSave: () => setState(() {
                      _posts[index]['saved'] = !_posts[index]['saved'];
                    }),
                    onTap: () => Navigator.push(
                      context,
                      PostDetailPage.route(post: post),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// instagram style create post bar
class _CreatePostBar extends StatelessWidget {
  final VoidCallback onTap;
  const _CreatePostBar({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.spacing16,
        vertical: context.spacing8,
      ),
      child: Row(
        children: [
          // user avatar
          CircleAvatar(
            radius: 18,
            backgroundImage: const NetworkImage(
              'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=100',
            ),
            backgroundColor: AppPallete.accent10,
          ),
          SizedBox(width: context.spacing12),

          // input box
          Expanded(
            child: GestureDetector(
              onTap: onTap,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Text(
                  "What's on your mind?",
                  style: AppTextStyle.s14w4i(color: Colors.grey.shade500),
                ),
              ),
            ),
          ),
          SizedBox(width: context.spacing8),

          // post button
          GestureDetector(
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: AppPallete.accent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'Post',
                style: AppTextStyle.s14w4i(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
