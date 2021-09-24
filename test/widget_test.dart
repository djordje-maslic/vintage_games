// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:vintage_games/main.dart';

void main() {
  testWidgets(
    'test appBar title',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: MyApp(),
        ),
      );

      expect(find.text("Bruce’s Retro Games"), findsOneWidget);

    },
  );

   testWidgets(
    'test text form field decoration',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: MyApp(),
        ),
      );

            expect(find.text("search games"), findsOneWidget);

    },
  );
}
