import 'package:ai_chat_frontend/chat/models/message_response.dart';
import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  final EdgeInsetsGeometry? margin;
  final MessageResponse message;

  const Message({super.key, this.margin, required this.message});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: margin ?? EdgeInsets.zero,
          child: Text(
            message.text,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }

  MainAxisAlignment get mainAxisAlignment =>
      message.isBot ? MainAxisAlignment.start : MainAxisAlignment.end;
}
