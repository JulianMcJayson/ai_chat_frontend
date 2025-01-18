class MessageResponse {
  final String text;
  final bool isBot;
  final DateTime? time;

  const MessageResponse({
    required this.text,
    required this.isBot,
    this.time,
  });

  factory MessageResponse.sent(
      {required String text, required bool isBot, DateTime? time}
    ) => 
    MessageResponse(text: text, isBot: isBot, time: DateTime.now().toUtc());
}
