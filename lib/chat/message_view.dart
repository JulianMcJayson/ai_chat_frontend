
import 'package:ai_chat_frontend/chat/models/message.dart';
import 'package:flutter/material.dart';

class MessageView extends StatelessWidget {
  final EdgeInsetsGeometry? margin;
  final Message message;

  const MessageView({super.key, this.margin, required this.message});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(child: 
          Container(
            margin: margin ?? EdgeInsets.zero,
            child: Text(
              overflow: TextOverflow.clip,

              message.content,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }

  MainAxisAlignment get mainAxisAlignment =>
      message.role == "assistant" ? MainAxisAlignment.start : MainAxisAlignment.end;
}
