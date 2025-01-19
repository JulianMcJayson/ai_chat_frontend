import 'package:ai_chat_frontend/chat/models/choice.dart';
import 'package:ai_chat_frontend/chat/models/usage.dart';

class ChatResponse {
  final String id;
  final String object;
  final int created;
  final String model;
  final List<Choice> choices;
  final Usage usage;
  final String systemFingerprint;

  const ChatResponse({
    required this.id,
    required this.object,
    required this.created,
    required this.model,
    required this.choices,
    required this.usage,
    required this.systemFingerprint,
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
      usage: Usage.fromJson(json['usage']),
      systemFingerprint: json['system_fingerprint'],
    );
  }
}
