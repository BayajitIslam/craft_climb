import 'package:craft_climb/core/theme/app_pallete.dart';
import 'package:craft_climb/core/theme/app_text_style.dart';
import 'package:craft_climb/core/utils/app_bg.dart';
import 'package:craft_climb/core/utils/screen_size.dart';
import 'package:craft_climb/features/forum/presentation/pages/my_forum_post_page.dart';
import 'package:flutter/material.dart';

class CreatePostPage extends StatefulWidget {
  static Route route() =>
      MaterialPageRoute(builder: (_) => const CreatePostPage());
  const CreatePostPage({super.key});

  @override
  State<CreatePostPage> createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBg(
        child: Column(
          children: [
            // appbar with post button
            _CreatePostAppBar(
              onPost: () => Navigator.push(
                context,
                MyForumPostPage.route(),
              ),
            ),

            // content
            Padding(
              padding: EdgeInsets.all(context.spacing16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // user avatar
                  CircleAvatar(
                    radius: 18,
                    backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=100',
                    ),
                    backgroundColor: AppPallete.accent10,
                  ),
                  SizedBox(width: context.spacing12),

                  // input fields
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // title field
                        TextField(
                          controller: _titleController,
                          style: AppTextStyle.s16w4i(
                            color: AppPallete.bodyText,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                          decoration: InputDecoration(
                            hintText: 'Title...',
                            hintStyle: AppTextStyle.s14w4i(
                              color: Colors.grey.shade400,
                              fontSize: 15,
                            ),
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            isDense: true,
                          ),
                        ),
                        SizedBox(height: context.spacing8),
                        Divider(color: Colors.grey.shade200),
                        SizedBox(height: context.spacing8),

                        // description field
                        TextField(
                          controller: _descController,
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                          style: AppTextStyle.s14w4i(
                            color: AppPallete.bodyText,
                            fontSize: 13,
                          ),
                          decoration: InputDecoration(
                            hintText: 'Description...',
                            hintStyle: AppTextStyle.s14w4i(
                              color: Colors.grey.shade400,
                              fontSize: 13,
                            ),
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            isDense: true,
                          ),
                        ),
                        SizedBox(height: context.spacing8),
                        Divider(color: Colors.grey.shade200),
                      ],
                    ),
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

// appbar with post action button
class _CreatePostAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final VoidCallback onPost;

  const _CreatePostAppBar({required this.onPost});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leadingWidth: 52,
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
        'Create Forum Post',
        style: AppTextStyle.s16w4i(fontWeight: FontWeight.w700, color: AppPallete.black),
      ),
      centerTitle: true,
      actions: [
        Padding(
          padding: EdgeInsets.only(right: context.spacing16),
          child: GestureDetector(
            onTap: onPost,
            child: Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: AppPallete.accent,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Post',
                    style: AppTextStyle.s12w4i(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 6),
                  const Icon(
                    Icons.send,
                    color: Colors.white,
                    size: 14,
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