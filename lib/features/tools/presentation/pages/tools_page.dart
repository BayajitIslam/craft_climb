import 'package:craft_climb/core/theme/app_pallete.dart';
import 'package:craft_climb/core/theme/app_text_style.dart';
import 'package:craft_climb/core/utils/app_bg.dart';
import 'package:craft_climb/core/utils/screen_size.dart';
import 'package:craft_climb/core/widgets/custome_searchbar.dart';
import 'package:craft_climb/core/widgets/secand_app_bar.dart';
import 'package:craft_climb/features/tools/presentation/pages/cart_page.dart';
import 'package:craft_climb/features/tools/presentation/widgets/category_tabs.dart';
import 'package:craft_climb/features/tools/presentation/widgets/product_grid.dart';
import 'package:flutter/material.dart';

class ToolsPage extends StatefulWidget {
  const ToolsPage({super.key});

  //Route
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const ToolsPage());
  }

  @override
  State<ToolsPage> createState() => _ToolsPageState();
}

class _ToolsPageState extends State<ToolsPage> {
  int _selectedCategory = 0;
  final TextEditingController _searchController = TextEditingController();


  final List<String> _categories = [
    'Civil Engineering',
    'Electrical Supply',
    'Pipe Fitting',
  ];

  // product list with network images
  final List<Map<String, dynamic>> _products = [
    {
      'name': 'Drill Machine',
      'description': 'A complete toolkit featuring 12 specialties.',
      'price': 19,
      'image':
          'https://images.unsplash.com/photo-1504148455328-c376907d081c?w=400',
      'inStock': true,
    },
    {
      'name': '12 Pics Tools Package',
      'description': 'A complete toolkit featuring 12 specialties.',
      'price': 68,
      'image':
          'https://images.unsplash.com/photo-1530124566582-a618bc2615dc?w=400',
      'inStock': false,
    },
    {
      'name': 'Hammer Red with pin',
      'description': 'A complete toolkit featuring 12 specialties.',
      'price': 79,
      'image':
          'https://images.unsplash.com/photo-1585771724684-38269d6639fd?w=400',
      'inStock': true,
    },
    {
      'name': 'Rangs',
      'description': 'A complete toolkit featuring 12 specialties.',
      'price': 28,
      'image':
          'https://images.unsplash.com/photo-1572981779307-38b8cabb2407?w=400',
      'inStock': true,
    },
    {
      'name': '12 Pics Tools Package',
      'description': 'A complete toolkit featuring 12 specialties.',
      'price': 19,
      'image':
          'https://images.unsplash.com/photo-1530124566582-a618bc2615dc?w=400',
      'inStock': true,
    },
    {
      'name': 'Plugs & Hammer Comb',
      'description': 'A complete toolkit featuring 12 specialties.',
      'price': 28,
      'image':
          'https://images.unsplash.com/photo-1585771724684-38269d6639fd?w=400',
      'inStock': true,
    },
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // shared SecandAppBar instead of custom appbar method
      body: AppBg(
        child: Column(
          children: [
            // appbar
            const SecandAppBar(title: 'Tools'),
            // search bar with filter icon
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.spacing16,
                vertical: context.spacing8,
              ),
              child: Row(
                children: [
                  // shared searchbar widget
                  Expanded(
                    child: CustomeSearchbar(
                      controller: _searchController,
                      hintText: 'Search here...',
                      // onChanged: (v) => setState(() => _searchQuery = v),
                      onClear: () {
                        _searchController.clear();
                        // setState(() => _searchQuery = '');
                      },
                    ),
                  ),
                  const SizedBox(width: 10),

                  // filter icon button
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 46,
                      height: 46,
                      decoration: BoxDecoration(
                        color: AppPallete.primary,
                        shape: BoxShape.circle,
                        border: Border.all(color: AppPallete.accent10),
                      ),
                      child: Icon(
                        Icons.tune,
                        size: 18,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // category filter tabs
            CategoryTabs(
              categories: _categories,
              selectedIndex: _selectedCategory,
              onCategorySelected: (index) =>
                  setState(() => _selectedCategory = index),
            ),

            // all products header with cart icon
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.spacing16,
                vertical: context.spacing12,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'All Products',
                    style: AppTextStyle.s14w4i(fontWeight: FontWeight.w600),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, CartPage.route());
                    },
                    child: Icon(
                      Icons.shopping_cart_outlined,
                      color: AppPallete.bodyText,
                      size: 24,
                    ),
                  ),
                ],
              ),
            ),

            // product grid
            Expanded(child: ProductGrid(products: _products)),
          ],
        ),
      ),
    );
  }
}
