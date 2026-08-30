import 'package:flutter_test/flutter_test.dart';
import 'package:agrinnov_website/main.dart';

void main() {
  testWidgets('Smoke test for AgrinnovApp', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const AgrinnovApp());

    // Verify that some key elements are present.
    expect(find.textContaining('agri'), findsWidgets);
    expect(find.textContaining('innov'), findsWidgets);
  });
}
