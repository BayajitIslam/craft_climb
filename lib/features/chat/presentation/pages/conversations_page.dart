import 'package:craft_climb/core/utils/app_bg.dart';
import 'package:craft_climb/core/widgets/custome_searchbar.dart';
import 'package:craft_climb/core/widgets/secand_app_bar.dart';
import 'package:craft_climb/features/chat/presentation/models/chat_message_model.dart';
import 'package:flutter/material.dart';
import '../widgets/conversation_tile.dart';
import 'chat_detail_page.dart';

class ConversationsPage extends StatefulWidget {
  static Route route() =>
      MaterialPageRoute(builder: (_) => const ConversationsPage());

  const ConversationsPage({super.key});

  @override
  State<ConversationsPage> createState() => _ConversationsPageState();
}

class _ConversationsPageState extends State<ConversationsPage> {
  final _searchController = TextEditingController();
  String _searchQuery = '';

  // ── Mock data ────────────────────────────────────
  final List<ConversationModel> _conversations = List.generate(
    7,
    (i) => ConversationModel(
      id: 'conv_$i',
      name: 'Jhon Paul',
      avatarUrl: 'https://i.pravatar.cc/100?img=${10 + i}',
      lastMessage: 'Yes I am available tomorrow. See you there...',
      lastMessageTime: DateTime.now().subtract(Duration(minutes: (i + 1) * 12)),
      unreadCount: i == 0 ? 2 : 0,
      isOnline: i % 3 == 0,
    ),
  );

  List<ConversationModel> get _filtered => _conversations
      .where(
        (c) =>
            c.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
            c.lastMessage.toLowerCase().contains(_searchQuery.toLowerCase()),
      )
      .toList();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBg(
        child: Column(
          children: [
            // ── App bar ─────────────────────────────────
            SecandAppBar(title: 'Conversations'),
            // ── Search bar ──────────────────────────────
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
              child: CustomeSearchbar(
                controller: _searchController,
                onChanged: (v) => setState(() => _searchQuery = v),
              ),
            ),

            // ── List ────────────────────────────────────
            Expanded(
              child: _filtered.isEmpty
                  ? const Center(
                      child: Text(
                        'No conversations found',
                        style: TextStyle(color: Color(0xFF8A94A6)),
                      ),
                    )
                  : ListView.separated(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      itemCount: _filtered.length,
                      separatorBuilder: (_, _) => const Divider(
                        height: 1,
                        indent: 70,
                        endIndent: 16,
                        color: Color(0xFFEEF1F8),
                      ),
                      itemBuilder: (context, i) => ConversationTile(
                        conversation: _filtered[i],
                        onTap: () => Navigator.push(
                          context,
                          ChatDetailPage.route(conversation: _filtered[i]),
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

// // ── AppBar ───────────────────────────────────────────────────────────────────

// class _ConversationsAppBar extends StatelessWidget
//     implements PreferredSizeWidget {
//   @override
//   Size get preferredSize => const Size.fromHeight(64);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: preferredSize.height,
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       decoration: const BoxDecoration(
//         color: Colors.white,
//         border: Border(bottom: BorderSide(color: Color(0xFFEEF1F8), width: 1)),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           const Text(
//             'Conversations',
//             style: TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.w700,
//               color: Color(0xFF1A1F36),
//             ),
//           ),
//           Container(
//             width: 38,
//             height: 38,
//             decoration: BoxDecoration(
//               color: const Color(0xFFF0F3FA),
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: const Icon(
//               Icons.notifications_none_rounded,
//               size: 20,
//               color: Color(0xFF1A1F36),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
