import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ChatScreen"),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Chat Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
