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
    return Container(
      color: Colors.lightBlue[100],
      child: ListView(
        children: [
          Text(
            'Channel Emotes',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 10,
            mainAxisSpacing: 2.0,
            crossAxisSpacing: 2.0,
            children: channelEmotes,
          ),
          const SizedBox(height: 8),
          Text(
            'Global Emotes',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 10,
            mainAxisSpacing: 2.0,
            crossAxisSpacing: 2.0,
            children: globalEmotes,
          ),
        ],
      ),
    );
  }
}
