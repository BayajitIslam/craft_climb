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
  final FocusNode _commentFocus = FocusNode();

  late bool _liked;
  late bool _saved;
  late int _likeCount;

  // username being replied to — null means normal comment mode
  String? _replyingTo;

  late final List<Map<String, dynamic>> _comments;

  @override
  void initState() {
    super.initState();
    _liked = widget.post['liked'] as bool? ?? false;
    _saved = widget.post['saved'] as bool? ?? false;
    _likeCount = widget.post['likes'] as int? ?? 0;

    // use existing comments from the post, or start with defaults for dummy data
    final existing =
        widget.post['comments'] as List<Map<String, dynamic>>? ?? [];
    _comments = existing.isNotEmpty
        ? existing
        : [
            {
              'name': 'joshua_l',
              'profile':
                  'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=100',
              'text':
                  'Wishing you all the confidence and self-love on your journey!',
              'time': '20s',
              'liked': false,
              'replies': <Map<String, dynamic>>[],
            },
            {
              'name': 'richard_jwel',
              'profile':
                  'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=100',
              'text': 'Thank you so much, that really means a lot to me.',
              'time': '6h',
              'liked': false,
              'replies': <Map<String, dynamic>>[],
            },
          ];
  }

  @override
  void dispose() {
    _commentController.dispose();
    _scrollController.dispose();
    _commentFocus.dispose();
    super.dispose();
  }

  // tap Reply on a comment — pre-fill the input and focus it
  void _startReply(String username) {
    setState(() => _replyingTo = username);
    _commentController.text = '@$username ';
    _commentController.selection = TextSelection.collapsed(
      offset: _commentController.text.length,
    );
    _commentFocus.requestFocus();
  }

  void _cancelReply() {
    setState(() => _replyingTo = null);
    _commentController.clear();
    _commentFocus.unfocus();
  }

  void _submitComment() {
    final text = _commentController.text.trim();
    if (text.isEmpty) return;

    setState(() {
      if (_replyingTo != null) {
        // find the parent comment and append as a reply
        final parentIndex = _comments.indexWhere(
          (c) => c['name'] == _replyingTo,
        );
        if (parentIndex != -1) {
          final replies = List<Map<String, dynamic>>.from(
            _comments[parentIndex]['replies'] as List? ?? [],
          );
          replies.add({
            'name': 'you',
            'profile':
                'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=100',
            'text': text,
            'time': 'just now',
            'liked': false,
          });
          _comments[parentIndex]['replies'] = replies;
        }
        _replyingTo = null;
      } else {
        _comments.add({
          'name': 'you',
          'profile':
              'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=100',
          'text': text,
          'time': 'just now',
          'liked': false,
          'replies': <Map<String, dynamic>>[],
        });
      }
      _commentController.clear();
    });

    // scroll to the bottom after posting
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
    final mediaItems = PostMediaItem.fromPost(widget.post);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            SecandAppBar(title: 'Post'),

            Expanded(
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PostHeader(post: widget.post),

                    // media carousel — hidden for text-only and job posts
                    if (type != 'job' && mediaItems.isNotEmpty)
                      _DetailMediaCarousel(items: mediaItems, height: 340),

                    // job card rendered separately
                    PostActions(
                      post: {...widget.post, 'liked': _liked, 'saved': _saved},
                      onLike: () => setState(() {
                        _liked = !_liked;
                        _likeCount += _liked ? 1 : -1;
                      }),
                      onSave: () => setState(() => _saved = !_saved),
                    ),

                    // likes row
                    if (_likeCount > 0 ||
                        (widget.post['likedBy'] as String? ?? '').isNotEmpty)
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
                                text: widget.post['likedBy'] as String? ?? '',
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
                    if ((widget.post['caption'] as String? ?? '').isNotEmpty)
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

                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: context.spacing16,
                      ),
                      child: Text(
                        widget.post['date'] as String? ?? '',
                        style: AppTextStyle.s12w4i(
                          color: Colors.grey.shade400,
                          fontSize: 10,
                        ),
                      ),
                    ),

                    Divider(color: Colors.grey.shade200, height: 24),

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

                    // comment list with inline replies
                    ..._comments.asMap().entries.map(
                      (e) => _CommentTile(
                        comment: e.value,
                        onLike: () => setState(() {
                          _comments[e.key]['liked'] =
                              !(_comments[e.key]['liked'] as bool);
                        }),
                        onReply: () => _startReply(e.value['name'] as String),
                      ),
                    ),

                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),

            // reply indicator bar shown above the input when replying
            if (_replyingTo != null)
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 6,
                ),
                color: Colors.grey.shade100,
                child: Row(
                  children: [
                    Text(
                      'Replying to @$_replyingTo',
                      style: AppTextStyle.s12w4i(
                        color: Colors.grey.shade600,
                        fontSize: 12,
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: _cancelReply,
                      child: Icon(
                        Icons.close,
                        size: 16,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ],
                ),
              ),

            _CommentInput(
              controller: _commentController,
              focusNode: _commentFocus,
              onSubmit: _submitComment,
            ),
          ],
        ),
      ),
    );
  }
}

