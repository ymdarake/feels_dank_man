import 'package:flutter/material.dart';

class EmotePanel extends StatelessWidget {
  const EmotePanel({
    super.key,
    required this.emotes,
  });

  final List<Widget> emotes;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 10,
      mainAxisSpacing: 2.0,
      crossAxisSpacing: 2.0,
      children: emotes,
    );
  }
}
