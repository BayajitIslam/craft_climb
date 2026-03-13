import 'package:craft_climb/core/theme/app_pallete.dart';
import 'package:craft_climb/core/theme/app_text_style.dart';
import 'package:craft_climb/core/utils/app_bg.dart';
import 'package:craft_climb/core/widgets/secand_app_bar.dart';
import 'package:flutter/material.dart';

class CertificatesPage extends StatelessWidget {
  static Route route() =>
      MaterialPageRoute(builder: (_) => const CertificatesPage());
  const CertificatesPage({super.key});

  final List<String> _certificates = const [
    'Certificate 1',
    'Certificate 2',
    'Certificate 3',
    'Certificate 4',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBg(
        child: Column(
          children: [
            SecandAppBar(title: 'Certificates'),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                itemCount: _certificates.length,
                itemBuilder: (_, index) => _CertificateCard(
                  title: _certificates[index],
                  onDownload: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Certificate Card ──
class _CertificateCard extends StatelessWidget {
  final String title;
  final VoidCallback onDownload;

  const _CertificateCard({required this.title, required this.onDownload});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppPallete.border),
        boxShadow: [
          BoxShadow(
            color: AppPallete.dropShadow,
            blurRadius: 10,
            spreadRadius: 6,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          // ── Title ──
          Expanded(
            child: Text(
              title,
              style: AppTextStyle.s14w4i(
                fontWeight: FontWeight.w600,
                color: AppPallete.bodyText,
              ),
            ),
          ),

          // ── Download Button ──
          GestureDetector(
            onTap: onDownload,
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: AppPallete.accent10,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.upload_rounded,
                color: AppPallete.accent,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
