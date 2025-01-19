import 'package:ai_chat_frontend/chat/models/message.dart';

class ChatRequest {
  final String model;
  final Message message;

  const ChatRequest({
    required this.model,
    required this.message,
  });

  Map<String, dynamic> toJson() {
    return {
      'model': model,
      'message': message.toJson(),
    };
  }
}