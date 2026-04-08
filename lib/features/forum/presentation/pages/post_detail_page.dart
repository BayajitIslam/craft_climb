import 'package:craft_climb/core/theme/app_pallete.dart';
import 'package:craft_climb/core/theme/app_text_style.dart';
import 'package:craft_climb/core/utils/screen_size.dart';
import 'package:craft_climb/core/widgets/secand_app_bar.dart';
import 'package:craft_climb/features/forum/presentation/widgets/post_card.dart';
import 'package:craft_climb/features/forum/presentation/widgets/post_media_item.dart';
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
  final ScrollController _scrollController = ScrollController();

  late bool _liked;
  late bool _saved;
  late int _likeCount;

  final List<Map<String, dynamic>> _comments = [
    {
      'name': 'joshua_l',
      'profile':
          'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=100',
      'text': 'Wishing you all the confidence and self-love on your journey!',
      'time': '20s',
      'liked': false,
    },
    {
      'name': 'richard_jwel',
      'profile':
          'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=100',
      'text': 'Thank you so much, that really means a lot to me.',
      'time': '6h',
      'liked': false,
    },
  ];

  @override
  void initState() {
    super.initState();
    _liked = widget.post['liked'] as bool? ?? false;
    _saved = widget.post['saved'] as bool? ?? false;
    _likeCount = widget.post['likes'] as int? ?? 0;
  }

  @override
  void dispose() {
    _commentController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  // resolve the correct media list for any post type
  List<PostMediaItem> get _mediaItems {
    final String type = widget.post['type'] as String? ?? 'image';
    switch (type) {
      case 'video':
        return [PostMediaItem.fromVideoPost(widget.post)];
      case 'mixed':
        return PostMediaItem.fromMediaList(widget.post['media'] as List);
      case 'job':
        return []; // job uses JobCard, not media
      default:
        return PostMediaItem.fromImageList(widget.post['images'] as List);
    }
  }

  void _submitComment() {
    final text = _commentController.text.trim();
    if (text.isEmpty) return;
    setState(() {
      _comments.add({
        'name': 'you',
        'profile':
            'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=100',
        'text': text,
        'time': 'just now',
        'liked': false,
      });
      _commentController.clear();
    });
    // auto-scroll to bottom after adding
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final String type = widget.post['type'] as String? ?? 'image';

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // ── app bar ──────────────────────────────────────────
            SecandAppBar(title: 'Post'),

            // ── scrollable body ──────────────────────────────────
            Expanded(
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // header
                    PostHeader(post: widget.post),

                    // media — image / video / mixed
                    if (type != 'job' && _mediaItems.isNotEmpty)
                      PostMediaGrid(items: _mediaItems, singleHeight: 320),

                    // job card
                    if (type == 'job') JobCard(post: widget.post),

                    // action row
                    PostActions(
                      post: {...widget.post, 'liked': _liked, 'saved': _saved},
                      onLike: () => setState(() {
                        _liked = !_liked;
                        _likeCount += _liked ? 1 : -1;
                      }),
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
                              text: widget.post['likedBy'] as String,
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            TextSpan(text: ' and $_likeCount others'),
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
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            TextSpan(text: widget.post['caption'] as String),
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
                        widget.post['date'] as String,
                        style: AppTextStyle.s12w4i(
                          color: Colors.grey.shade400,
                          fontSize: 10,
                        ),
                      ),
                    ),

                    Divider(color: Colors.grey.shade200, height: 24),

                    // comments label
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: context.spacing16,
                      ),
                      child: Text(
                        'Comments',
                        style: AppTextStyle.s14w4i(
                          color: Colors.grey.shade500,
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),

                    // comment list
                    ..._comments.asMap().entries.map(
                      (e) => _CommentTile(
                        comment: e.value,
                        onLike: () => setState(() {
                          _comments[e.key]['liked'] =
                              !(_comments[e.key]['liked'] as bool);
                        }),
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),

            // ── comment input ─────────────────────────────────────
            _CommentInput(
              controller: _commentController,
              onSubmit: _submitComment,
            ),
          ],
        ),
      ),
    );
  }
}

// ─── comment tile ─────────────────────────────────────────────────────────────

class _CommentTile extends StatelessWidget {
  final Map<String, dynamic> comment;
  final VoidCallback onLike;
  const _CommentTile({required this.comment, required this.onLike});

  @override
  Widget build(BuildContext context) {
    final bool liked = comment['liked'] as bool? ?? false;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.spacing16, vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 16,
            backgroundImage: NetworkImage(comment['profile'] as String),
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
                      TextSpan(text: comment['text'] as String),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Text(
                      comment['time'] as String,
                      style: AppTextStyle.s12w4i(
                        color: Colors.grey.shade400,
                        fontSize: 11,
                      ),
                    ),
                    const SizedBox(width: 14),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Reply',
                        style: AppTextStyle.s12w4i(
                          color: Colors.grey.shade500,
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: onLike,
            child: Column(
              children: [
                Icon(
                  liked ? Icons.favorite : Icons.favorite_border,
                  size: 14,
                  color: liked ? Colors.red : Colors.grey.shade400,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─── comment input bar ────────────────────────────────────────────────────────

class _CommentInput extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSubmit;
  const _CommentInput({required this.controller, required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return Container(
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
              controller: controller,
              style: AppTextStyle.s14w4i(fontSize: 13),
              textInputAction: TextInputAction.send,
              onSubmitted: (_) => onSubmit(),
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
            onTap: onSubmit,
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
    );
  }
}
