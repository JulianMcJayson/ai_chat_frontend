import 'package:ai_chat_frontend/chat/models/message.dart';

class Choice {
  final Message message;

  const Choice({
    required this.message,
  });

  factory Choice.fromJson(Map<String, dynamic> json) {
    return Choice(
      message: Message.fromJson(json['message']),
    );
  }
}
