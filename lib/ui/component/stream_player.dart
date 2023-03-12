import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class StreamPlayer extends StatefulWidget {
  const StreamPlayer({super.key});

  @override
  State<StreamPlayer> createState() => _StreamPlayerState();
}

class _StreamPlayerState extends State<StreamPlayer> {
  late WebViewController webViewController;

  @override
  void initState() {
    super.initState();
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      // ..setBackgroundColor(Colors.red)
      // ..setNavigationDelegate(
      //   NavigationDelegate(onProgress: ((progress) => print(progress))),
      // )
      ..loadRequest(Uri.parse(
        'https://player.twitch.tv/?channel=ymdarake&enableExtensions=true&muted=true&parent=twitch.tv',
      ));
  }

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(controller: webViewController);
  }
}
