import 'package:ai_chat_frontend/chat/models/message.dart';

class ChatResponse {
  final String id;
  final int sessionId;
  final int created;
  final String model;
  final Message message;

  const ChatResponse({
    required this.id,
    required this.sessionId,
    required this.created,
    required this.model,
    required this.message,
  });

  factory ChatResponse.fromJson(Map<String, dynamic> json) {
    Message message = Message.fromJson(json['message']);
    return ChatResponse(
      id: json['id'],
      sessionId: json['session_id'],
      created: json['created'],
      model: json['model'],
      message: message,
    );
  }
}
