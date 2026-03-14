import 'package:craft_climb/core/constants/app_images.dart';
import 'package:craft_climb/core/theme/app_pallete.dart';
import 'package:craft_climb/core/theme/app_text_style.dart';
import 'package:craft_climb/core/utils/screen_size.dart';
import 'package:craft_climb/features/tools/presentation/pages/cardscreen.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatefulWidget {
  final Map<String, dynamic> product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int _quantity = 1;
  bool _isExpanded = false;
  final TextEditingController _titleController = TextEditingController();

  final List<Map<String, dynamic>> _reviews = [
    {
      'name': 'Courtney Henry',
      'profile': AppImages.profile_image1,
      'rating': 4,
      'text':
      'Wishing you all the confidence and self-love on your skincare journey! You\'ve got this — healing takes time, but every step forward counts. 🙌',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              AppImages.appBackground,
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildImageSection(context),
                        _buildContentSection(context),
                      ],
                    ),
                  ),
                ),
                _buildBottomButton(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageSection(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: context.heightPercentage(38),
          color: AppPallete.secondary,
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            child: Image.asset(
              widget.product['image'],
              fit: BoxFit.cover,
            ),
          )
        ),
        // Back button
        Positioned(
          top: context.spacing12,
          left: context.spacing16,
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: AppPallete.primary,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppPallete.dropShadow,
                    blurRadius: 4,
                  ),
                ],
              ),
              child: const Icon(Icons.arrow_back_ios_new,
                  size: 14, color: AppPallete.bodyText),
            ),
          ),
        ),
        // Bookmark button
        Positioned(
          top: context.spacing12,
          right: context.spacing16,
          child: Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: AppPallete.primary,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppPallete.dropShadow,
                  blurRadius: 4,
                ),
              ],
            ),
            child: const Icon(Icons.notifications_none,
                size: 16, color: AppPallete.bodyText),
          ),
        ),
      ],
    );
  }


  Widget _buildContentSection(BuildContext context) {
    return Container(
      color: AppPallete.primary.withOpacity(0.95),
      padding: EdgeInsets.all(context.spacing16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.product['name'],
            style: AppTextStyle.s16w4i(
              color: AppPallete.bodyText,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: context.spacing8),
          Text(
            'Innovative Civil Engineering Solutions That Shape Stronger, Safer, And Smarter Infrastructure. Innovative Civil Engineering Solutions That Shape Stronger, Safer, And Smarter Infrastructure.',
            style: AppTextStyle.s14w4i(
              color: AppPallete.subTextColor,
              fontSize: 13,
            ),
            maxLines: _isExpanded ? null : 4,
            overflow:
            _isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
          ),
          SizedBox(height: 4),
          GestureDetector(
            onTap: () => setState(() => _isExpanded = !_isExpanded),
            child: Text(
              _isExpanded ? 'See Less' : 'See More',
              style: AppTextStyle.s14w4i(
                color: AppPallete.accent,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(height: context.spacing16),

          // Reviews header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Reviews (7)',
                style: AppTextStyle.s14w4i(
                  color: AppPallete.bodyText,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              _buildStars(4),
            ],
          ),
          Stack(
            children: [
              //Background Image
              Positioned.fill(
                child: Image.asset(
                  AppImages.appBackground,
                  fit: BoxFit.cover,
                ),
              ),


              Padding(
                padding: EdgeInsets.all(context.spacing16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Profile avatar
                    CircleAvatar(
                      radius: 18,
                      backgroundImage: AssetImage(AppImages.profile_image3),
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
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              isDense: true,
                            ),
                          ),

                          SizedBox(height: context.spacing8),
                          Divider(color: AppPallete.stroke),


                        ],
                      ),
                    ),
                    SizedBox(width: context.spacing12),
                    IconButton(
                      onPressed: () {
                        print("Send clicked");
                      },
                      icon: Icon(
                        Icons.send,
                        color: AppPallete.accent, // icon color
                        size: 28,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: context.spacing12),

          // Reviews list
          ..._reviews.map((r) => _ReviewTile(review: r)),
        ],
      ),
    );
  }

  Widget _buildStars(int count) {
    return Row(
      children: List.generate(5, (i) {
        return Icon(
          i < count ? Icons.star : Icons.star_border,
          color: Colors.amber,
          size: 16,
        );
      }),
    );
  }

  Widget _buildBottomButton(BuildContext context) {
    return Container(
      color: AppPallete.primary,
      padding: EdgeInsets.symmetric(
          horizontal: context.spacing16, vertical: context.spacing12),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const CartScreen()),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppPallete.accent,
          minimumSize: const Size.fromHeight(48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 0,
        ),
        child: Text(
          'Add to cart',
          style: AppTextStyle.s16w4i(
            color: AppPallete.primary,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class _ReviewTile extends StatelessWidget {
  final Map<String, dynamic> review;

  const _ReviewTile({required this.review});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: context.spacing12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 18,
            backgroundImage: AssetImage(review['profile']),
          ),
          SizedBox(width: context.spacing8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      review['name'],
                      style: AppTextStyle.s14w4i(
                        color: AppPallete.bodyText,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Row(
                      children: List.generate(5, (i) {
                        return Icon(
                          i < review['rating']
                              ? Icons.star
                              : Icons.star_border,
                          color: Colors.amber,
                          size: 13,
                        );
                      }),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Text(
                  review['text'],
                  style: AppTextStyle.s14w4i(
                    color: AppPallete.subTextColor,
                    fontSize: 12,
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