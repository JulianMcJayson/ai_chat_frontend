import 'package:ai_chat_frontend/chat/controllers/chat_controller.dart';
import 'package:ai_chat_frontend/chat/message_view.dart';
import 'package:ai_chat_frontend/chat/models/message.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text('Chat AI'),
        backgroundColor: const Color.fromARGB(255, 141, 183, 255),
      ),
      body: Column(
        children: [
          Expanded(
              child: GestureDetector(
            onTap: () {
              context.read<ChatController>().focusNode.unfocus();
            },
            child: Align(
              alignment: Alignment.topCenter,
              child: Selector<ChatController, List<Message>>(
                selector: (context, controller) =>
                    controller.messages.reversed.toList(),
                builder: (context, messages, child) {
                  return ListView.separated(
                      shrinkWrap: true,
                      reverse: true,
                      padding: const EdgeInsets.only(top: 12, bottom: 20) +
                          const EdgeInsets.symmetric(horizontal: 12),
                      separatorBuilder: (_, __) => const SizedBox(height: 12),
                      controller:
                          context.read<ChatController>().scrollController,
                      itemCount: messages.length,
                      itemBuilder: (context, index) {
                        return MessageView(message: messages[index]);
                      });
                },
              ),
            ),
          )),
          const ChatInput(),
        ],
      ),
    );
  }
}

class ChatInput extends StatelessWidget {
  const ChatInput({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        bottom: true,
        child: Container(
          constraints: const BoxConstraints(minHeight: 48),
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Colors.grey.shade300,
              ),
            ),
          ),
          child: Stack(
            children: [
              TextField(
                focusNode: context.read<ChatController>().focusNode,
                onChanged: context.read<ChatController>().onFieldChange,
                controller: context.read<ChatController>().textController,
                maxLines: null,
                textAlignVertical: TextAlignVertical.top,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.only(
                    right: 42,
                    left: 16,
                    top: 18,
                  ),
                  hintText: "Type a message",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              Positioned(
                  bottom: 0,
                  right: 0,
                  child: IconButton(
                      onPressed: context.read<ChatController>().sendMessage,
                      icon: Icon(Icons.send)))
            ],
          ),
        ));
  }
}
