import 'package:craft_climb/core/theme/app_pallete.dart';
import 'package:craft_climb/core/utils/screen_size.dart';
import 'package:flutter/material.dart';

class CustomeSearchbar extends StatelessWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final String hintText;
  final VoidCallback? onClear;

  const CustomeSearchbar({
    super.key,
    this.controller,
    this.onChanged,
    this.hintText = 'Search...',
    this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      controller: controller,
      onChanged: onChanged,
      constraints: const BoxConstraints(minHeight: 48, maxHeight: 48),
      backgroundColor: WidgetStateProperty.all(AppPallete.primary),
      hintText: hintText,
      elevation: WidgetStateProperty.all(0),
      padding: WidgetStateProperty.all(
        EdgeInsets.only(left: context.spacing24),
      ),
      leading: const Icon(Icons.search),
      trailing: [
        if (controller?.text.isNotEmpty ?? false)
          GestureDetector(
            onTap: () {
              controller?.clear();
              onClear?.call();
            },
            child: Padding(
              padding: EdgeInsets.only(right: context.spacing12),
              child: Icon(Icons.cancel, color: AppPallete.extraAsh, size: 25),
            ),
          ),
      ],
    );
  }
}
