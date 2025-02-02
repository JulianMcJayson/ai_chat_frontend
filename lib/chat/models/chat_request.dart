class ChatRequest {
  final String message;
  final int sessionId;

  const ChatRequest({
    required this.message,
    required this.sessionId,
  });

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'session_id': sessionId,
    };
  }
}
