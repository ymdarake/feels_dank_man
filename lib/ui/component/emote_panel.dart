import 'package:flutter/material.dart';

class EmotePanel extends StatelessWidget {
  const EmotePanel({
    super.key,
    required this.channelEmotes,
    required this.globalEmotes,
  });

  final List<Widget> channelEmotes;
  final List<Widget> globalEmotes;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Channel Emotes',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Expanded(
          child: GridView.count(
            crossAxisCount: 10,
            mainAxisSpacing: 2.0,
            crossAxisSpacing: 2.0,
            children: channelEmotes,
          ),
        ),
        Text(
          'Gloabl Emotes',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Expanded(
          child: GridView.count(
            crossAxisCount: 10,
            mainAxisSpacing: 2.0,
            crossAxisSpacing: 2.0,
            children: globalEmotes,
          ),
        ),
      ],
    );
  }
}
