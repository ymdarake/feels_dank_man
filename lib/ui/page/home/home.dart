import 'package:feels_dank_man/api/seventv/seventv_api_client.dart';
import 'package:feels_dank_man/api/seventv/seventv_emote.dart';
import 'package:feels_dank_man/di/container.dart';
import 'package:feels_dank_man/ui/component/chat_message_input_box.dart';
import 'package:feels_dank_man/ui/component/emote_panel.dart';
import 'package:feels_dank_man/ui/component/stream_player.dart';
import 'package:feels_dank_man/utility/logging/logger.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> channelEmoteItems = [];
  List<Widget> globalEmoteItems = [];
  bool isEmotePanelOpen = false;

  late TextEditingController inputController;

  @override
  void initState() {
    super.initState();
    inputController = TextEditingController();

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
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height - kToolbarHeight - 32 * 2,
          child: Column(
            children: [
              const SizedBox(height: 300, child: StreamPlayer()),
              Expanded(flex: 1, child: Container()),
              if (isEmotePanelOpen)
                Expanded(
                  flex: 100,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: EmotePanel(
                      channelEmotes: channelEmoteItems,
                      globalEmotes: globalEmoteItems,
                    ),
                  ),
                ),
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ChatMessageInputBox(
                  controller: inputController,
                  onEmoteIconPressed: _toggleEmotePanel,
                  onSendIconPressed: _handleSendMessage,
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _loadEmotes() async {
    final seventvChannelEmotes =
        await getIt<ISeventvApiClient>().getChannelEmotes("557065975");
    getIt<ILogger>()
        .info('${seventvChannelEmotes.length} emotes loaded form 7tv channel');

    final seventvGlobalEmotes =
        await getIt<ISeventvApiClient>().getGlobalEmotes();
    getIt<ILogger>()
        .info('${seventvGlobalEmotes.length} emotes loaded form 7tv global');

    setState(() {
      channelEmoteItems = seventvEmotesToList(seventvChannelEmotes);
      globalEmoteItems = seventvEmotesToList(seventvGlobalEmotes);
    });
  }

  List<Widget> seventvEmotesToList(List<SeventvEmote> emotes) {
    return emotes
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
