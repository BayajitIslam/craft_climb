import 'package:craft_climb/core/theme/app_pallete.dart';
import 'package:craft_climb/core/theme/app_text_style.dart';
import 'package:craft_climb/core/utils/screen_size.dart';
import 'package:craft_climb/features/forum/presentation/widgets/post_media_item.dart';
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

    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PostHeader(post: post),
          _buildMedia(type),
          PostActions(post: post, onLike: onLike, onSave: onSave),
          _buildLikes(context),
          _buildCaption(context),
          _buildDate(context),
          SizedBox(height: context.spacing12),
        ],
      ),
    );
  }

  Widget _buildMedia(String type) {
    switch (type) {
      case 'video':
        return PostMediaGrid(
          items: [PostMediaItem.fromVideoPost(post)],
          singleHeight: 300,
        );
      case 'mixed':
        return PostMediaGrid(
          items: PostMediaItem.fromMediaList(post['media'] as List),
        );
      case 'job':
        return JobCard(post: post);
      default: // 'image'
        return PostMediaGrid(
          items: PostMediaItem.fromImageList(post['images'] as List),
        );
    }
  }

  Widget _buildLikes(BuildContext context) => Padding(
    padding: EdgeInsets.symmetric(horizontal: context.spacing16),
    child: RichText(
      text: TextSpan(
        style: AppTextStyle.s12w4i(color: Colors.black),
        children: [
          const TextSpan(text: 'Liked by '),
          TextSpan(
            text: post['likedBy'] as String,
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
          TextSpan(text: ' and ${_formatCount(post['likes'] as int)} others'),
        ],
      ),
    ),
  );

  Widget _buildCaption(BuildContext context) => Padding(
    padding: EdgeInsets.symmetric(horizontal: context.spacing16, vertical: 4),
    child: RichText(
      text: TextSpan(
        style: AppTextStyle.s12w4i(color: Colors.black),
        children: [
          TextSpan(
            text: '${post['username']}  ',
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
          TextSpan(text: post['caption'] as String),
        ],
      ),
    ),
  );

  Widget _buildDate(BuildContext context) => Padding(
    padding: EdgeInsets.symmetric(horizontal: context.spacing16),
    child: Text(
      post['date'] as String,
      style: AppTextStyle.s12w4i(color: Colors.grey.shade400, fontSize: 10),
    ),
  );

  String _formatCount(int count) =>
      count >= 1000 ? '${(count / 1000).toStringAsFixed(1)}k' : '$count';
}

// ─── header ───────────────────────────────────────────────────────────────────

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
              backgroundImage: NetworkImage(post['profile'] as String),
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
                      post['username'] as String,
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
                Text(
                  post['location'] as String? ?? '',
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

// ─── media grid ───────────────────────────────────────────────────────────────

class PostMediaGrid extends StatelessWidget {
  final List<PostMediaItem> items;
  final double singleHeight;

  const PostMediaGrid({
    super.key,
    required this.items,
    this.singleHeight = 300,
  });

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) return const SizedBox.shrink();

    if (items.length == 1) {
      return MediaCell(item: items[0], height: singleHeight);
    }

    if (items.length == 2) {
      return Row(
        children: items
            .map(
              (item) => Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 1),
                  child: MediaCell(item: item, height: 220),
                ),
              ),
            )
            .toList(),
      );
    }

    final int remaining = items.length - 3;

    return Row(
      children: [
        Expanded(child: MediaCell(item: items[0], height: 280)),
        const SizedBox(width: 2),
        Expanded(
          child: Column(
            children: [
              MediaCell(item: items[1], height: 139),
              const SizedBox(height: 2),
              Stack(
                children: [
                  MediaCell(item: items[2], height: 139),
                  if (remaining > 0)
                    Positioned.fill(
                      child: Container(
                        color: Colors.black.withOpacity(0.5),
                        child: Center(
                          child: Text(
                            '+$remaining',
                            style: AppTextStyle.s16w4i(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ─── single media cell ────────────────────────────────────────────────────────

class MediaCell extends StatelessWidget {
  final PostMediaItem item;
  final double height;

  const MediaCell({super.key, required this.item, required this.height});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // background — dark for video, image for photo
        item.isVideo
            ? Container(
                height: height,
                width: double.infinity,
                color: const Color(0xFF0D0D1A),
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
              ),

        // video overlays
        if (item.isVideo) ...[
          // play button
          Positioned.fill(
            child: Center(
              child: Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.15),
                  border: Border.all(color: Colors.white.withOpacity(0.4)),
                ),
                child: const Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                  size: 22,
                ),
              ),
            ),
          ),
          // duration badge
          if (item.duration != null)
            Positioned(
              bottom: 7,
              right: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.65),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  item.duration!,
                  style: AppTextStyle.s12w4i(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
        ],
      ],
    );
  }
}

// ─── job card ─────────────────────────────────────────────────────────────────

class JobCard extends StatelessWidget {
  final Map<String, dynamic> post;
  const JobCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    final job = post['job'] as Map<String, dynamic>;
    final skills = job['skills'] as List<String>? ?? [];

    return Container(
      margin: EdgeInsets.symmetric(horizontal: context.spacing16, vertical: 8),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      job['title'] as String,
                      style: AppTextStyle.s14w4i(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '${post['username']} · ${job['location']}',
                      style: AppTextStyle.s12w4i(
                        color: Colors.grey.shade500,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppPallete.accent,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 8,
                  ),
                  textStyle: AppTextStyle.s12w4i(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                child: const Text('Apply'),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: [
              if (job['jobType'] != null)
                _Chip(
                  label: job['jobType'] as String,
                  bg: Colors.blue.shade50,
                  fg: Colors.blue.shade700,
                ),
              if (job['salary'] != null)
                _Chip(
                  label: job['salary'] as String,
                  bg: Colors.green.shade50,
                  fg: Colors.green.shade700,
                ),
              ...skills.map(
                (s) => _Chip(
                  label: s,
                  bg: Colors.grey.shade100,
                  fg: Colors.grey.shade700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            '${job['applicants']} applicants · ${job['postedAt']}',
            style: AppTextStyle.s12w4i(
              color: Colors.grey.shade400,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  final String label;
  final Color bg;
  final Color fg;
  const _Chip({required this.label, required this.bg, required this.fg});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        label,
        style: AppTextStyle.s12w4i(
          color: fg,
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

// ─── action bar ───────────────────────────────────────────────────────────────

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
