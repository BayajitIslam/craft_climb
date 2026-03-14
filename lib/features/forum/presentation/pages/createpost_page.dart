import 'package:craft_climb/core/constants/app_images.dart';
import 'package:craft_climb/core/theme/app_pallete.dart';
import 'package:craft_climb/core/theme/app_text_style.dart';
import 'package:craft_climb/core/utils/screen_size.dart';
import 'package:flutter/material.dart';

import 'myforumpost_page.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: context.spacing12),
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppPallete.border),
              ),
              child: const Icon(Icons.arrow_back_ios_new,
                  size: 14, color: AppPallete.bodyText),
            ),
          ),
        ),
        title: Text(
          'Create Forum Post',
          style: AppTextStyle.s24w7i(
              color: AppPallete.bodyText, fontSize: 17),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: context.spacing16),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>MyForumPostScreen()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppPallete.accent,
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Post',
                    style: AppTextStyle.s14w4i(
                      color: AppPallete.primary,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 6),
                  const Icon(
                    Icons.send,
                    color: AppPallete.primary,
                    size: 16,
                  ),
                ],
              ),
            )
          ),
        ],
      ),
      body: Stack(
        children: [
          // ⭐ Background Image
          Positioned.fill(
            child: Image.asset(
              AppImages.appBackground,
              fit: BoxFit.cover,
            ),
          ),

          // ⭐ Foreground content
          Padding(
            padding: EdgeInsets.all(context.spacing16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profile avatar
                CircleAvatar(
                  radius: 18,
                  backgroundImage: AssetImage(AppImages.profile_image1),
                ),
                SizedBox(width: context.spacing12),

                // Input area
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title field
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
                            color: AppPallete.lighBlueGray,
                            fontSize: 15,
                          ),
                          border: InputBorder.none, // ⭐ no border
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          isDense: true,
                        ),
                      ),

                      SizedBox(height: context.spacing8),
                      Divider(color: AppPallete.extraAsh),
                      SizedBox(height: context.spacing8),

                      // Description field
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
                            color: AppPallete.lighBlueGray,
                            fontSize: 13,
                          ),
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          isDense: true,
                        ),
                      ),
                      SizedBox(height: context.spacing8),
                      Divider(color: AppPallete.extraAsh),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

}