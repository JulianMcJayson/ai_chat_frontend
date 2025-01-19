import 'package:ai_chat_frontend/chat/models/message.dart';
import 'package:flutter/material.dart';

class ChatController extends ChangeNotifier {
  List<Message> messages = [];

  late final ScrollController scrollController = ScrollController();
  late final TextEditingController textController = TextEditingController();
  late final FocusNode focusNode = FocusNode();

  Future<void> sendMessage() async {
    if (!isTextFieldEnable) {
      return;
    }

    messages.add(
      Message(
        role: "user",
        content: textController.text,
      ),
    );

    scrollController.animateTo(0,
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);

    textController.clear();
    notifyListeners();

    await Future.delayed(const Duration(seconds: 2));

    messages.add(
      Message(
        role: "bot",
        content: "Hello, how can I help you?",
      ),
    );

    scrollController.animateTo(0,
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);

    notifyListeners();
  }

  void onFieldChange(String term) {
    notifyListeners();
  }

  bool get isTextFieldEnable => textController.text.isNotEmpty;
}
