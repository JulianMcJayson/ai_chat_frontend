import 'package:ai_chat_frontend/chat/models/message.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        Flexible(
          child: Container(
            padding: const EdgeInsets.all(10),
            margin: EdgeInsets.only(
              left: message.role == "assistant" ? 0 : 50,
              right: message.role == "assistant" ? 50 : 0,
            ),
            decoration: BoxDecoration(
              color: message.role == "assistant"
                  ? const Color.fromRGBO(235, 243, 248, 1)
                  : null,
              gradient: message.role != "assistant"
                  ? LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        const Color.fromRGBO(63, 186, 227, 1),
                        const Color.fromRGBO(51, 122, 200, 1)
                      ],
                    )
                  : null,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(10),
                topRight: const Radius.circular(10),
                bottomLeft:
                    Radius.circular(message.role == "assistant" ? 0 : 10),
                bottomRight:
                    Radius.circular(message.role == "assistant" ? 10 : 0),
              ),
            ),
            child: Text(
              overflow: TextOverflow.clip,
              message.content,
              style: GoogleFonts.ibmPlexSansThai(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: message.role == "assistant"
                    ? Color.fromRGBO(49, 59, 65, 1)
                    : Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  MainAxisAlignment get mainAxisAlignment => message.role == "assistant"
      ? MainAxisAlignment.start
      : MainAxisAlignment.end;
}
