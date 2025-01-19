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

  Future<void> sendMessage() async {
    if (!isTextFieldEnable) {
      return;
    }

    ChatRequest message = ChatRequest(
      model: "4o",
      message:Message(
        role: "user",
        content: textController.text,
      ),
    );

    messages.add(message.message);

    scrollController.animateTo(0,
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);

    textController.clear();
    notifyListeners();

    final response = await _chatRepository.sendMessage(message);

    messages.add(response.choices[0].message);

    scrollController.animateTo(0,
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);

    notifyListeners();
  }

  void onFieldChange(String term) {
    notifyListeners();
  }

  bool get isTextFieldEnable => textController.text.isNotEmpty;
}
