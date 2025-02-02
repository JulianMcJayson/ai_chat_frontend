import 'package:ai_chat_frontend/chat/controllers/chat_controller.dart';

import 'package:ai_chat_frontend/chat/views/chat_list_view.dart';
import 'package:ai_chat_frontend/chat/views/message_view.dart';
import 'package:ai_chat_frontend/chat/models/message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gradient_icon/gradient_icon.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ChatView oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ChatController>();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        leading: Builder(builder: (context) {
          return IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        }),
        actions: [
          IconButton(
              onPressed: controller.canAddChat
                  ? () {
                      controller.createNewChat();
                    }
                  : null,
              icon: const Icon(Icons.add_comment)),
          IconButton(
            icon: const Icon(Icons.more_horiz),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        child: Column(
          children: [
            SizedBox(
              height: 100,
              child: DrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Row(
                  spacing: 10,
                  children: [
                    Container(
                      width: 45,
                      height: 45,
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color.fromRGBO(63, 186, 227, 1),
                                Color.fromRGBO(51, 122, 200, 1)
                              ])),
                      child: CircleAvatar(
                        radius: 45,
                      ),
                    ),
                    Expanded(
                      flex: 15,
                      child: Text(
                        'Jaratpong Meethumkaewkla',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.ibmPlexSansThai(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    IconButton(onPressed: () {}, icon: Icon(Icons.settings))
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(15),
              height: 45,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(150),
                  border: Border.all(
                    color: Color.fromRGBO(63, 186, 227, 1),
                    width: 2,
                  ),
                ),
                child: TextButton(
                    iconAlignment: IconAlignment.start,
                    onPressed: controller.canAddChat
                        ? () {
                            controller.createNewChat();
                          }
                        : null,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 10,
                      children: [
                        GradientIcon(
                            icon: Icons.add_comment,
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color.fromRGBO(63, 186, 227, 1),
                                  Color.fromRGBO(51, 122, 200, 1)
                                ]),
                            size: 25,
                            offset: Offset(0, 0)),
                        GradientText(
                          'New Chat',
                          style: GoogleFonts.ibmPlexSansThai(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                          colors: [
                            Color.fromRGBO(63, 186, 227, 1),
                            Color.fromRGBO(51, 122, 200, 1)
                          ],
                        )
                      ],
                    )),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return ChatListView(chatList: controller.chatLists[index]);
                },
                itemCount: controller.chatLists.length,
              ),
            )
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
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
                        controller.chatList.messages.reversed.toList(),
                    builder: (context, messages, child) {
                      return ListView.separated(
                          shrinkWrap: true,
                          reverse: true,
                          padding: const EdgeInsets.only(top: 12, bottom: 20) +
                              const EdgeInsets.symmetric(horizontal: 12),
                          separatorBuilder: (_, __) =>
                              const SizedBox(height: 12),
                          controller:
                              context.read<ChatController>().scrollController,
                          itemCount: messages.length,
                          itemBuilder: (context, index) {
                            return MessageView(message: messages[index]);
                          });
                    },
                  ),
                ),
              ),
            ),
            ChatInput(),
          ],
        ),
      ),
    );
  }
}

class ChatInput extends StatelessWidget {
  const ChatInput({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ChatController>();
    return SafeArea(
      bottom: true,
      child: Container(
        constraints: const BoxConstraints(minHeight: 120),
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Color.fromARGB(255, 235, 243, 248),
          border: Border(
            top: BorderSide(
              color: Colors.white,
            ),
          ),
        ),
        child: Stack(
          children: [
            TextField(
              focusNode: controller.focusNode,
              onChanged: controller.onFieldChange,
              controller: controller.textController,
              maxLines: null,
              textAlignVertical: TextAlignVertical.top,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: const EdgeInsets.only(
                  right: 42,
                  left: 16,
                  top: 18,
                ),
                hintText: "พิมพ์ข้อความ...",
                hintStyle: GoogleFonts.ibmPlexSansThai(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Color.fromRGBO(49, 59, 65, 1),
                ),
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
                  onPressed: !controller.onSendingMessage
                      ? controller.sendMessage
                      : null,
                  icon: !controller.onSendingMessage &&
                          controller.isTextFieldEnable
                      ? GradientIcon(
                          icon: Icons.send,
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color.fromRGBO(63, 186, 227, 1),
                              Color.fromRGBO(51, 122, 200, 1),
                            ],
                          ),
                          size: 30,
                          offset: Offset(0, 0),
                        )
                      : SvgPicture.asset('assets/icons/cat_button_send.svg')),
            )
          ],
        ),
      ),
    );
  }
}
