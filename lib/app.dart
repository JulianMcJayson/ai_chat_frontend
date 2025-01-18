import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "AI Chat",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("AI Chat"),
        ),
        body: Center(
          child: Text("Hello, World!"),
        ),
      ),
    );
  }
}
