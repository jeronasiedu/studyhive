import 'package:flutter/material.dart';

class NewChatPage extends StatelessWidget {
  const NewChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            splashRadius: 20,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.close)),
      ),
      body: const Center(child: Text('New Chat')),
    );
  }
}
