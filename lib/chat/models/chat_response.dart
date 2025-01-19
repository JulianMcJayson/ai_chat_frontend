import 'package:ai_chat_frontend/chat/models/choice.dart';

class ChatResponse {
  final String id;
  final String object;
  final int created;
  final String model;
  final List<Choice> choices;

  const ChatResponse({
    required this.id,
    required this.object,
    required this.created,
    required this.model,
    required this.choices,
  });

  factory ChatResponse.fromJson(Map<String, dynamic> json) {
    final List<Choice> choices = [];
    if (json['choices'] != null) {
      json['choices'].forEach((v) {
        choices.add(Choice.fromJson(v));
      });
    }

    return ChatResponse(
      id: json['id'],
      object: json['object'],
      created: json['created'],
      model: json['model'],
      choices: choices,
    );
  }
}
