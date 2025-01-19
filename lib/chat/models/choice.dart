import 'package:ai_chat_frontend/chat/models/LogProbs.dart';
import 'package:ai_chat_frontend/chat/models/message.dart';

class Choice {
  final int index;
  final Message message;
  final Logprobs? logprobs;
  final String finishReason;

  const Choice({
    required this.index,
    required this.message,
    this.logprobs,
    required this.finishReason,
  });

  factory Choice.fromJson(Map<String, dynamic> json) {
    return Choice(
      index: json['index'],
      message: Message.fromJson(json['message']),
      logprobs: json['logprobs'] != null ? Logprobs.fromJson(json['logprobs']) : null,
      finishReason: json['finish_reason'],
    );
  }
}
