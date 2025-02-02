import 'package:ai_chat_frontend/chat/models/chat_list.dart';
import 'package:ai_chat_frontend/chat/models/chat_request.dart';
import 'package:ai_chat_frontend/chat/models/chat_response.dart';
import 'package:ai_chat_frontend/chat/models/message.dart';
import 'package:ai_chat_frontend/chat/repositories/chat_repository.dart';
import 'package:flutter/material.dart';

class ChatController extends ChangeNotifier {
  ChatController({
    required ChatRepository chatRepository,
  }) : _chatRepository = chatRepository;

  final ChatRepository _chatRepository;
  late int _indexId = 0;
  late ChatList _currentChat = ChatList(
    id: 0,
    created: DateTime.now(),
    name: "Chat 0",
    messages: [],
  );

  final List<ChatList> _chatLists = [];

  late final ScrollController scrollController = ScrollController();
  late final TextEditingController textController = TextEditingController();
  late final FocusNode focusNode = FocusNode();
  late bool _onSending = false;

  Future<void> sendMessage() async {
    if (!isTextFieldEnable) {
      return;
    }

    _onSending = true;

    ChatRequest message =
        ChatRequest(message: textController.text, sessionId: _currentChat.id);

    _currentChat.messages
        .add(Message(content: textController.text, role: "user"));

    scrollController.animateTo(0,
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);

    textController.clear();
    notifyListeners();
    try {
      final response = await _chatRepository.sendMessage(message);

      addMessageToChatList(response);

      addNewChat(_currentChat);

      resetInput();
    } catch (e) {
      _currentChat.messages.add(Message(
        content:
            "Something went wrong while sending the message, please try again later.",
        role: "assistant",
      ));
      resetInput();
    }
  }

  void resetInput() {
    _onSending = false;
    scrollController.animateTo(0,
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);

    notifyListeners();
  }

  void createNewChat() {
    if (_currentChat.messages.isNotEmpty) {
      _indexId++;
      _chatLists.add(ChatList(
        id: _indexId,
        created: DateTime.now(),
        name: "Chat $_indexId",
        messages: [],
      ));

      addNewChat(_chatLists.last);
    }
  }

  void addNewChat(ChatList chatList) {
    if (_currentChat != chatList) {
      _currentChat = chatList;
    }

    if (!_chatLists.contains(chatList)) {
      _chatLists.add(chatList);
    }

    notifyListeners();
  }

  void setChat(ChatList chatList) {
    _currentChat = chatList;
    notifyListeners();
  }

  void addMessageToChatList(ChatResponse response) {
    if (_currentChat.id == response.sessionId) {
      _currentChat.messages.add(response.message);
    } else {
      final chat =
          _chatLists.firstWhere((element) => element.id == response.sessionId);
      chat.messages.add(response.message);
    }
    notifyListeners();
  }

  void onFieldChange(String term) {
    notifyListeners();
  }

  bool get canAddChat {
    if (_chatLists.isEmpty) {
      return false;
    }

    return _chatLists.last.messages.isNotEmpty;
  }

  bool get isTextFieldEnable => textController.text.isNotEmpty;
  bool get onSendingMessage => _onSending;
  ChatList get chatList => _currentChat;
  List<ChatList> get chatLists => _chatLists;
}