// --- media carousel for detail page (same logic, extracted for clarity) ------

class _DetailMediaCarousel extends StatefulWidget {
  final List<PostMediaItem> items;
  final double height;

  const _DetailMediaCarousel({required this.items, this.height = 340});

  @override
  State<_DetailMediaCarousel> createState() => _DetailMediaCarouselState();
}

class _DetailMediaCarouselState extends State<_DetailMediaCarousel> {
  int _currentPage = 0;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool hasMultiple = widget.items.length > 1;

    return Stack(
      children: [
        SizedBox(
          height: widget.height,
          child: PageView.builder(
            controller: _pageController,
            itemCount: widget.items.length,
            onPageChanged: (i) => setState(() => _currentPage = i),
            itemBuilder: (_, i) =>
                MediaCell(item: widget.items[i], height: widget.height),
          ),
        ),
        if (hasMultiple)
          Positioned(
            top: 10,
            right: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                '${_currentPage + 1}/${widget.items.length}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        if (hasMultiple)
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                widget.items.length,
                (i) => AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  width: _currentPage == i ? 16 : 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: _currentPage == i
                        ? Colors.white
                        : Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}

// --- comment tile with expandable replies ------------------------------------

class _CommentTile extends StatefulWidget {
  final Map<String, dynamic> comment;
  final VoidCallback onLike;
  final VoidCallback onReply;

  const _CommentTile({
    required this.comment,
    required this.onLike,
    required this.onReply,
  });

  @override
  State<_CommentTile> createState() => _CommentTileState();
}

class _CommentTileState extends State<_CommentTile> {
  bool _showReplies = false;

  @override
  Widget build(BuildContext context) {
    final bool liked = widget.comment['liked'] as bool? ?? false;
    final replies = widget.comment['replies'] as List? ?? [];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.spacing16, vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 16,
                backgroundImage: NetworkImage(
                  widget.comment['profile'] as String,
                ),
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
                            text: '${widget.comment['name']}  ',
                            style: const TextStyle(fontWeight: FontWeight.w700),
                          ),
                          TextSpan(text: widget.comment['text'] as String),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Text(
                          widget.comment['time'] as String,
                          style: AppTextStyle.s12w4i(
                            color: Colors.grey.shade400,
                            fontSize: 11,
                          ),
                        ),
                        const SizedBox(width: 14),
                        GestureDetector(
                          onTap: widget.onReply,
                          child: Text(
                            'Reply',
                            style: AppTextStyle.s12w4i(
                              color: Colors.grey.shade500,
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        // show / hide replies toggle
                        if (replies.isNotEmpty) ...[
                          const SizedBox(width: 14),
                          GestureDetector(
                            onTap: () =>
                                setState(() => _showReplies = !_showReplies),
                            child: Text(
                              _showReplies
                                  ? 'Hide replies'
                                  : 'View ${replies.length} ${replies.length == 1 ? 'reply' : 'replies'}',
                              style: AppTextStyle.s12w4i(
                                color: AppPallete.accent,
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: widget.onLike,
                child: Icon(
                  liked ? Icons.favorite : Icons.favorite_border,
                  size: 14,
                  color: liked ? Colors.red : Colors.grey.shade400,
                ),
              ),
            ],
          ),

          // inline replies
          if (_showReplies && replies.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(left: 40, top: 8),
              child: Column(
                children: (replies).map((r) {
                  final reply = r as Map<String, dynamic>;
                  final replyLiked = reply['liked'] as bool? ?? false;
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 13,
                          backgroundImage: NetworkImage(
                            reply['profile'] as String,
                          ),
                          backgroundColor: AppPallete.accent10,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                  style: AppTextStyle.s12w4i(
                                    color: Colors.black,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: '${reply['name']}  ',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    TextSpan(text: reply['text'] as String),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 3),
                              Text(
                                reply['time'] as String,
                                style: AppTextStyle.s12w4i(
                                  color: Colors.grey.shade400,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () =>
                              setState(() => reply['liked'] = !replyLiked),
                          child: Icon(
                            replyLiked ? Icons.favorite : Icons.favorite_border,
                            size: 12,
                            color: replyLiked
                                ? Colors.red
                                : Colors.grey.shade400,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
        ],
      ),
    );
  }
}

// --- comment input bar -------------------------------------------------------

class _CommentInput extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final VoidCallback onSubmit;

  const _CommentInput({
    required this.controller,
    required this.focusNode,
    required this.onSubmit,
  });

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
          const CircleAvatar(
            radius: 16,
            backgroundImage: NetworkImage(
              'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=100',
            ),
            backgroundColor: AppPallete.accent10,
          ),
          SizedBox(width: context.spacing8),
          Expanded(
            child: TextField(
              controller: controller,
              focusNode: focusNode,
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
