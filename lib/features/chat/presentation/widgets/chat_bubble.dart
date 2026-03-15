// features/chat/presentation/widgets/chat_bubble.dart

import 'package:craft_climb/features/chat/presentation/models/chat_message_model.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final ChatMessageModel message;
  final String? senderAvatar;

  const ChatBubble({super.key, required this.message, this.senderAvatar});

  String _formatTime(DateTime time) {
    final h = time.hour % 12 == 0 ? 12 : time.hour % 12;
    final m = time.minute.toString().padLeft(2, '0');
    final period = time.hour >= 12 ? 'PM' : 'AM';
    return '$h:$m $period';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: message.isMe
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // ── Sender avatar (only for received) ──────
          if (!message.isMe) ...[
            CircleAvatar(
              radius: 14,
              backgroundImage: senderAvatar != null
                  ? NetworkImage(senderAvatar!)
                  : null,
              backgroundColor: const Color(0xFFE8EDF5),
              child: senderAvatar == null
                  ? const Icon(Icons.person, size: 14)
                  : null,
            ),
            const SizedBox(width: 8),
          ],

          // ── Bubble ──────────────────────────────────
          Flexible(
            child: Column(
              crossAxisAlignment: message.isMe
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: [
                Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.68,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: message.isMe
                        ? const Color(0xFF2563EB)
                        : Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(16),
                      topRight: const Radius.circular(16),
                      bottomLeft: Radius.circular(message.isMe ? 16 : 4),
                      bottomRight: Radius.circular(message.isMe ? 4 : 16),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Text(
                    message.text,
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.4,
                      color: message.isMe
                          ? Colors.white
                          : const Color(0xFF1A1F36),
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      _formatTime(message.time),
                      style: const TextStyle(
                        fontSize: 11,
                        color: Color(0xFF8A94A6),
                      ),
                    ),
                    if (message.isMe) ...[
                      const SizedBox(width: 4),
                      _buildStatusIcon(message.status),
                    ],
                  ],
                ),
              ],
            ),
          ),

          // ── My avatar (only for sent) ────────────────
          if (message.isMe) ...[
            const SizedBox(width: 8),
            const CircleAvatar(
              radius: 14,
              backgroundColor: Color(0xFF2563EB),
              child: Icon(Icons.person, size: 14, color: Colors.white),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildStatusIcon(MessageStatus status) {
    switch (status) {
      case MessageStatus.sending:
        return const Icon(
          Icons.access_time,
          size: 12,
          color: Color(0xFF8A94A6),
        );
      case MessageStatus.sent:
        return const Icon(Icons.check, size: 12, color: Color(0xFF8A94A6));
      case MessageStatus.delivered:
        return const Icon(Icons.done_all, size: 12, color: Color(0xFF8A94A6));
      case MessageStatus.read:
        return const Icon(Icons.done_all, size: 12, color: Color(0xFF2563EB));
    }
  }
}
