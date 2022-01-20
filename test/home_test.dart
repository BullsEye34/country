import 'package:country/main.dart';
import 'package:country/provider/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

Widget createHomeScreen() => ChangeNotifierProvider<States>(
      create: (context) => States(),
      child: MaterialApp(
        home: MyApp(),
      ),
    );

void main() {
  group('Home Page Widget Tests', () {
    testWidgets('Testing Scrolling', (tester) async {
      await tester.pumpWidget(createHomeScreen());
      expect(find.text('Regions'), findsOneWidget);
      expect(find.text("Africa"), findsOneWidget);

      expect(find.text("Asia"), findsOneWidget);

      expect(find.text("Europe"), findsOneWidget);

      expect(find.text("Americas"), findsOneWidget);

      await tester.drag(
          find.byType(ShrinkWrappingViewport), const Offset(0.0, -400));
      await tester.pump();
      expect(find.text("Oceania"), findsOneWidget);

      await tester.pumpAndSettle();

      expect(find.text("Africa"), findsNothing);
    });
  });

  testWidgets("Test Africa", (tester) async {
    await tester.pumpWidget(createHomeScreen());
    expect(find.text('Regions'), findsOneWidget);
    expect(find.text("Africa"), findsOneWidget);
    await tester.tap(find.text("Africa"));
    expect(find.text("Africa"), findsOneWidget);

    await tester.pumpAndSettle();

    expect(find.text("Republic"), findsOneWidget);
  });
}
