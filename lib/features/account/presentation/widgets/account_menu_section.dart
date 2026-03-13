import 'package:craft_climb/core/theme/app_pallete.dart';
import 'package:craft_climb/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class AccountMenuItem {
  final String title;
  final VoidCallback? onTap;

  const AccountMenuItem({required this.title, this.onTap});
}

class AccountMenuSection extends StatelessWidget {
  final String sectionTitle;
  final List<AccountMenuItem> items;

  const AccountMenuSection({
    super.key,
    required this.sectionTitle,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Items Box
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFCCCCCC),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Section Title
              Container(
                padding: const EdgeInsets.only(
                  top: 16,
                  left: 16,
                  right: 16,
                  bottom: 0,
                ),
                child: Text(
                  sectionTitle,
                  textAlign: TextAlign.start,
                  style: AppTextStyle.s14w4i(
                    fontWeight: FontWeight.w700,
                    color: AppPallete.bodyText,
                  ),
                ),
              ),
              Column(
                children: List.generate(items.length, (index) {
                  return Column(
                    children: [AccountMenuTile(item: items[index])],
                  );
                }),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class AccountMenuTile extends StatelessWidget {
  final AccountMenuItem item;

  const AccountMenuTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: item.onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xCCF1F1F1),
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            Expanded(
              child: Text(
                item.title,
                style: AppTextStyle.s14w4i(
                  fontWeight: FontWeight.w600,
                  color: AppPallete.bodyText,
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_outlined,
              color: AppPallete.bodyText,
              size: 22,
            ),
          ],
        ),
      ),
    );
  }
}
