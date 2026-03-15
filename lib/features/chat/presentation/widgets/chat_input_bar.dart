// features/chat/presentation/widgets/chat_input_bar.dart

import 'package:craft_climb/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class ChatInputBar extends StatefulWidget {
  final Function(String) onSend;

  const ChatInputBar({super.key, required this.onSend});

  @override
  State<ChatInputBar> createState() => _ChatInputBarState();
}

class _ChatInputBarState extends State<ChatInputBar> {
  final _controller = TextEditingController();
  bool _hasText = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _send() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    widget.onSend(text);
    _controller.clear();
    setState(() => _hasText = false);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 10,
        bottom: MediaQuery.of(context).padding.bottom + 10,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: Row(
        children: [
          // ── Text Input ──────────────────────────────
          Expanded(
            child: Container(
              constraints: const BoxConstraints(minHeight: 44),
              decoration: BoxDecoration(
                color: AppPallete.primary,
                borderRadius: BorderRadius.circular(22),
                boxShadow: [
                  BoxShadow(
                    color: AppPallete.primary,
                    blurRadius: 20,
                    offset: const Offset(2, 2),
                  ),
                ],
              ),
              child: TextField(
                controller: _controller,
                onChanged: (v) =>
                    setState(() => _hasText = v.trim().isNotEmpty),
                maxLines: null,
                textInputAction: TextInputAction.newline,
                style: const TextStyle(fontSize: 14, color: Color(0xFF1A1F36)),
                decoration: const InputDecoration(
                  hintText: 'Type Here...',
                  hintStyle: TextStyle(
                    color: AppPallete.extraAsh,
                    fontSize: 14,
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(width: 10),

          // ── Send Button ─────────────────────────────
          GestureDetector(
            onTap: _send,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: _hasText
                    ? const Color(0xFF2563EB)
                    : const Color(0xFFE8EDF5),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.send_rounded,
                size: 20,
                color: _hasText ? Colors.white : const Color(0xFF8A94A6),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
