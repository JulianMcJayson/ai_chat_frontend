import 'package:ai_chat_frontend/chat/controllers/chat_controller.dart';
import 'package:ai_chat_frontend/chat/models/chat_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChatListView extends StatelessWidget {
  final ChatList chatList;
  const ChatListView({super.key, required this.chatList});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ChatController>();

    return ListTile(
      title: Text(
        chatList.name,
        style: GoogleFonts.ibmPlexSansThai(
            color: Colors.black, fontWeight: FontWeight.w400, fontSize: 16),
      ),
      trailing: IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz)),
      shape: Border(
        bottom: BorderSide(
          color: Colors.grey.shade300,
          width: 1,
        ),
      ),
      onTap: controller.chatList != chatList
          ? () {
              controller.setChat(chatList);
              Navigator.pop(context);
            }
          : null,
    );
  }
}
