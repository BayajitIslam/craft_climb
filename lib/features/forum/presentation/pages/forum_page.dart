import 'dart:io';
import 'package:craft_climb/core/theme/app_pallete.dart';
import 'package:craft_climb/core/theme/app_text_style.dart';
import 'package:craft_climb/core/utils/app_bg.dart';
import 'package:craft_climb/core/utils/screen_size.dart';
import 'package:craft_climb/core/widgets/custome_app_bar.dart';
import 'package:craft_climb/features/forum/presentation/pages/post_detail_page.dart';
import 'package:craft_climb/features/forum/presentation/widgets/post_card.dart';
import 'package:craft_climb/features/job/presentation/pages/browse_job/job_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ForumPage extends StatefulWidget {
  static Route route() => MaterialPageRoute(builder: (_) => const ForumPage());
  const ForumPage({super.key});

  @override
  State<ForumPage> createState() => _ForumPageState();
}

class _ForumPageState extends State<ForumPage> {
  final List<Map<String, dynamic>> _posts = [
    // dummy video post
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
      'comments': <Map<String, dynamic>>[],
    },

    // dummy mixed post
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
          'url':
              'https://images.unsplash.com/photo-1541888946425-d81bb19240f5?w=400',
          'isVideo': false,
        },
      ],
      'likedBy': 'raham_alam',
      'likes': 1240,
      'caption': 'Building the Future with Smart Engineering solutions.',
      'date': 'September 20',
      'liked': true,
      'saved': false,
      'comments': <Map<String, dynamic>>[],
    },

    // dummy job post — data comes from backend in production, shown as static here
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
        'daysLeft': '3 days ago',
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
      'comments': <Map<String, dynamic>>[],
    },

    // dummy image post
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
      'comments': <Map<String, dynamic>>[],
    },
  ];

  // opens the create-post sheet and inserts the returned post at the top
  void _openCreatePost() async {
    final newPost = await showModalBottomSheet<Map<String, dynamic>>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => const _CreatePostSheet(),
    );

    if (newPost != null && mounted) {
      setState(() => _posts.insert(0, newPost));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.transparent,
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        name: 'Ovie Rahaman',
        role: 'Career Seeker',
        badge: 'Wolf',
      ),
      body: AppBg(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).padding.top + 60),

            _CreatePostBar(onTap: _openCreatePost),

            Divider(height: 1, color: Colors.grey.shade200),

            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.zero,
                itemCount: _posts.length,
                separatorBuilder: (_, __) =>
                    Divider(height: 1, color: Colors.grey.shade200),
                itemBuilder: (_, index) {
                  final post = _posts[index];
                  return PostCard(
                    post: post,
                    onLike: () => setState(() {
                      _posts[index]['liked'] =
                          !(_posts[index]['liked'] as bool);
                      _posts[index]['likes'] += (_posts[index]['liked'] as bool)
                          ? 1
                          : -1;
                    }),
                    onSave: () => setState(() {
                      _posts[index]['saved'] =
                          !(_posts[index]['saved'] as bool);
                    }),
                    onTap: () {
                      if (post['type'] == 'job') {
                        Navigator.push(context, JobDetailPage.route());
                      } else {
                        Navigator.push(
                          context,
                          PostDetailPage.route(post: post),
                        );
                      }
                    },
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

// --- create post input bar ---------------------------------------------------

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
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: AppPallete.primary,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  "What's on your mind?",
                  style: AppTextStyle.s14w4i(color: Colors.grey.shade500),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: AppPallete.accent,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Post',
                      style: AppTextStyle.s14w4i(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 6),
                    const Icon(
                      Icons.send_outlined,
                      color: Colors.white,
                      size: 14,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// --- create post bottom sheet ------------------------------------------------

class _CreatePostSheet extends StatefulWidget {
  const _CreatePostSheet();

  @override
  State<_CreatePostSheet> createState() => _CreatePostSheetState();
}

class _CreatePostSheetState extends State<_CreatePostSheet> {
  final TextEditingController _controller = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  final List<({File file, bool isVideo})> _media = [];

  // only the Post button rebuilds on text change — no full-tree setState
  final ValueNotifier<bool> _canPost = ValueNotifier(false);
  bool _isPosting = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      _canPost.value = _controller.text.trim().isNotEmpty || _media.isNotEmpty;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _canPost.dispose();
    super.dispose();
  }

  Future<void> _pickImages() async {
    final List<XFile> files = await _picker.pickMultiImage();
    if (files.isEmpty) return;
    setState(() {
      for (final f in files) {
        _media.add((file: File(f.path), isVideo: false));
      }
      _canPost.value = true;
    });
  }

  Future<void> _pickVideo() async {
    final XFile? file = await _picker.pickVideo(source: ImageSource.gallery);
    if (file == null) return;
    setState(() {
      _media.add((file: File(file.path), isVideo: true));
      _canPost.value = true;
    });
  }

  void _removeMedia(int index) {
    setState(() {
      _media.removeAt(index);
      _canPost.value = _controller.text.trim().isNotEmpty || _media.isNotEmpty;
    });
  }

  // insert # at the current cursor position
  void _insertHashtag() {
    final text = _controller.text;
    final sel = _controller.selection;
    final start = sel.start < 0 ? text.length : sel.start;
    final end = sel.end < 0 ? text.length : sel.end;
    final updated = text.replaceRange(start, end, '#');
    _controller.value = TextEditingValue(
      text: updated,
      selection: TextSelection.collapsed(offset: start + 1),
    );
  }

  // determine post type and build the map returned to ForumPage
  Map<String, dynamic> _buildPostMap() {
    final text = _controller.text.trim();
    final hasMedia = _media.isNotEmpty;

    final String type;
    if (!hasMedia) {
      type = 'text';
    } else if (_media.every((m) => !m.isVideo)) {
      type = 'image';
    } else if (_media.length == 1 && _media.first.isVideo) {
      type = 'video';
    } else {
      type = 'mixed';
    }

    return {
      'type': type,
      'username': 'Ovie Rahaman',
      'location': 'Dhaka, Bangladesh',
      'verified': false,
      'profile':
          'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=100',
      if (hasMedia)
        'localMedia': _media
            .map((m) => {'file': m.file, 'isVideo': m.isVideo})
            .toList(),
      'likedBy': '',
      'likes': 0,
      'caption': text,
      'date': 'Just now',
      'liked': false,
      'saved': false,
      'comments': <Map<String, dynamic>>[],
    };
  }

  Future<void> _submit() async {
    if (!_canPost.value || _isPosting) return;
    setState(() => _isPosting = true);

    // simulate network upload — replace with real API call
    await Future.delayed(const Duration(milliseconds: 800));

    if (!mounted) return;
    Navigator.pop(context, _buildPostMap());
  }

  @override
  Widget build(BuildContext context) {
    final double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: EdgeInsets.only(bottom: keyboardHeight),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // drag handle
          const SizedBox(height: 12),
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 4),

          // header row — avatar, name, animated Post button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=100',
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ovie Rahaman',
                      style: AppTextStyle.s14w4i(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Career Seeker',
                      style: AppTextStyle.s14w4i(
                        fontSize: 12,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ],
                ),
                const Spacer(),

                // only this widget rebuilds on every keystroke
                ValueListenableBuilder<bool>(
                  valueListenable: _canPost,
                  builder: (_, canPost, __) => GestureDetector(
                    onTap: _submit,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: canPost && !_isPosting
                            ? AppPallete.accent
                            : Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: _isPosting
                          ? const SizedBox(
                              width: 16,
                              height: 16,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            )
                          : Text(
                              'Post',
                              style: AppTextStyle.s14w4i(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const Divider(height: 1),

          // text input — no onChanged, listener on controller handles it
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextField(
              controller: _controller,
              maxLines: null,
              minLines: 4,
              autofocus: true,
              style: AppTextStyle.s14w4i(fontSize: 16),
              decoration: InputDecoration(
                hintText: "What's on your mind?",
                hintStyle: AppTextStyle.s14w4i(color: Colors.grey.shade400),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),

          // horizontal media preview strip
          if (_media.isNotEmpty)
            SizedBox(
              height: 100,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                scrollDirection: Axis.horizontal,
                itemCount: _media.length,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (_, i) {
                  final item = _media[i];
                  return Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.file(
                          item.file,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      if (item.isVideo)
                        Positioned.fill(
                          child: Center(
                            child: Container(
                              padding: const EdgeInsets.all(6),
                              decoration: const BoxDecoration(
                                color: Colors.black45,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.play_arrow,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      Positioned(
                        top: 4,
                        right: 4,
                        child: GestureDetector(
                          onTap: () => _removeMedia(i),
                          child: Container(
                            padding: const EdgeInsets.all(3),
                            decoration: const BoxDecoration(
                              color: Colors.black54,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.close,
                              color: Colors.white,
                              size: 14,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),

          if (_media.isNotEmpty) const SizedBox(height: 8),
          const Divider(height: 1),

          // action bar — photo, video, hashtag
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Row(
              children: [
                _ActionButton(
                  icon: Icons.image_outlined,
                  label: 'Photo',
                  color: Colors.green,
                  onTap: _pickImages,
                ),
                _ActionButton(
                  icon: Icons.videocam_outlined,
                  label: 'Video',
                  color: Colors.red,
                  onTap: _pickVideo,
                ),
                _ActionButton(
                  icon: Icons.tag,
                  label: 'Tag',
                  color: Colors.orange,
                  onTap: _insertHashtag,
                ),
              ],
            ),
          ),

          SizedBox(height: MediaQuery.of(context).padding.bottom + 4),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _ActionButton({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: color, size: 22),
              const SizedBox(height: 4),
              Text(
                label,
                style: AppTextStyle.s14w4i(
                  fontSize: 11,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
