import 'package:craft_climb/core/theme/app_pallete.dart';
import 'package:craft_climb/core/theme/app_text_style.dart' show AppTextStyle;
import 'package:craft_climb/core/utils/app_bg.dart';
import 'package:craft_climb/core/widgets/custome_searchbar.dart';
import 'package:craft_climb/core/widgets/secand_app_bar.dart';
import 'package:craft_climb/features/job/presentation/widgets/applicants_tile.dart';
import 'package:flutter/material.dart';

class ApplicantsPage extends StatefulWidget {
  static Route route() =>
      MaterialPageRoute(builder: (_) => const ApplicantsPage());
  const ApplicantsPage({super.key});

  @override
  State<ApplicantsPage> createState() => _ApplicantsPageState();
}

class _ApplicantsPageState extends State<ApplicantsPage> {
  final TextEditingController _searchController = TextEditingController();
  String searchQuery = '';
  bool sortHighToLow = true;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  // Dynamic data with score
  final List<Map<String, dynamic>> applicants = [
    {
      'name': 'Riaz Anderson',
      'score': 85,
      'image':
          'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=100',
    },
    {
      'name': 'Anja Angelina',
      'score': 72,
      'image':
          'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=100',
    },
    {
      'name': 'Gina & Emily',
      'score': 65,
      'image':
          'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=100',
    },
    {
      'name': 'Anderson Jhon',
      'score': 90,
      'image':
          'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=100',
    },
    {
      'name': 'Riaz Anderson',
      'score': 45,
      'image':
          'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=100',
    },
    {
      'name': 'Sara Williams',
      'score': 78,
      'image':
          'https://images.unsplash.com/photo-1544005313-94ddf0286df2?w=100',
    },
    {
      'name': 'Mike Johnson',
      'score': 55,
      'image':
          'https://images.unsplash.com/photo-1552058544-f2b08422138a?w=100',
    },
    {
      'name': 'Emma Davis',
      'score': 92,
      'image':
          'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=100',
    },
  ];

  // ✅ Filter + Sort
  List<Map<String, dynamic>> get filtered {
    List<Map<String, dynamic>> list = searchQuery.isEmpty
        ? applicants
        : applicants
              .where(
                (a) =>
                    a['name'].toLowerCase().contains(searchQuery.toLowerCase()),
              )
              .toList();

    list.sort(
      (a, b) => sortHighToLow
          ? b['score'].compareTo(a['score'])
          : a['score'].compareTo(b['score']),
    );

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBg(
        child: Column(
          children: [
            SecandAppBar(title: 'Applicants'),

            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
              child: Column(
                children: [
                  // ── Search ──
                  CustomeSearchbar(
                    controller: _searchController,
                    hintText: 'Search here...',
                    onChanged: (v) => setState(() => searchQuery = v),
                    onClear: () {
                      _searchController.clear();
                      setState(() => searchQuery = '');
                    },
                  ),
                  const SizedBox(height: 12),

                  // ── Total + Sort ──
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total ${applicants.length} Applicants',
                        style: AppTextStyle.s14w4i(color: AppPallete.bodyText),
                      ),
                      // ✅ Sort toggle
                      GestureDetector(
                        onTap: () =>
                            setState(() => sortHighToLow = !sortHighToLow),
                        child: Row(
                          children: [
                            Icon(
                              Icons.sort,
                              size: 16,
                              color: AppPallete.accent,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              sortHighToLow
                                  ? 'Sort By High To Low'
                                  : 'Sort By Low To High',
                              style: AppTextStyle.s14w4i(
                                color: AppPallete.accent,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),

            // ── List ──
            Expanded(
              child: filtered.isEmpty
                  ? Center(
                      child: Text(
                        'No applicants found',
                        style: AppTextStyle.s14w4i(color: AppPallete.bodyText),
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: filtered.length,
                      itemBuilder: (_, index) => ApplicantTile(
                        name: filtered[index]['name'],
                        score: filtered[index]['score'],
                        imageUrl: filtered[index]['image'],
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
