import 'package:craft_climb/core/theme/app_pallete.dart';
import 'package:craft_climb/core/theme/app_text_style.dart';
import 'package:craft_climb/core/utils/screen_size.dart';
import 'package:craft_climb/core/widgets/secand_app_bar.dart';
import 'package:craft_climb/features/forum/presentation/widgets/post_card.dart';
import 'package:flutter/material.dart';

class PostDetailPage extends StatefulWidget {
  final Map<String, dynamic> post;

  static Route route({required Map<String, dynamic> post}) =>
      MaterialPageRoute(builder: (_) => PostDetailPage(post: post));

  const PostDetailPage({super.key, required this.post});

  @override
  State<PostDetailPage> createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {
  final TextEditingController _commentController = TextEditingController();

  final List<Map<String, dynamic>> _comments = [
    {
      'name': 'joshua_l',
      'profile':
          'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=100',
      'text':
          'Wishing you all the confidence and self-love on your journey. Healing takes time, but every step forward counts.',
      'time': '20s',
      'isAccent': true,
    },
    {
      'name': 'richard_jwel',
      'profile':
          'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=100',
      'text': 'Thank you so much, that really means a lot to me.',
      'time': '6h',
      'isAccent': false,
    },
  ];

  bool _liked = false;
  bool _saved = false;

  @override
  void initState() {
    super.initState();
    _liked = widget.post['liked'] ?? false;
    _saved = widget.post['saved'] ?? false;
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> images = List<String>.from(
      widget.post['images'] ?? [widget.post['image']],
    );

    return Scaffold(
      backgroundColor: Colors.white,

      body: Column(
        children: [
          // header
          SecandAppBar(title: 'Post'),
          // post
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // post header
                  PostHeader(post: widget.post),

                  // image grid
                  PostImageGrid(images: images),

                  // action row
                  PostActions(
                    post: {...widget.post, 'liked': _liked, 'saved': _saved},
                    onLike: () => setState(() => _liked = !_liked),
                    onSave: () => setState(() => _saved = !_saved),
                  ),

                  // likes
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: context.spacing16,
                    ),
                    child: RichText(
                      text: TextSpan(
                        style: AppTextStyle.s12w4i(color: Colors.black),
                        children: [
                          const TextSpan(text: 'Liked by '),
                          TextSpan(
                            text: widget.post['likedBy'],
                            style: const TextStyle(fontWeight: FontWeight.w700),
                          ),
                          TextSpan(text: ' and ${widget.post['likes']} others'),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),

                  // caption
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: context.spacing16,
                    ),
                    child: RichText(
                      text: TextSpan(
                        style: AppTextStyle.s12w4i(color: Colors.black),
                        children: [
                          TextSpan(
                            text: '${widget.post['username']}  ',
                            style: const TextStyle(fontWeight: FontWeight.w700),
                          ),
                          TextSpan(text: widget.post['caption']),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),

                  // date
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: context.spacing16,
                    ),
                    child: Text(
                      widget.post['date'],
                      style: AppTextStyle.s12w4i(
                        color: Colors.grey.shade400,
                        fontSize: 10,
                      ),
                    ),
                  ),

                  Divider(color: Colors.grey.shade200, height: 24),

                  // comments
                  ..._comments.map((c) => _CommentTile(comment: c)),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),

          // comment input
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: context.spacing16,
              vertical: context.spacing8,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(top: BorderSide(color: Colors.grey.shade200)),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundImage: const NetworkImage(
                    'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=100',
                  ),
                  backgroundColor: AppPallete.accent10,
                ),
                SizedBox(width: context.spacing8),
                Expanded(
                  child: TextField(
                    controller: _commentController,
                    style: AppTextStyle.s14w4i(fontSize: 13),
                    decoration: InputDecoration(
                      hintText: 'Add a comment...',
                      hintStyle: AppTextStyle.s14w4i(
                        color: Colors.grey.shade400,
                        fontSize: 13,
                      ),
                      border: InputBorder.none,
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 10,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (_commentController.text.trim().isEmpty) return;
                    setState(() {
                      _comments.add({
                        'name': 'you',
                        'profile':
                            'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=100',
                        'text': _commentController.text.trim(),
                        'time': 'just now',
                        'isAccent': true,
                      });
                      _commentController.clear();
                    });
                  },
                  child: Text(
                    'Post',
                    style: AppTextStyle.s14w4i(
                      color: AppPallete.accent,
                      fontWeight: FontWeight.w700,
                    ),
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

// single comment tile instagram style
class _CommentTile extends StatelessWidget {
  final Map<String, dynamic> comment;
  const _CommentTile({required this.comment});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.spacing16, vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 16,
            backgroundImage: NetworkImage(comment['profile']),
            backgroundColor: AppPallete.accent10,
          ),
          SizedBox(width: context.spacing8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: AppTextStyle.s12w4i(color: Colors.black),
                    children: [
                      TextSpan(
                        text: '${comment['name']}  ',
                        style: const TextStyle(fontWeight: FontWeight.w700),
                      ),
                      TextSpan(text: comment['text']),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      comment['time'],
                      style: AppTextStyle.s12w4i(
                        color: Colors.grey.shade400,
                        fontSize: 11,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      'Reply',
                      style: AppTextStyle.s12w4i(
                        color: Colors.grey.shade400,
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Icon(Icons.favorite_border, size: 14, color: Colors.grey.shade400),
        ],
      ),
    );
  }
}
