import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class InappWebviewStreamPlayer extends StatefulWidget {
  const InappWebviewStreamPlayer({super.key});

  @override
  State<InappWebviewStreamPlayer> createState() =>
      _InappWebviewStreamPlayerState();
}

class _InappWebviewStreamPlayerState extends State<InappWebviewStreamPlayer> {
  InAppWebViewController? webViewController;
  // InAppWebViewSettings settings = InAppWebViewSettings(
  //   useShouldOverrideUrlLoading: true,
  //   mediaPlaybackRequiresUserGesture: false,
  //   allowsInlineMediaPlayback: true,
  //   iframeAllow: "camera; microphone",
  //   iframeAllowFullscreen: true,
  // );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InAppWebView(
      initialUrlRequest: URLRequest(
        url: Uri.parse(
          'https://player.twitch.tv/?channel=ymdarake&enableExtensions=true&muted=true&parent=twitch.tv',
        ),
      ),
      onWebViewCreated: (controller) {
        webViewController = controller;
      },
    );
  }
}
