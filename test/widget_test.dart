import 'package:flutter_test/flutter_test.dart';
import 'package:focal_project/main.dart';


void main() {
  testWidgets('onboarding screen renders its first slide content', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Description Text 1'), findsOneWidget);
  });
}
