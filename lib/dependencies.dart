import 'package:ai_chat_frontend/chat/controllers/chat_controller.dart';
import 'package:ai_chat_frontend/chat/repositories/chat_repository.dart';
import 'package:ai_chat_frontend/chat/repository_remotes/chat_repository_remote.dart';
import 'package:ai_chat_frontend/chat/services/api_client.dart';
import 'package:ai_chat_frontend/app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Dependencies {
  const Dependencies();
  void appInjection() {
    runApp(
      MultiProvider(providers: [
        Provider(create: (context) => ApiClient()),
        Provider(
          create: (context) => ChatRepositoryRemote(
            apiClient: context.read<ApiClient>()
            ) as ChatRepository
          ),
        ChangeNotifierProvider(create: (context) => 
          ChatController(chatRepository: context.read<ChatRepository>()))
        ],
        child: const App(),
      )
    );
  }
}
