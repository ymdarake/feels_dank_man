import 'package:flutter/material.dart';

class ChatMessageInputBox extends StatelessWidget {
  const ChatMessageInputBox({
    super.key,
    required this.controller,
    required this.onEmoteIconPressed,
    required this.onSendIconPressed,
  });

  final TextEditingController controller;
  final Function() onEmoteIconPressed;
  final Function() onSendIconPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: IconButton(
            iconSize: 24,
            padding: const EdgeInsets.only(right: 12),
            constraints: const BoxConstraints(),
            icon: const Icon(Icons.emoji_emotions_outlined),
            onPressed: onEmoteIconPressed,
            splashColor: Colors.yellow,
          ),
        ),
        TextField(
          showCursor: true,
          controller: controller,
          decoration: InputDecoration(
            hintText: 'type something',
            suffixIcon: IconButton(
              icon: const Icon(Icons.send_outlined),
              onPressed: onSendIconPressed,
            ),
          ),
        ),
      ],
    );
  }
}
