import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:studyhive/shared/theme/theme.dart';
import 'package:studyhive/shared/ui/snackbars.dart';

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
          icon: const Icon(Icons.close),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: ElevatedButton(
                onPressed: () {
                  showSuccessSnackbar(message: "Posted");
                },
                child: const Text("Post")),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(14),
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 4.0),
                  child: Icon(
                    IconlyLight.user_1,
                    size: 19,
                  ),
                ),
                Text(
                  "Private to My Hive",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          TextFormField(
            keyboardType: TextInputType.multiline,
            maxLines: null,
            minLines: 1,
            decoration: const InputDecoration(
              contentPadding: inputPadding,
              hintText: "Share your thoughts...",
            ),
          ),
        ],
      ),
    );
  }
}
