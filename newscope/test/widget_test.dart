import 'package:flutter_test/flutter_test.dart';
import 'package:newscope/app/news_scope_app.dart';

void main() {
  testWidgets('shows NewsScope splash branding', (tester) async {
    await tester.pumpWidget(const NewsScopeApp());

    expect(find.text('NewsScope'), findsOneWidget);
    expect(find.text('Starting in 3'), findsOneWidget);
  });
}
