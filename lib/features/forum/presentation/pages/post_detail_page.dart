import 'package:craft_climb/core/theme/app_pallete.dart';
import 'package:craft_climb/core/theme/app_text_style.dart';
import 'package:craft_climb/core/utils/screen_size.dart';
import 'package:craft_climb/core/widgets/secand_app_bar.dart';
import 'package:flutter/material.dart';

class PostDetailPage extends StatefulWidget {
  final Map<String, dynamic> post;

  //route
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
      'name': 'Courtney Henry',
      'profile':
          'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=100',
      'text':
          'Wishing you all the confidence and self-love on your journey. Healing takes time, but every step forward counts.',
      'time': '20s',
      'isAccent': true,
    },
    {
      'name': 'Ronald Richards',
      'profile':
          'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=100',
      'text': 'Thank you so much, that really means a lot to me.',
      'time': '6h',
      'isAccent': false,
    },
    {
      'name': 'Anja Angelina',
      'profile':
          'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=100',
      'text':
          'Great insight. This is exactly what the industry needs right now.',
      'time': '1h',
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
      extendBodyBehindAppBar: true,
      appBar: SecandAppBar(title: ''),
      body: SafeArea(
        top: false,
        bottom: true,
        child: Column(
          children: [
            // scrollable content
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // hero image + floating appbar
                    Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16),
                        ),
                      ),
                      child: Image.network(
                        widget.post['image'],
                        width: double.infinity,
                        height: 336,
                        fit: BoxFit.cover,
                        errorBuilder: (_, _, _) => Container(
                          height: 336,
                          color: AppPallete.accent10,
                          child: Icon(
                            Icons.image_outlined,
                            color: AppPallete.accent,
                            size: 40,
                          ),
                        ),
                      ),
                    ),

                    // post content
                    Padding(
                      padding: EdgeInsets.all(context.spacing16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // title
                          Text(
                            widget.post['title'],
                            style: AppTextStyle.s16w4i(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: context.spacing8),

                          // description paragraph 1
                          Text(
                            'Innovative Civil Engineering Solutions That Shape Stronger, Safer, And Smarter Infrastructure. Innovative Civil Engineering Solutions That Shape Stronger, Safer, And Smarter Infrastructure.',
                            style: AppTextStyle.s14w4i(
                              color: AppPallete.bodyText,
                              fontSize: 13,
                            ),
                          ),
                          SizedBox(height: context.spacing8),

                          // description paragraph 2
                          Text(
                            'Innovative Civil Engineering Solutions That Shape Stronger, Safer, And Smarter Infrastructure. Innovative Civil Engineering Solutions That Shape Stronger, Safer, And Smarter Infrastructure.',
                            style: AppTextStyle.s14w4i(
                              color: AppPallete.bodyText,
                              fontSize: 13,
                            ),
                          ),

                          SizedBox(height: context.spacing16),

                          // like and comment count row
                          Row(
                            children: [
                              Icon(
                                widget.post['liked']
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: widget.post['liked']
                                    ? Colors.red
                                    : Colors.grey.shade400,
                                size: 20,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '${widget.post['likes']}',
                                style: AppTextStyle.s12w4i(
                                  color: Colors.grey.shade500,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Icon(
                                Icons.chat_bubble_outline,
                                color: Colors.grey.shade400,
                                size: 20,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '${widget.post['comments']}',
                                style: AppTextStyle.s12w4i(
                                  color: Colors.grey.shade500,
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: context.spacing16),
                          Divider(color: Colors.grey.shade200),
                          SizedBox(height: context.spacing8),

                          // comments section
                          ..._comments.map((c) => _CommentTile(comment: c)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // comment input bar
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: context.spacing16,
                vertical: context.spacing12,
              ),
              decoration: BoxDecoration(
                color: AppPallete.primary,
                border: Border(top: BorderSide(color: Colors.grey.shade200)),
              ),
              child: Row(
                children: [
                  // user avatar
                  CircleAvatar(
                    radius: 16,
                    backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=100',
                    ),
                    backgroundColor: AppPallete.accent10,
                  ),
                  SizedBox(width: context.spacing8),

                  // text field
                  Expanded(
                    child: SizedBox(
                      height: 40,
                      child: TextField(
                        controller: _commentController,
                        style: AppTextStyle.s14w4i(
                          color: AppPallete.bodyText,
                          fontSize: 13,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Type here...',
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
                  ),

                  // send button
                  GestureDetector(
                    onTap: () {
                      if (_commentController.text.trim().isEmpty) return;
                      setState(() {
                        _comments.add({
                          'name': 'You',
                          'profile':
                              'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=100',
                          'text': _commentController.text.trim(),
                          'time': 'just now',
                          'isAccent': true,
                        });
                        _commentController.clear();
                      });
                    },
                    child: Icon(Icons.send, color: AppPallete.accent, size: 20),
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

// single comment tile
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
            backgroundImage: NetworkImage(comment['profile']),
            backgroundColor: AppPallete.accent10,
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
                const SizedBox(height: 2),
                Text(
                  comment['text'],
                  style: AppTextStyle.s14w4i(
                    color: Colors.grey.shade600,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Reply · ${comment['time']}',
                  style: AppTextStyle.s14w4i(
                    color: Colors.grey.shade400,
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
