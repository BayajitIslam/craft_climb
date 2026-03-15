import 'package:craft_climb/core/constants/app_images.dart';
import 'package:craft_climb/core/theme/app_pallete.dart';
import 'package:craft_climb/core/theme/app_text_style.dart';
import 'package:craft_climb/core/utils/app_bg.dart';
import 'package:craft_climb/core/utils/screen_size.dart';
import 'package:craft_climb/core/widgets/secand_app_bar.dart';
import 'package:craft_climb/features/tools/presentation/pages/cart_page.dart';
import 'package:flutter/material.dart';

class ProductDetailPage extends StatefulWidget {
  final Map<String, dynamic> product;

  //Route
  static Route route({required Map<String, dynamic> product}) {
    return MaterialPageRoute<void>(
      builder: (_) => ProductDetailPage(product: product),
    );
  }

  const ProductDetailPage({super.key, required this.product});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  bool _isExpanded = false;
  final TextEditingController _titleController = TextEditingController();

  final List<Map<String, dynamic>> _reviews = [
    {
      'name': 'Courtney Henry',
      'profile': AppImages.onboarding3,
      'rating': 4,
      'text':
          'Wishing you all the confidence and self-love on your skincare journey! You\'ve got this — healing takes time, but every step forward counts. 🙌',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: SecandAppBar(title: ''),
      body: AppBg(
        child: SafeArea(
          top: false,
          bottom: true,
          child: Stack(
            children: [
              // ── Scrollable content ──────────────────────
              SingleChildScrollView(
                child: Column(
                  children: [
                    _buildImageSection(context),
                    _buildContentSection(context),
                    SizedBox(height: 80),
                  ],
                ),
              ),

              // ── Floating bottom button ───────────────────
              Positioned(
                // 👈 always sticks to bottom
                bottom: 0,
                left: 0,
                right: 0,
                child: _buildBottomButton(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImageSection(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 360,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
        child: Image.network(
          width: double.infinity,

          widget.product['image'],
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              width: double.infinity,
              height: 360,
              color: AppPallete.accent10,
              child: Icon(Icons.image_outlined, color: AppPallete.accent),
            );
          },
        ),
      ),
    );
  }

  Widget _buildContentSection(BuildContext context) {
    return Container(
      color: AppPallete.primary,
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
            overflow: _isExpanded
                ? TextOverflow.visible
                : TextOverflow.ellipsis,
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
                  color: AppPallete.subTextColor,
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
                child: Image.asset(AppImages.appBackground, fit: BoxFit.cover),
              ),

              Padding(
                padding: EdgeInsets.all(context.spacing16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Profile avatar
                    CircleAvatar(
                      radius: 18,
                      backgroundImage: AssetImage(AppImages.onboarding1),
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
                                color: AppPallete.subTextColor,
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
                    ),
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
        horizontal: context.spacing16,
        vertical: context.spacing12,
      ),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const CartPage()),
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
                          i < review['rating'] ? Icons.star : Icons.star_border,
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
