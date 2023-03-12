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
    return SizedBox(
      height: 100,
      child: TextField(
        decoration: InputDecoration(
          label: const Text('type something'),
          suffixIcon: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: const Icon(Icons.emoji_emotions_outlined),
                onPressed: onEmoteIconPressed,
              ),
              IconButton(
                icon: const Icon(Icons.send_outlined),
                onPressed: onSendIconPressed,
              ),
            ],
          ),
        ),
        controller: controller,
      ),
    );
  }
}
