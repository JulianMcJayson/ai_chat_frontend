import 'package:ai_chat_frontend/chat/models/message.dart';

class Choice {
  final int index;
  final Message message;
  final String? finishReason;

  const Choice({
    required this.index,
    required this.message,
    this.finishReason,
  });

  factory Choice.fromJson(Map<String, dynamic> json) {
    return Choice(
      index: json['index'],
      message: Message.fromJson(json['message']),
      finishReason: json['finish_reason'],
    );
  }
}
