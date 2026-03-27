import 'package:craft_climb/core/theme/app_pallete.dart';
import 'package:craft_climb/core/theme/app_text_style.dart';
import 'package:craft_climb/core/utils/app_bg.dart';
import 'package:craft_climb/core/utils/screen_size.dart';
import 'package:craft_climb/features/forum/presentation/pages/create_post_page.dart';
import 'package:craft_climb/features/forum/presentation/pages/post_detail_page.dart';
import 'package:craft_climb/features/forum/presentation/widgets/post_card.dart';
import 'package:flutter/material.dart';

class MyForumPostPage extends StatefulWidget {
  static Route route() =>
      MaterialPageRoute(builder: (_) => const MyForumPostPage());
  const MyForumPostPage({super.key});

  @override
  State<MyForumPostPage> createState() => _MyForumPostPageState();
}

class _MyForumPostPageState extends State<MyForumPostPage> {
  final List<Map<String, dynamic>> _myPosts = [
    {
      'name': 'Nure Jannat Kashfi',
      'username': 'nure_j',
      'location': 'Dhaka, Bangladesh',
      'verified': false,
      'time': '2 min ago',
      'image':
          'https://images.unsplash.com/photo-1504307651254-35680f356dfd?w=600',
      'images': [
        'https://images.unsplash.com/photo-1504307651254-35680f356dfd?w=600',
        'https://images.unsplash.com/photo-1590674899484-d5640e854abe?w=600',
      ],
      'profile':
          'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=100',
      'title': 'Building the Future with Smart Engineering',
      'caption': 'Building the Future with Smart Engineering',
      'description': 'Innovative Civil Engineering Solutions...',
      'likedBy': 'craig_love',
      'likes': 12,
      'comments': 4,
      'liked': false,
      'saved': false,
      'date': 'September 19',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBg(
        child: Column(
          children: [
            // appbar with create post button
            _MyForumAppBar(
              onCreatePost: () =>
                  Navigator.push(context, CreatePostPage.route()),
            ),

            // posts list
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.symmetric(
                  horizontal: context.spacing16,
                  vertical: context.spacing16,
                ),
                itemCount: _myPosts.length,
                separatorBuilder: (_, _) => SizedBox(height: context.spacing16),
                itemBuilder: (_, index) {
                  final post = _myPosts[index];
                  return PostCard(
                    post: post,
                    onLike: () => setState(() {
                      _myPosts[index]['liked'] = !_myPosts[index]['liked'];
                      _myPosts[index]['likes'] += _myPosts[index]['liked']
                          ? 1
                          : -1;
                    }),
                    onTap: () => Navigator.push(
                      context,
                      PostDetailPage.route(post: post),
                    ),
                    onSave: () => setState(() {
                      _myPosts[index]['saved'] = !_myPosts[index]['saved'];
                    }),
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

// appbar with create post action
class _MyForumAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onCreatePost;

  const _MyForumAppBar({required this.onCreatePost});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leadingWidth: 52,
      forceMaterialTransparency: true,
      leading: Padding(
        padding: EdgeInsets.only(left: context.spacing12),
        child: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(color: AppPallete.accent10),
              boxShadow: [
                BoxShadow(
                  color: AppPallete.dropShadow,
                  blurRadius: 4,
                  offset: const Offset(0, 2),
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
        'My Posts',
        style: AppTextStyle.s16w4i(
          fontWeight: FontWeight.w700,
          color: AppPallete.black,
        ),
      ),
      centerTitle: true,
      actions: [
        Padding(
          padding: EdgeInsets.only(right: context.spacing16),
          child: GestureDetector(
            onTap: onCreatePost,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: AppPallete.accent,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.add, color: Colors.white, size: 14),
                  const SizedBox(width: 4),
                  Text(
                    'Create Post',
                    style: AppTextStyle.s12w4i(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
