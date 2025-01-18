import 'package:ai_chat_frontend/chat/chat.dart';
import 'package:ai_chat_frontend/chat/controllers/chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "AI Chat",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
        create: (_) => ChatController(),
        child: const Chat(),
      ),
    );
  }
}
