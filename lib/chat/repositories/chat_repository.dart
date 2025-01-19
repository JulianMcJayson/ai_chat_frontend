import 'package:ai_chat_frontend/chat/models/chat_request.dart';
import 'package:ai_chat_frontend/chat/models/chat_response.dart';

abstract class ChatRepository {
  Future<ChatResponse> sendMessage (ChatRequest message);
}