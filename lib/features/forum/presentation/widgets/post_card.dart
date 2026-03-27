import 'package:craft_climb/core/theme/app_pallete.dart';
import 'package:craft_climb/core/theme/app_text_style.dart';
import 'package:craft_climb/core/utils/screen_size.dart';
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
    final List<String> images = List<String>.from(
      post['images'] ?? [post['image']],
    );

    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // post header
          PostHeader(post: post),

          // image grid
          PostImageGrid(images: images),

          // action buttons
          PostActions(post: post, onLike: onLike, onSave: onSave),

          // likes count
          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.spacing16),
            child: RichText(
              text: TextSpan(
                style: AppTextStyle.s12w4i(color: Colors.black),
                children: [
                  const TextSpan(text: 'Liked by '),
                  TextSpan(
                    text: post['likedBy'],
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                  TextSpan(text: ' and ${_formatCount(post['likes'])} others'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 4),

          // caption
          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.spacing16),
            child: RichText(
              text: TextSpan(
                style: AppTextStyle.s12w4i(color: Colors.black),
                children: [
                  TextSpan(
                    text: '${post['username']}  ',
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                  TextSpan(text: post['caption']),
                ],
              ),
            ),
          ),
          const SizedBox(height: 4),

          // date
          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.spacing16),
            child: Text(
              post['date'],
              style: AppTextStyle.s12w4i(
                color: Colors.grey.shade400,
                fontSize: 10,
              ),
            ),
          ),
          SizedBox(height: context.spacing12),
        ],
      ),
    );
  }

  String _formatCount(int count) {
    if (count >= 1000) {
      return '${(count / 1000).toStringAsFixed(1)}k';
    }
    return '$count';
  }
}

// post header with avatar, name, location
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
          // avatar with blue ring
          Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppPallete.accent, width: 1.5),
            ),
            child: CircleAvatar(
              radius: 18,
              backgroundImage: NetworkImage(post['profile']),
              backgroundColor: AppPallete.accent10,
            ),
          ),
          SizedBox(width: context.spacing8),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // name with verified badge
                Row(
                  children: [
                    Text(
                      post['username'],
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
                  post['location'] ?? '',
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

// instagram style image grid
class PostImageGrid extends StatelessWidget {
  final List<String> images;
  const PostImageGrid({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    if (images.length == 1) {
      return NetImage(url: images[0], height: 300);
    }

    if (images.length == 2) {
      return Row(
        children: images
            .map(
              (url) => Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 1),
                  child: NetImage(url: url, height: 220),
                ),
              ),
            )
            .toList(),
      );
    }

    // 3 or more images — show first 3, last one has +remaining overlay
    final int remaining = images.length - 3;

    return Row(
      children: [
        // left large image
        Expanded(child: NetImage(url: images[0], height: 280)),
        const SizedBox(width: 2),

        // right two stacked images
        Expanded(
          child: Column(
            children: [
              NetImage(url: images[1], height: 139),
              const SizedBox(height: 2),

              // third image — show +remaining overlay if more than 3
              Stack(
                children: [
                  NetImage(url: images[2], height: 139),

                  // video duration badge — only if exactly 3 images
                  if (remaining == 0)
                    Positioned(
                      bottom: 6,
                      right: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          '1:02',
                          style: AppTextStyle.s12w4i(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),

                  // +remaining overlay — only if more than 3 images
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

// network image with error fallback
class NetImage extends StatelessWidget {
  final String url;
  final double height;

  const NetImage({super.key, required this.url, required this.height});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
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

// like, comment, share, save action row
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
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.spacing12,
        vertical: context.spacing8,
      ),
      child: Row(
        children: [
          // like
          GestureDetector(
            onTap: onLike,
            child: Icon(
              post['liked'] ? Icons.favorite : Icons.favorite_border,
              color: post['liked'] ? Colors.red : Colors.black,
              size: 24,
            ),
          ),
          const SizedBox(width: 14),

          // comment
          Icon(Icons.chat_bubble_outline, color: Colors.black, size: 22),
          const SizedBox(width: 14),

          // share
          Icon(Icons.send_outlined, color: Colors.black, size: 22),

          const Spacer(),

          // save
          GestureDetector(
            onTap: onSave,
            child: Icon(
              post['saved'] ? Icons.bookmark : Icons.bookmark_border,
              color: Colors.black,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }
}
