import 'package:ai_chat_frontend/chat/models/message.dart';

class ChatRequest {
  final String model;
  final List<Message> messages;

  const ChatRequest({
    required this.model,
    required this.messages,
  });

  Map<String, dynamic> toJson() {
    return {
      'model': model,
      'messages': messages.map((e) => e.toJson()).toList(),
    };
  }
}