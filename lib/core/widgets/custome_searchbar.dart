import 'package:craft_climb/core/theme/app_pallete.dart';
import 'package:craft_climb/core/utils/screen_size.dart';
import 'package:flutter/material.dart';

class CustomeSearchbar extends StatelessWidget {
  const CustomeSearchbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      constraints: BoxConstraints(
        minHeight: 48, // default is 56
        maxHeight: 48,
      ),
      backgroundColor: WidgetStateProperty.all(AppPallete.primary),
      hintText: 'Search...',
      leading: const Icon(Icons.search),
      elevation: WidgetStateProperty.all(0),
      padding: WidgetStateProperty.all(
        EdgeInsets.only(left: context.spacing24), //
      ),
    );
  }
}
