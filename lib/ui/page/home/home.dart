import 'package:feels_dank_man/api/seventv/seventv_api_client.dart';
import 'package:feels_dank_man/di/container.dart';
import 'package:feels_dank_man/ui/component/chat_message_input_box.dart';
import 'package:feels_dank_man/ui/component/emote_panel.dart';
import 'package:feels_dank_man/utility/logging/logger.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> emoteItems = [];
  bool isEmotePanelOpen = false;
  TextEditingController inputController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadEmotes();
  }

  @override
  void dispose() {
    inputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: SizedBox(
            height:
                MediaQuery.of(context).size.height - kToolbarHeight - 32 * 2,
            child: Column(
              children: [
                // stream web view
                Expanded(child: Container()),
                if (isEmotePanelOpen)
                  SizedBox(
                    height: 200,
                    child: EmotePanel(emotes: emoteItems),
                  ),
                ChatMessageInputBox(
                  controller: inputController,
                  onEmoteIconPressed: _toggleEmotePanel,
                  onSendIconPressed: _handleSendMessage,
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _loadEmotes() async {
    final seventvEmotes =
        await getIt<ISeventvApiClient>().getChannelEmotes("557065975");

    getIt<ILogger>().info('${seventvEmotes.length} emotes loaded form 7tv');

    setState(() {
      emoteItems = seventvEmotes
          .map((e) => GestureDetector(
                onTap: () {
                  setState(() {
                    inputController.text += '${e.name} ';
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Image.network(
                    e.firstWebpUrl ?? 'https://placehold.jp/150x150.png',
                  ),
                ),
              ))
          .toList();
    });
  }

  _handleSendMessage() {
    getIt<ILogger>().info('sending message: "${inputController.text}"');
    inputController.clear();
    FocusScope.of(context).requestFocus(FocusNode());
    setState(() {
      isEmotePanelOpen = false;
    });
  }

  _toggleEmotePanel() {
    setState(() {
      isEmotePanelOpen = !isEmotePanelOpen;
    });
  }
}
