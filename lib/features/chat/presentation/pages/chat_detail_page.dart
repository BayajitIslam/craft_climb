import 'package:craft_climb/core/utils/app_bg.dart';
import 'package:craft_climb/core/widgets/secand_app_bar.dart';
import 'package:craft_climb/features/chat/presentation/models/chat_message_model.dart';
import 'package:flutter/material.dart';
import '../widgets/chat_bubble.dart';
import '../widgets/chat_input_bar.dart';
import '../widgets/typing_indicator.dart';

class ChatDetailPage extends StatefulWidget {
  final ConversationModel conversation;

  static Route route({required ConversationModel conversation}) =>
      MaterialPageRoute(
        builder: (_) => ChatDetailPage(conversation: conversation),
      );

  const ChatDetailPage({super.key, required this.conversation});

  @override
  State<ChatDetailPage> createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  final _scrollController = ScrollController();
  bool _isTyping = false;

  // ── Mock messages ────────────────────────────────
  late final List<ChatMessageModel> _messages = [
    ChatMessageModel(
      id: '1',
      text:
          "Hello! Thanks for applying for the UI/UX Designer position. I've reviewed your profile and would like to know more about your experience.",
      isMe: false,
      time: DateTime.now().subtract(const Duration(minutes: 10)),
      status: MessageStatus.read,
    ),
    ChatMessageModel(
      id: '2',
      text:
          'Hello! Thank you for reaching out. I have 3+ years of experience in UI/UX design.',
      isMe: true,
      time: DateTime.now().subtract(const Duration(minutes: 8)),
      status: MessageStatus.read,
    ),
    ChatMessageModel(
      id: '3',
      text: 'That\'s great. Can you share what tools you usually work with?',
      isMe: false,
      time: DateTime.now().subtract(const Duration(minutes: 6)),
      status: MessageStatus.read,
    ),
    ChatMessageModel(
      id: '4',
      text:
          'Sure. I mostly use Figma for design, along with Adobe Illustrator and Photoshop.',
      isMe: true,
      time: DateTime.now().subtract(const Duration(minutes: 4)),
      status: MessageStatus.delivered,
    ),
  ];

  void _sendMessage(String text) {
    setState(() {
      _messages.add(
        ChatMessageModel(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          text: text,
          isMe: true,
          time: DateTime.now(),
          status: MessageStatus.sending,
        ),
      );
      _isTyping = true;
    });

    _scrollToBottom();

    // Simulate reply after delay
    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;
      setState(() => _isTyping = false);

      Future.delayed(const Duration(milliseconds: 300), () {
        if (!mounted) return;
        setState(() {
          _messages.add(
            ChatMessageModel(
              id: DateTime.now().millisecondsSinceEpoch.toString(),
              text: 'Thanks for the message! I\'ll get back to you shortly.',
              isMe: false,
              time: DateTime.now(),
              status: MessageStatus.sent,
            ),
          );
        });
        _scrollToBottom();
      });
    });
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBg(
        child: Column(
          children: [
            SecandAppBar(title: widget.conversation.name),
            // ── Messages list ───────────────────────────
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                itemCount: _messages.length + (_isTyping ? 1 : 0),
                itemBuilder: (context, i) {
                  if (_isTyping && i == _messages.length) {
                    return const TypingIndicator();
                  }
                  return ChatBubble(
                    message: _messages[i],
                    senderAvatar: widget.conversation.avatarUrl,
                  );
                },
              ),
            ),

            // ── Input bar ───────────────────────────────
            ChatInputBar(onSend: _sendMessage),
          ],
        ),
      ),
    );
  }
}
