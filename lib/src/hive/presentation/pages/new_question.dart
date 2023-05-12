import 'package:flutter/material.dart';

class NewQuestion extends StatelessWidget {
  const NewQuestion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          splashRadius: 20,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.close),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: ElevatedButton(onPressed: () {}, child: const Text("Ask")),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(14),
        children: [],
      ),
    );
  }
}
