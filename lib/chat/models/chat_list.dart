import 'package:ai_chat_frontend/chat/models/message.dart';

class ChatList {
  final int id;
  final DateTime created;
  final String name;
  final List<Message> messages;

  const ChatList({
    required this.id,
    required this.created,
    required this.name,
    required this.messages,
  });
}
