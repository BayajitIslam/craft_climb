import 'package:craft_climb/core/constants/app_images.dart';
import 'package:craft_climb/core/theme/app_pallete.dart';
import 'package:craft_climb/core/theme/app_text_style.dart';
import 'package:craft_climb/core/utils/screen_size.dart';
import 'package:flutter/material.dart';

import '../widgets/botumNavbar.dart';
import 'chatdetailscreen.dart';

class ConversationsScreen extends StatefulWidget {
  const ConversationsScreen({super.key});

  @override
  State<ConversationsScreen> createState() => _ConversationsScreenState();
}

class _ConversationsScreenState extends State<ConversationsScreen> {
  final TextEditingController _searchController = TextEditingController();
  int _currentIndex = 0;

  final List<Map<String, dynamic>> _conversations = [
    {
      'name': 'Jhon Paul',
      'lastMessage': 'Yes I am available tomorrow. See you there..',
      'time': '9:33 am',
      'profile': AppImages.profile_image1,
      'hasOnline': false,
    },
    {
      'name': 'Jhon Paul',
      'lastMessage': 'Yes I am available tomorrow. See you there..',
      'time': '9:33 am',
      'profile': AppImages.profile_image2,
      'hasOnline': false,
    },
    {
      'name': 'Jhon Paul',
      'lastMessage': 'Yes I am available tomorrow. See you there..',
      'time': '9:33 am',
      'profile': AppImages.profile_image3,
      'hasOnline': false,
    },
    {
      'name': 'Jhon Paul',
      'lastMessage': 'Yes I am available tomorrow. See you there..',
      'time': '9:33 am',
      'profile': AppImages.profile_image1,
      'hasOnline': true,
    },
    {
      'name': 'Jhon Paul',
      'lastMessage': 'Yes I am available tomorrow. See you there..',
      'time': '9:33 am',
      'profile': AppImages.profile_image2,
      'hasOnline': false,
    },
    {
      'name': 'Jhon Paul',
      'lastMessage': 'Yes I am available tomorrow. See you there..',
      'time': '9:33 am',
      'profile': AppImages.profile_image3,
      'hasOnline': true,
    },
    {
      'name': 'Jhon Paul',
      'lastMessage': 'Yes I am available tomorrow. See you there..',
      'time': '9:33 am',
      'profile': AppImages.profile_image1,
      'hasOnline': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // AppBar background-এর ওপরে
      appBar: AppBar(
        backgroundColor: Colors.transparent, // transparent AppBar
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: context.spacing16),
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppPallete.border),
                color: AppPallete.primary,
              ),
              child: const Icon(
                Icons.arrow_back_ios_new,
                size: 14,
                color: AppPallete.accent,
              ),
            ),
          ),
        ),
        title: Text(
          'Conversations',
          style: AppTextStyle.s24w7i(
            color: AppPallete.bodyText,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: context.spacing16),
            child: Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppPallete.border),
                color: AppPallete.primary,
              ),
              child: const Icon(
                Icons.notifications_none,
                size: 18,
                color: AppPallete.accent,
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              AppImages.appBackground,
              fit: BoxFit.cover,
            ),
          ),
          // Main content
          Column(
            children: [
              SizedBox(height: kToolbarHeight + MediaQuery.of(context).padding.top), // AppBar height spacing
              _buildSearchBar(context), // search bar overlay
              Expanded(child: _buildConversationList(context)),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.spacing16,
        vertical: context.spacing8,
      ),
      child: Container(
        height: 46,
        decoration: BoxDecoration(
          color: AppPallete.secondary,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          height: 42, // adjustable height
          decoration: BoxDecoration(
            color: Colors.white, // full background white
            borderRadius: BorderRadius.circular(50), // full rounded corners
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2), // subtle shadow
                blurRadius: 4,
                offset: const Offset(0, 2), // slightly below
              ),
            ],
          ),
          child: Row(
            children: [
              SizedBox(width: context.spacing12),
              const Icon(Icons.search, color: AppPallete.lighBlueGray, size: 20),
              SizedBox(width: context.spacing8),
              Expanded(
                child: TextField(
                  controller: _searchController,
                  style: AppTextStyle.s14w4i(
                    color: AppPallete.bodyText,
                    fontSize: 14,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Search here...',
                    hintStyle: AppTextStyle.s14w4i(
                      color: AppPallete.lighBlueGray,
                      fontSize: 14,
                    ),
                    contentPadding: EdgeInsets.zero,
                    border: InputBorder.none,           // underline remove
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,

                  ),
                ),
              ),
              GestureDetector(
                onTap: () => _searchController.clear(),
                child: Padding(
                  padding: EdgeInsets.only(right: context.spacing12),
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: const BoxDecoration(
                      color: AppPallete.lighBlueGray,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.close,
                      size: 12,
                      color: AppPallete.primary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ),
    );
  }

  Widget _buildConversationList(BuildContext context) {
    return ListView.separated(
      itemCount: _conversations.length,
      separatorBuilder: (_, __) => Divider(
        color: AppPallete.stroke,
        height: 1,
        indent: context.spacing16,
        endIndent: context.spacing16,
      ),
      itemBuilder: (context, index) {
        final conv = _conversations[index];
        return _ConversationTile(
          conversation: conv,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ChatDetailScreen(
                name: conv['name'],
                profile: conv['profile'],
              ),
            ),
          ),
        );
      },
    );
  }


}

class _ConversationTile extends StatelessWidget {
  final Map<String, dynamic> conversation;
  final VoidCallback onTap;

  const _ConversationTile({
    required this.conversation,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.spacing16,
          vertical: context.spacing12,
        ),
        child: Row(
          children: [
            // Avatar with optional online badge
            Stack(
              children: [
                CircleAvatar(
                  radius: 26,
                  backgroundImage: AssetImage(conversation['profile']),
                ),
                if (conversation['hasOnline'] == true)
                  Positioned(
                    bottom: 1,
                    right: 1,
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppPallete.primary,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(width: context.spacing12),

            // Name & last message
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    conversation['name'],
                    style: AppTextStyle.s14w4i(
                      color: AppPallete.bodyText,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    conversation['lastMessage'],
                    style: AppTextStyle.s14w4i(
                      color: AppPallete.subTextColor,
                      fontSize: 12,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),

            // Time
            Text(
              conversation['time'],
              style: AppTextStyle.s14w4i(
                color: AppPallete.subTextColor,
                fontSize: 11,
              ),
            ),
          ],
        ),
      ),
    );
  }
}