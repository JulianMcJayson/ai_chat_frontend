import 'package:ai_chat_frontend/chat/views/message_view.dart';
import 'package:ai_chat_frontend/chat/models/message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("test 'Message View' widget with user message", (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body:
            const MessageView(message: Message(role: "user", content: "Hello")),
      ),
    ));

    // Verify if the text "Hello" is found
    final textFinder = find.text("Hello");
    expect(textFinder, findsOneWidget);
  });

  testWidgets("test 'Message View' widget with system message", (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: const MessageView(
            message: Message(role: "system", content: "Welcome")),
      ),
    ));

    // Verify if the text "Welcome" is found
    final textFinder = find.text("Welcome");
    expect(textFinder, findsOneWidget);
  });

  testWidgets("test 'Message View' widget with empty message", (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: const MessageView(message: Message(role: "user", content: "")),
      ),
    ));

    // Verify if the empty text is found
    final textFinder = find.text("");
    expect(textFinder, findsOneWidget);
  });
}
