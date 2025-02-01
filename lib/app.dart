import 'package:ai_chat_frontend/chat/chat_view.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Ask Me", theme: ThemeData.light(), home: const ChatView());
  }
}
