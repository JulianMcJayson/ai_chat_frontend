import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ai_chat_frontend/chat/models/chat_request.dart';
import 'package:ai_chat_frontend/chat/models/chat_response.dart';

// http://ec2-98-84-171-179.compute-1.amazonaws.com/

class ApiClient {
  Future<ChatResponse> sendMessage(ChatRequest message) async {
    final response = await http.post(
      Uri.parse("http://localhost:8080/api/v1/send_message"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(message.toJson()),
    );

    if (response.statusCode == 200) {
      return ChatResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception(
          "Failed to send message \n code : ${response.statusCode}");
    }
  }
}
