import 'package:craft_climb/core/theme/app_pallete.dart';
import 'package:craft_climb/core/theme/app_text_style.dart';
import 'package:craft_climb/core/utils/screen_size.dart';
import 'package:craft_climb/features/forum/presentation/widgets/auto_play_video.dart';
import 'package:craft_climb/features/forum/presentation/widgets/post_media_item.dart';
import 'package:craft_climb/features/job/presentation/widgets/job_card.dart';
import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final Map<String, dynamic> post;
  final VoidCallback onLike;
  final VoidCallback onSave;
  final VoidCallback onTap;

  const PostCard({
    super.key,
    required this.post,
    required this.onLike,
    required this.onSave,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final String type = post['type'] as String? ?? 'image';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // header is tappable to open detail
        GestureDetector(
          onTap: onTap,
          child: PostHeader(post: post),
        ),

        // media section — job card or photo/video carousel
        if (type == 'job')
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
            child: JobCard(
              title: post['job']['title'],
              location: post['job']['location'],
              daysLeft: post['job']['daysLeft'],
              salary: post['job']['salary'],
              onTap: onTap,
            ),
          )
        else
          _PostMediaCarousel(items: PostMediaItem.fromPost(post), height: 300),

        PostActions(post: post, onLike: onLike, onSave: onSave),
        _buildLikes(context),
        GestureDetector(onTap: onTap, child: _buildCaption(context)),
        _buildDate(context),
        SizedBox(height: context.spacing12),
      ],
    );
  }

  Widget _buildLikes(BuildContext context) {
    final likedBy = post['likedBy'] as String? ?? '';
    final likes = post['likes'] as int? ?? 0;

    if (likedBy.isEmpty && likes == 0) return const SizedBox.shrink();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.spacing16),
      child: RichText(
        text: TextSpan(
          style: AppTextStyle.s12w4i(color: Colors.black),
          children: likedBy.isNotEmpty
              ? [
                  const TextSpan(text: 'Liked by '),
                  TextSpan(
                    text: likedBy,
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                  TextSpan(text: ' and ${_formatCount(likes)} others'),
                ]
              : [TextSpan(text: '${_formatCount(likes)} likes')],
        ),
      ),
    );
  }

  Widget _buildCaption(BuildContext context) {
    final caption = post['caption'] as String? ?? '';
    if (caption.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.spacing16, vertical: 4),
      child: RichText(
        text: TextSpan(
          style: AppTextStyle.s12w4i(color: Colors.black),
          children: [
            TextSpan(
              text: '${post['username']}  ',
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
            TextSpan(text: caption),
          ],
        ),
      ),
    );
  }

  Widget _buildDate(BuildContext context) => Padding(
    padding: EdgeInsets.symmetric(horizontal: context.spacing16),
    child: Text(
      post['date'] as String? ?? '',
      style: AppTextStyle.s12w4i(color: Colors.grey.shade400, fontSize: 10),
    ),
  );

  String _formatCount(int count) =>
      count >= 1000 ? '${(count / 1000).toStringAsFixed(1)}k' : '$count';
}

// --- Instagram-style swipeable media carousel --------------------------------

class _PostMediaCarousel extends StatefulWidget {
  final List<PostMediaItem> items;
  final double height;

  const _PostMediaCarousel({required this.items, this.height = 300});

  @override
  State<_PostMediaCarousel> createState() => _PostMediaCarouselState();
}

class _PostMediaCarouselState extends State<_PostMediaCarousel> {
  int _currentPage = 0;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.items.isEmpty) return const SizedBox.shrink();

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

        // page counter badge — top right
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

        // animated dot indicators — bottom center
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

// --- single media cell (image or auto-play video) ----------------------------

class MediaCell extends StatelessWidget {
  final PostMediaItem item;
  final double height;

  const MediaCell({super.key, required this.item, required this.height});

  @override
  Widget build(BuildContext context) {
    if (item.isVideo) {
      return item.isLocal
          ? AutoPlayVideo.file(file: item.localFile!, height: height)
          : AutoPlayVideo.network(url: item.url, height: height);
    }

    return item.isLocal
        ? Image.file(
            item.localFile!,
            height: height,
            width: double.infinity,
            fit: BoxFit.cover,
          )
        : Image.network(
            item.url,
            height: height,
            width: double.infinity,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => Container(
              height: height,
              color: AppPallete.accent10,
              child: Icon(Icons.image_outlined, color: AppPallete.accent),
            ),
          );
  }
}

// --- post header -------------------------------------------------------------

class PostHeader extends StatelessWidget {
  final Map<String, dynamic> post;
  const PostHeader({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.spacing12,
        vertical: context.spacing8,
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppPallete.accent, width: 1.5),
            ),
            child: CircleAvatar(
              radius: 18,
              backgroundImage: NetworkImage(post['profile'] as String? ?? ''),
              backgroundColor: AppPallete.accent10,
            ),
          ),
          SizedBox(width: context.spacing8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      post['username'] as String? ?? '',
                      style: AppTextStyle.s14w4i(
                        fontWeight: FontWeight.w700,
                        fontSize: 13,
                      ),
                    ),
                    if (post['verified'] == true) ...[
                      const SizedBox(width: 4),
                      Icon(Icons.verified, color: AppPallete.accent, size: 13),
                    ],
                  ],
                ),
                if ((post['location'] as String? ?? '').isNotEmpty)
                  Text(
                    post['location'] as String,
                    style: AppTextStyle.s12w4i(
                      color: Colors.grey.shade500,
                      fontSize: 11,
                    ),
                  ),
              ],
            ),
          ),
          Icon(Icons.more_horiz, color: Colors.grey.shade600),
        ],
      ),
    );
  }
}

// --- action bar (like / comment / share / save) ------------------------------

class PostActions extends StatelessWidget {
  final Map<String, dynamic> post;
  final VoidCallback onLike;
  final VoidCallback onSave;

  const PostActions({
    super.key,
    required this.post,
    required this.onLike,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    final bool liked = post['liked'] as bool? ?? false;
    final bool saved = post['saved'] as bool? ?? false;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.spacing12,
        vertical: context.spacing8,
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: onLike,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: Icon(
                liked ? Icons.favorite : Icons.favorite_border,
                key: ValueKey(liked),
                color: liked ? Colors.red : Colors.black,
                size: 24,
              ),
            ),
          ),
          const SizedBox(width: 14),
          const Icon(Icons.chat_bubble_outline, color: Colors.black, size: 22),
          const SizedBox(width: 14),
          const Icon(Icons.send_outlined, color: Colors.black, size: 22),
          const Spacer(),
          GestureDetector(
            onTap: onSave,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: Icon(
                saved ? Icons.bookmark : Icons.bookmark_border,
                key: ValueKey(saved),
                color: Colors.black,
                size: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

