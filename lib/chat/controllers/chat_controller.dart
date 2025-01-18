import 'package:ai_chat_frontend/chat/message.dart';
import 'package:ai_chat_frontend/chat/models/message_response.dart';
import 'package:flutter/material.dart';

class ChatController extends ChangeNotifier {
  List<Message> messages = [];

  late final ScrollController scrollController = ScrollController();
  late final TextEditingController textController = TextEditingController();
  late final FocusNode focusNode = FocusNode();

  Future<void> sendMessage() async {
    if (isTextFieldEmpty) {
      return;
    }

    messages.add(Message(
      message: MessageResponse(
        text: textController.text,
        isBot: false,
      ),
    ));

    scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 300), 
      curve: Curves.easeInOut);

    textController.clear();
    notifyListeners();

    await Future.delayed(const Duration(seconds: 2));

    messages.add(Message(
      message: MessageResponse(
        text: "Hello, I'm a bot",
        isBot: true,
      ),
    ));

    scrollController.animateTo(
    0,
    duration: const Duration(milliseconds: 300), 
    curve: Curves.easeInOut);

    notifyListeners();
  }

  void onFieldChange() {
    notifyListeners();
  }

  bool get isTextFieldEmpty => textController.text.isEmpty;
}
