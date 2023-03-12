// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:feels_dank_man/api/seventv/seventv_api_client.dart';
import 'package:feels_dank_man/api/seventv/seventv_emote.dart';
import 'package:feels_dank_man/app.dart';
import 'package:feels_dank_man/utility/logging/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

void main() {
  // TODO: use mockito
  setUpAll(() {
    GetIt.instance.registerLazySingleton<ILogger>(ConsoleLogger.new);
    GetIt.instance.registerLazySingleton<ISeventvApiClient>(
      () => MockSeventvApiClient(),
    );
  });
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('FeelsDankMan'), findsOneWidget);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.emoji_emotions_outlined));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('Channel Emotes'), findsOneWidget);
  });
}

class MockSeventvApiClient implements ISeventvApiClient {
  @override
  Future<List<SeventvEmote>> getChannelEmotes(String channelId) async {
    return [];
  }

  @override
  Future<List<SeventvEmote>> getGlobalEmotes() async {
    return [];
  }
}
