import 'package:feels_dank_man/api/seventv/seventv_api_client.dart';
import 'package:feels_dank_man/core/http_client.dart';
import 'package:feels_dank_man/main_integration_test.dart' as main_for_test;
import 'package:feels_dank_man/utility/logging/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  // TODO: use mockito
  setUpAll(() {
    GetIt.instance.registerLazySingleton<ILogger>(ConsoleLogger.new);
    GetIt.instance.registerLazySingleton<ISeventvApiClient>(
      () => SeventvApiClientImpl(
        httpClient: HttpClient(),
      ),
    );
  });

  testWidgets("example", (WidgetTester tester) async {
    main_for_test.main();
    await tester.pumpAndSettle();

    await Future.delayed(const Duration(seconds: 5));

    expect(find.text('FeelsDankMan'), findsOneWidget);
  });

  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    main_for_test.main();
    await tester.pumpAndSettle();

    // Verify that our counter starts at 0.
    expect(find.text('FeelsDankMan'), findsOneWidget);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.emoji_emotions_outlined));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('Channel Emotes'), findsOneWidget);
  });
}
