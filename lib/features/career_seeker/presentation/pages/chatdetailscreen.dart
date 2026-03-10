import 'package:craft_climb/core/constants/app_images.dart';
import 'package:craft_climb/core/theme/app_pallete.dart';
import 'package:craft_climb/core/theme/app_text_style.dart';
import 'package:craft_climb/core/utils/screen_size.dart';
import 'package:flutter/material.dart';

class ChatDetailScreen extends StatefulWidget {
  final String name;
  final String profile;

  const ChatDetailScreen({
    super.key,
    required this.name,
    required this.profile,
  });

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  // true = sent by me, false = received
  final List<Map<String, dynamic>> _messages = [
    {
      'text':
      "Hello! Thanks for applying for the UI/UX Designer position. I've reviewed your profile and would like to know more about your experience.",
      'isSent': false,
      'isTyping': false,
    },
    {
      'text':
      'Hello! Thank you for reaching out. I have 3+ years of experience in UI/UX design.',
      'isSent': true,
      'isTyping': false,
    },
    {
      'text': 'That\'s great. Can you share what tools you usually work with?',
      'isSent': false,
      'isTyping': false,
    },
    {
      'text':
      'Sure. I mostly use Figma for design, along with Adobe Illustrator and Photoshop.',
      'isSent': true,
      'isTyping': false,
    },
    {
      'text': '',
      'isSent': false,
      'isTyping': true, // typing indicator (three dots)
    },
  ];

  void _sendMessage() {
    final text = _messageController.text.trim();
    if (text.isEmpty) return;
    setState(() {
      // Remove typing indicator if present, then add new message
      _messages.removeWhere((m) => m['isTyping'] == true);
      _messages.add({'text': text, 'isSent': true, 'isTyping': false});
      _messages.add({'text': '', 'isSent': false, 'isTyping': true});
    });
    _messageController.clear();
    Future.delayed(const Duration(milliseconds: 100), () {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.primary,
      appBar: _buildAppBar(context),
      body: Column(
        children: [
          Expanded(child: _buildMessageList(context)),
          _buildInputBar(context),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppPallete.primary,
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
              color: AppPallete.bodyText,
            ),
          ),
        ),
      ),
      title: Text(
        widget.name,
        style: AppTextStyle.s24w7i(
          color: AppPallete.primary,
          fontSize: 18,
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
              color: AppPallete.bodyText,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMessageList(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      padding: EdgeInsets.symmetric(
        horizontal: context.spacing16,
        vertical: context.spacing12,
      ),
      itemCount: _messages.length,
      itemBuilder: (context, index) {
        final msg = _messages[index];
        if (msg['isTyping'] == true) {
          return _TypingIndicator(profile: widget.profile);
        }
        return _MessageBubble(
          message: msg,
          profile: widget.profile,
        );
      },
    );
  }

  Widget _buildInputBar(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.spacing16,
        vertical: context.spacing12,
      ),
      decoration: BoxDecoration(
        color: AppPallete.primary,
        border: Border(top: BorderSide(color: AppPallete.stroke)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 46, // height adjustable
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white, // background white
                borderRadius: BorderRadius.circular(12), // outer radius
                // border: remove korle blank hoy
              ),
              child: Center(
                child: TextField(
                  controller: _messageController,
                  style: AppTextStyle.s14w4i(
                    color: AppPallete.primary,
                    fontSize: 14,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Type Here...',
                    hintStyle: AppTextStyle.s14w4i(
                      color: AppPallete.lighBlueGray,
                      fontSize: 14,
                    ),
                    border: InputBorder.none, // inner line remove
                    isDense: true,
                    contentPadding: const EdgeInsets.symmetric(vertical: 10),
                  ),
                  onSubmitted: (_) => _sendMessage(),
                ),
              ),
            )
          ),
          SizedBox(width: context.spacing12),
          GestureDetector(
            onTap: _sendMessage,
            child: Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: AppPallete.accent,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.send,
                color: AppPallete.primary,
                size: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MessageBubble extends StatelessWidget {
  final Map<String, dynamic> message;
  final String profile;

  const _MessageBubble({required this.message, required this.profile});

  @override
  Widget build(BuildContext context) {
    final isSent = message['isSent'] as bool;

    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        mainAxisAlignment:
        isSent ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // Receiver avatar (left side)
          if (!isSent) ...[
            CircleAvatar(
              radius: 16,
              backgroundImage: AssetImage(profile),
            ),
            SizedBox(width: context.spacing8),
          ],

          // Bubble
          Flexible(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 12,
              ),
              decoration: BoxDecoration(
                color: isSent ? AppPallete.accent : AppPallete.accentFB,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(16),
                  topRight: const Radius.circular(16),
                  bottomLeft: Radius.circular(isSent ? 16 : 4),
                  bottomRight: Radius.circular(isSent ? 4 : 16),
                ),
              ),
              child: Text(
                message['text'],
                style: AppTextStyle.s14w4i(
                  color: isSent
                      ? AppPallete.primary
                      : AppPallete.bodyText,
                  fontSize: 14,
                ),
              ),
            ),
          ),

          // Sender avatar (right side)
          if (isSent) ...[
            SizedBox(width: context.spacing8),
            CircleAvatar(
              radius: 16,
              backgroundImage: AssetImage(AppImages.profile_image1),
            ),
          ],
        ],
      ),
    );
  }
}

class _TypingIndicator extends StatelessWidget {
  final String profile;

  const _TypingIndicator({required this.profile});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 16,
            backgroundImage: AssetImage(profile),
          ),
          SizedBox(width: context.spacing8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: AppPallete.accentFB,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
                bottomLeft: Radius.circular(4),
                bottomRight: Radius.circular(16),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(3, (i) {
                return AnimatedContainer(
                  duration: Duration(milliseconds: 400 + i * 150),
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: AppPallete.lighBlueGray,
                    shape: BoxShape.circle,
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}