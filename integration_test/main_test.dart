import 'package:feels_dank_man/main.dart' as entry;
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("example", (WidgetTester tester) async {
    entry.main();

    await tester.pumpAndSettle();
    await Future.delayed(const Duration(seconds: 5));

    expect(find.text('FeelsDankMan'), findsOneWidget);
  });
}
