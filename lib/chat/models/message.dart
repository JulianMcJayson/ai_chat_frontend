class Message {
  final String role;
  final String content;

  const Message({
    required this.role,
    required this.content,
  });

  factory Message.sent({required String role, required String content}) =>
      Message(role: role, content: content);
}
