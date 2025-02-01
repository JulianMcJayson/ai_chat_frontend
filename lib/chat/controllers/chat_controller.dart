import 'package:ai_chat_frontend/chat/models/chat_request.dart';
import 'package:ai_chat_frontend/chat/models/message.dart';
import 'package:ai_chat_frontend/chat/repositories/chat_repository.dart';
import 'package:flutter/material.dart';

class ChatController extends ChangeNotifier {
  ChatController({
    required ChatRepository chatRepository,
  }) : _chatRepository = chatRepository;

  final ChatRepository _chatRepository;
  List<Message> messages = [];

  late final ScrollController scrollController = ScrollController();
  late final TextEditingController textController = TextEditingController();
  late final FocusNode focusNode = FocusNode();
  late bool onSending = false;

  Future<void> sendMessage() async {
    if (!isTextFieldEnable) {
      return;
    }

    onSending = true;

    ChatRequest message = ChatRequest(message: textController.text);

    messages.add(Message(content: textController.text, role: "user"));

    scrollController.animateTo(0,
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);

    textController.clear();
    notifyListeners();
    try {
      final response = await _chatRepository.sendMessage(message);

      messages.add(response.message);

      resetInput();
    } catch (e) {
      resetInput();
    }
  }

  void resetInput() {
    onSending = false;
    scrollController.animateTo(0,
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);

    notifyListeners();
  }

  void clearMessages() {
    messages.clear();
    notifyListeners();
  }

  void onFieldChange(String term) {
    notifyListeners();
  }

  bool get isTextFieldEnable => textController.text.isNotEmpty;
}
