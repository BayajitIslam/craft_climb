// features/chat/data/models/chat_message_model.dart

class ChatMessageModel {
  final String id;
  final String text;
  final bool isMe;
  final DateTime time;
  final MessageStatus status;

  const ChatMessageModel({
    required this.id,
    required this.text,
    required this.isMe,
    required this.time,
    this.status = MessageStatus.sent,
  });
}

enum MessageStatus { sending, sent, delivered, read }

// ─────────────────────────────────────────────

class ConversationModel {
  final String id;
  final String name;
  final String avatarUrl;
  final String lastMessage;
  final DateTime lastMessageTime;
  final int unreadCount;
  final bool isOnline;

  const ConversationModel({
    required this.id,
    required this.name,
    required this.avatarUrl,
    required this.lastMessage,
    required this.lastMessageTime,
    this.unreadCount = 0,
    this.isOnline = false,
  });
}