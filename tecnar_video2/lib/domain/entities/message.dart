class Message {

  final String text;

  final bool isUser;

  final String? imageUrl;

  Message({
    required this.text,
    required this.isUser,
    this.imageUrl,
  });
}