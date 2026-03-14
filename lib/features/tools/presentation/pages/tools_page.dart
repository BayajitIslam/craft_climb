import 'package:craft_climb/core/constants/app_images.dart';
import 'package:craft_climb/core/theme/app_pallete.dart';
import 'package:craft_climb/core/theme/app_text_style.dart';
import 'package:craft_climb/core/utils/screen_size.dart';
import 'package:flutter/material.dart';

import '../widgets/categorytabs.dart';

import '../widgets/productGrid.dart';

class ToolsPage extends StatefulWidget {
  ToolsPage({super.key});

  @override
  State<ToolsPage> createState() => _ToolsScreenState();
}

class _ToolsScreenState extends State<ToolsPage> {
  int _selectedCategory = 0;
  final TextEditingController _searchController = TextEditingController();

  final List<String> _categories = [
    'Civil Engineering',
    'Electrical Supply',
    'Pipe Fitting',
  ];

  final List<Map<String, dynamic>> _products = [
    {
      'name': 'Drill Machine',
      'description': 'A complete toolkit featuring 12 specialties.',
      'price': 19,
      'image': AppImages.drill_machine1,
      'inStock': true,
    },
    {
      'name': '12 Pics Tools Package',
      'description': 'A complete toolkit featuring 12 specialties.',
      'price': 68,
      'image': AppImages.picstools_package2,
      'inStock': false,
    },
    {
      'name': 'Hammer Red with pin',
      'description': 'A complete toolkit featuring 12 specialties.',
      'price': 79,
      'image': AppImages.hammer3,
      'inStock': true,
    },
    {
      'name': 'Rangs',
      'description': 'A complete toolkit featuring 12 specialties.',
      'price': 28,
      'image': AppImages.rangs4,
      'inStock': true,
    },
    {
      'name': '12 Pics Tools Package',
      'description': 'A complete toolkit featuring 12 specialties.',
      'price': 19,
      'image': AppImages.picstools5,
      'inStock': true,
    },
    {
      'name': 'Plugs & Hammer Comb',
      'description': 'A complete toolkit featuring 12 specialties.',
      'price': 28,
      'image': AppImages.plugshammer,
      'inStock': true,
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
                _buildAppBar(context),
                Row(
                  children: [
                    _buildSearchBar(context),
                    GestureDetector(
                      onTap: () {
                        // handle filter action
                      },
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          color: AppPallete.primary,
                          shape: BoxShape.circle,
                          border: Border.all(color: AppPallete.border),
                        ),
                        child: const Icon(Icons.tune,
                            size: 18, color: AppPallete.extraAsh),
                      ),
                    ),
                  ],
                ),
                CategoryTabs(
                  categories: _categories,
                  selectedIndex: _selectedCategory,
                  onCategorySelected: (index) {
                    setState(() {
                      _selectedCategory = index;
                    });
                  },
                ),
                _buildAllProductsHeader(context),
                Expanded(
                  child: ProductGrid(
                    products: _products,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: context.spacing16, vertical: context.spacing8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: AppPallete.primary,
                shape: BoxShape.circle,
                border: Border.all(color: AppPallete.border),
              ),
              child: const Icon(Icons.arrow_back_ios_new,
                  size: 14, color: AppPallete.bodyText),
            ),
          ),
          Text(
            'Tools',
            style: AppTextStyle.s24w7i(
                color: AppPallete.bodyText, fontSize: 18),
          ),
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: AppPallete.primary,
              shape: BoxShape.circle,
              border: Border.all(color: AppPallete.border),
            ),
            child: const Icon(Icons.notifications_none,
                size: 18, color: AppPallete.extraAsh),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: context.spacing16, vertical: context.spacing8),
      child: Container(
        height: 42,
        width: 290,
        decoration: BoxDecoration(
          color: AppPallete.primary,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppPallete.border),
        ),
        child: Row(
          children: [
            SizedBox(width: context.spacing12),
            Icon(Icons.search, color: AppPallete.lighBlueGray, size: 18),
            SizedBox(width: context.spacing8),
            Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  child: TextField(
                    controller: _searchController,
                    style: AppTextStyle.s14w4i(
                      color: AppPallete.bodyText,
                      fontSize: 13,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Search here...',
                      hintStyle: AppTextStyle.s14w4i(
                        color: AppPallete.lighBlueGray,
                        fontSize: 13,
                      ),
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                    ),
                  ),
                )
            ),
            Container(
              margin: const EdgeInsets.all(6),
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: AppPallete.secondary,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Icon(
                Icons.close,
                size: 16,
                color: AppPallete.extraAsh,
              ),
            ),
          ],
        ),
      ),
    );
  }



  Widget _buildAllProductsHeader(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: context.spacing16, vertical: context.spacing12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'All Products',
            style: AppTextStyle.s14w4i(
              color: AppPallete.bodyText,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          Icon(Icons.shopping_cart_outlined,
              color: AppPallete.bodyText, size: 20),
        ],
      ),
    );
  }

}


