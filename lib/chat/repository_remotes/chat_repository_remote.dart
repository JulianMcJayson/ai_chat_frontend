import 'package:ai_chat_frontend/chat/models/chat_request.dart';
import 'package:ai_chat_frontend/chat/models/chat_response.dart';
import 'package:ai_chat_frontend/chat/repositories/chat_repository.dart';
import 'package:ai_chat_frontend/chat/services/api_client.dart';

class ChatRepositoryRemote extends ChatRepository {
  final ApiClient _apiClient;

  ChatRepositoryRemote({required ApiClient apiClient}) : _apiClient = apiClient;

  @override
  Future<ChatResponse> sendMessage(ChatRequest message) async {
    final response = await _apiClient.sendMessage(message);
    return response;
  }
}
